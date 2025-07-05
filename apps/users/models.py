from django.db import models
from django.contrib.auth.models import AbstractUser
from apps.common.models import BaseModel

class User(AbstractUser, BaseModel):    #extending the common's base model and Django's AbstractUser
    USER_TYPES = (
        ('buyer', 'Buyer'),
        ('seller', 'Seller')
    )
    
    email = models.EmailField(unique=True)
    user_type = models.CharField(max_length=10, choices=USER_TYPES)
    phone = models.CharField(max_length=15, blank=True)
    address = models.TextField(blank=True)
    
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'user_type']
    
    @property
    def is_seller(self):
        return self.user_type == 'seller'
    
    @property 
    def is_buyer(self):
        return self.user_type == 'buyer'
    
    def __str__(self):
        return f"{self.email} ({self.user_type})"