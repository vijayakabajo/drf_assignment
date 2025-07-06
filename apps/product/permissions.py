from rest_framework import permissions

#seller can create, upd, del product or get all products
class IsSellerOrReadOnly(permissions.BasePermission):  
    #allow any user to view products
    def has_permission(self, request, view):
        #allow anyone to view products
        if request.method in permissions.SAFE_METHODS:
            return True
        #if logged in and seller/post req, allow
        # print("User is authenticated:", request.user.is_authenticated)
        # print("User type is seller:", request.user.user_type == 'seller')
        return request.user.is_authenticated and request.user.user_type == 'seller'
    #allow seller to create/upd/del their own products
    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        return obj.seller == request.user

class IsOwnerOrReadOnly(permissions.BasePermission):
    
    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        return obj.seller == request.user