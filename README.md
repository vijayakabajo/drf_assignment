# E-Commerce Backend API Documentation

This Django REST Framework project provides backend APIs for an e-commerce platform, supporting order management for buyers and sellers.

---

## Features

- **Order Listing & Creation**
  - Buyers: View and create their own orders.
  - Sellers: View orders containing their products.

- **Order Detail & Update**
  - Buyers and sellers can view order details.
  - Buyers can update their orders.

- **Order Cancellation**
  - Only buyers can cancel their orders (if not shipped or delivered).
  - Cancelling an order restores product stock.

- **Order Filtering**
  - Orders can be filtered by status.

- **Order Statistics**
  - Buyers: See total orders, pending, confirmed, shipped, delivered, cancelled, and total spent.
  - Sellers: See total orders received, pending, confirmed, shipped, delivered, and total revenue.

---

## API Endpoints

### 1. List & Create Orders
- `GET /orders/` — List orders for the current user.
- `POST /orders/` — Create a new order (buyers only).

### 2. Order Detail & Update
- `GET /orders/{id}/` — Retrieve order details.
- `PUT/PATCH /orders/{id}/` — Update an order (buyers only).

### 3. Cancel Order
- `POST /orders/{order_id}/cancel/` — Cancel an order (buyers only).

### 4. My Orders (with filtering)
- `GET /orders/my-orders/` — List current user's orders, filterable by status.

### 5. Order Statistics
- `GET /orders/statistics/` — Get order statistics for the current user.

---

## Permissions

- **Buyers:** Can create, view, update, and cancel their own orders.
- **Sellers:** Can view orders containing their products.

---

## Example: requirements.txt

```
Django>=3.2
djangorestframework
```

---

## Usage

1. **Install dependencies:**
   ```
   pip install -r requirements.txt
   ```
2. **Run migrations:**
   ```
   python manage.py migrate
   ```
3. **Start the server:**
   ```
   python manage.py runserver
   ```

---

## Notes

- All endpoints require authentication.
- Use the `status` query parameter to filter orders by status (e.g., `/orders/my-orders/?status=shipped`).

---
