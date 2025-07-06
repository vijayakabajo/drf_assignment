from rest_framework import serializers
from django.contrib.auth import authenticate
from .models import User

class UserRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, min_length=8)
    password_confirm = serializers.CharField(write_only=True)
    
    class Meta:
        model = User
        fields = ('email', 'username', 'password', 'password_confirm', 
                 'user_type', 'phone', 'address')
    
    def validate(self, attrs):    #if pw did'nt match
        if attrs['password'] != attrs['password_confirm']:
            raise serializers.ValidationError("Passwords don't match")
        return attrs
    
    def create(self, validated_data):
        validated_data.pop('password_confirm')  #removed pw confirm
        user = User.objects.create_user(
            email=validated_data['email'],
            username=validated_data['username'],
            password=validated_data['password'],
            user_type=validated_data['user_type'],
            phone=validated_data.get('phone', ''),
            address=validated_data.get('address', '')
        )
        return user

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'email', 'username', 'user_type', 'phone', 
                 'address', 'created_at')
        read_only_fields = ('id', 'created_at') #for security reasons