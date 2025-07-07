from rest_framework import serializers
from django.db import transaction
from .models import Order, OrderItem
from apps.product.models import Product

class OrderItemSerializer(serializers.ModelSerializer):
    product_name = serializers.CharField(source='product.name', read_only=True)
    product_price = serializers.DecimalField(source='product.price', max_digits=10, decimal_places=2, read_only=True)
    total_price = serializers.ReadOnlyField()
    
    class Meta:
        model = OrderItem
        fields = ('id', 'product', 'product_name', 'product_price', 'quantity', 'price', 'total_price')

class OrderSerializer(serializers.ModelSerializer):
    items = OrderItemSerializer(many=True, read_only=True)
    buyer_email = serializers.CharField(source='buyer.email', read_only=True)
    item_count = serializers.SerializerMethodField()
    
    class Meta:
        model = Order
        fields = ('id', 'buyer', 'buyer_email', 'status', 'total_amount',
                 'shipping_address', 'items', 'item_count', 'created_at', 'updated_at')
        read_only_fields = ('id', 'buyer', 'total_amount', 'created_at', 'updated_at')
    
    def get_item_count(self, obj):
        return obj.items.count()

class OrderCreateSerializer(serializers.ModelSerializer):
    items = serializers.ListField(write_only=True)
    
    class Meta:
        model = Order
        fields = ('shipping_address', 'items')
    
    def validate_items(self, value):
        if not value:
            raise serializers.ValidationError("Order must have at least one item")
        
        for item in value:
            if 'product_id' not in item:
                raise serializers.ValidationError("Each item must have a product_id")
            if 'quantity' not in item:
                raise serializers.ValidationError("Each item must have a quantity")
            if item['quantity'] <= 0:
                raise serializers.ValidationError("Quantity must be greater than 0")
        
        return value
    
    @transaction.atomic
    def create(self, validated_data):
        items_data = validated_data.pop('items')
        order = Order.objects.create(
            buyer=self.context['request'].user,
            **validated_data
        )
        
        total_amount = 0
        for item_data in items_data:
            product_id = item_data['product_id']
            quantity = item_data['quantity']
            
            try:
                product = Product.objects.get(id=product_id, is_active=True)
                if product.stock < quantity:
                    raise serializers.ValidationError(
                        f"Insufficient stock for {product.name}. Available: {product.stock}, Requested: {quantity}"
                    )
                
                order_item = OrderItem.objects.create(
                    order=order,
                    product=product,
                    quantity=quantity,
                    price=product.price
                )
                
                # Update stock
                product.stock -= quantity
                product.save()
                
                total_amount += order_item.total_price
                
            except Product.DoesNotExist:
                raise serializers.ValidationError(f"Product with id {product_id} not found")
        
        order.total_amount = total_amount
        order.save()
        
        return order

class OrderUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ('status', 'shipping_address')    #buyer can update status/shipping address add more if u want
    
    def validate_status(self, value):
        if self.instance and self.instance.status == 'delivered':
            raise serializers.ValidationError("Cannot update delivered order")
        if self.instance and self.instance.status == 'cancelled':
            raise serializers.ValidationError("Cannot update cancelled order")
        return value