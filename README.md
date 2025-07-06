E-Commerce Backend
This project provides a RESTful backend for an e-commerce platform using Django and Django REST Framework. It supports order management for buyers and sellers.

Features
Order Listing & Creation

Buyers can view and create their own orders.
Sellers can view orders containing their products.
Order Detail & Update

Buyers and sellers can view order details.
Buyers can update their orders.
Order Cancellation

Only buyers can cancel their orders (if not shipped or delivered).
Cancelling an order restores product stock.
Order Filtering

Orders can be filtered by status.
Order Statistics

Buyers: See total orders, pending, confirmed, shipped, delivered, cancelled, and total spent.
Sellers: See total orders received, pending, confirmed, shipped, delivered, and total revenue.
API Endpoints
1. List & Create Orders
GET /orders/: List orders for the current user.
POST /orders/: Create a new order (buyers only).
2. Order Detail & Update
GET /orders/{id}/: Retrieve order details.
PUT/PATCH /orders/{id}/: Update an order (buyers only).
3. Cancel Order
POST /orders/{order_id}/cancel/: Cancel an order (buyers only).
4. My Orders (with filtering)
GET /orders/my-orders/: List current user's orders, filterable by status.
5. Order Statistics
GET /orders/statistics/: Get order statistics for the current user.
Permissions
Buyers: Can create, view, update, and cancel their own orders.
Sellers: Can view orders containing their products.
Example: requirements.txt
Usage
Install dependencies:
Run migrations:
Start the server:
Notes
All endpoints require authentication.
Use the status query parameter to filter orders by status (e.g., /orders/my-orders/?status=shipped).
For more details, see the code in views.py.
