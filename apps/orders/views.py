from django.shortcuts import render

# Create your views here.
from rest_framework import generics, permissions, status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from django.db.models import Q
from .models import Order, OrderItem
from .serializers import OrderSerializer, OrderCreateSerializer, OrderUpdateSerializer

class OrderListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type == 'buyer':
            # Buyers see only their orders
            return Order.objects.filter(buyer=user, is_active=True)
        elif user.user_type == 'seller':
            # Sellers see orders containing their products
            return Order.objects.filter(
                items__product__seller=user,
                is_active=True
            ).distinct()
        return Order.objects.none()
    
    def get_serializer_class(self):
        if self.request.method == 'POST':
            return OrderCreateSerializer
        return OrderSerializer
    
    def perform_create(self, serializer):
        # Only buyers can create orders
        if self.request.user.user_type != 'buyer':
            raise permissions.PermissionDenied("Only buyers can create orders")
        serializer.save()

class OrderDetailView(generics.RetrieveUpdateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type == 'buyer':
            return Order.objects.filter(buyer=user, is_active=True)
        elif user.user_type == 'seller':
            return Order.objects.filter(
                items__product__seller=user,
                is_active=True
            ).distinct()
        return Order.objects.none()
    
    def get_serializer_class(self):
        if self.request.method in ['PUT', 'PATCH']:
            return OrderUpdateSerializer
        return OrderSerializer

@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def cancel_order(request, order_id):
    try:
        if request.user.user_type != 'buyer':
            return Response(
                {'error': 'Only buyers can cancel orders'}, 
                status=status.HTTP_403_FORBIDDEN
            )
        
        order = Order.objects.get(id=order_id, buyer=request.user, is_active=True)
        
        if order.status in ['shipped', 'delivered']:
            return Response(
                {'error': 'Cannot cancel shipped or delivered orders'}, 
                status=status.HTTP_400_BAD_REQUEST
            )
        
        if order.status == 'cancelled':
            return Response(
                {'error': 'Order already cancelled'}, 
                status=status.HTTP_400_BAD_REQUEST
            )
        
        # Restore stock
        for item in order.items.all():
            product = item.product
            product.stock += item.quantity
            product.save()
        
        order.status = 'cancelled'
        order.save()
        
        return Response({
            'message': 'Order cancelled successfully',
            'order': OrderSerializer(order).data
        })
        
    except Order.DoesNotExist:
        return Response(
            {'error': 'Order not found'}, 
            status=status.HTTP_404_NOT_FOUND
        )

@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def my_orders(request):
    """Get current user's orders with filtering"""
    user = request.user
    
    if user.user_type == 'buyer':
        orders = Order.objects.filter(buyer=user, is_active=True)
    elif user.user_type == 'seller':
        orders = Order.objects.filter(
            items__product__seller=user,
            is_active=True
        ).distinct()
    else:
        orders = Order.objects.none()
    
    # Filter by status if provided
    status_filter = request.query_params.get('status', None)
    if status_filter:
        orders = orders.filter(status=status_filter)
    
    # Order by latest first
    orders = orders.order_by('-created_at')
    
    serializer = OrderSerializer(orders, many=True)
    return Response({
        'count': orders.count(),
        'orders': serializer.data
    })

@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def order_statistics(request):
    """Get order statistics for the user"""
    user = request.user
    
    if user.user_type == 'buyer':
        orders = Order.objects.filter(buyer=user, is_active=True)
        stats = {
            'total_orders': orders.count(),
            'pending_orders': orders.filter(status='pending').count(),
            'confirmed_orders': orders.filter(status='confirmed').count(),
            'shipped_orders': orders.filter(status='shipped').count(),
            'delivered_orders': orders.filter(status='delivered').count(),
            'cancelled_orders': orders.filter(status='cancelled').count(),
            'total_spent': sum(order.total_amount for order in orders if order.status != 'cancelled')
        }
    elif user.user_type == 'seller':
        orders = Order.objects.filter(
            items__product__seller=user,
            is_active=True
        ).distinct()
        stats = {
            'total_orders_received': orders.count(),
            'pending_orders': orders.filter(status='pending').count(),
            'confirmed_orders': orders.filter(status='confirmed').count(),
            'shipped_orders': orders.filter(status='shipped').count(),
            'delivered_orders': orders.filter(status='delivered').count(),
            'total_revenue': sum(order.total_amount for order in orders if order.status != 'cancelled')
        }
    else:
        stats = {}
    
    return Response(stats)