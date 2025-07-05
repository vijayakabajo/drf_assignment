from rest_framework import generics, permissions, status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from .models import Product
from .serializers import ProductSerializer, ProductCreateSerializer
from .permissions import IsSellerOrReadOnly, IsOwnerOrReadOnly

class ProductListCreateView(generics.ListCreateAPIView):
    queryset = Product.objects.filter(is_active=True)
    
    def get_serializer_class(self):
        if self.request.method == 'POST':
            return ProductCreateSerializer
        return ProductSerializer
    
    def get_permissions(self):
        """
        Instantiates and returns the list of permissions that this view requires.
        """
        if self.request.method == 'POST':
            permission_classes = [permissions.IsAuthenticated, IsSellerOrReadOnly]
        else:
            permission_classes = [permissions.AllowAny]
        
        return [permission() for permission in permission_classes]
    
    def perform_create(self, serializer):
        # Automatically set the seller to the current user
        serializer.save(seller=self.request.user)

class ProductDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Product.objects.filter(is_active=True)
    serializer_class = ProductSerializer
    permission_classes = [permissions.IsAuthenticated, IsOwnerOrReadOnly]
    
    def perform_destroy(self, instance):
        # Soft delete - just set is_active to False
        instance.is_active = False
        instance.save()
        return Response({"message": "Product deleted successfully"}, status=status.HTTP_204_NO_CONTENT)

# Additional view to get seller's own products
class MyProductsView(generics.ListAPIView):
    serializer_class = ProductSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    def get_queryset(self):
        # Only return products of the current user if they're a seller
        if self.request.user.user_type == 'seller':
            return Product.objects.filter(seller=self.request.user, is_active=True)
        return Product.objects.none()