from rest_framework import serializers
from .models import Product
from apps.users.serializers import UserSerializer

class ProductSerializer(serializers.ModelSerializer):
    seller_info = UserSerializer(source='seller', read_only=True)
    is_in_stock = serializers.ReadOnlyField()  #as its a property
    
    class Meta:
        model = Product
        fields = [
            'id', 'name', 'description', 'price', 'stock', 
            'category', 'seller', 'seller_info',
            'is_in_stock', 'is_active', 'created_at', 'updated_at'
        ] 
        read_only_fields = ['id', 'seller', 'created_at', 'updated_at']
    
    def create(self, validated_data):
        #automatically set the seller to the current user
        validated_data['seller'] = self.context['request'].user
        return super().create(validated_data)

class ProductCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['name', 'description', 'price', 'stock', 'category']
    
    def validate_price(self, value):
        if value <= 0:
            raise serializers.ValidationError("Price must be greater than 0")
        return value
    
    def validate_stock(self, value):
        if value < 0:
            raise serializers.ValidationError("Stock cannot be negative")
        return value