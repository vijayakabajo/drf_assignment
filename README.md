# E-Commerce Backend API Documentation

This Django REST Framework project provides backend APIs for an e-commerce platform, supporting user management, product management, and order management for buyers and sellers.

---

## Table of Contents

- [Authentication & Users](#authentication--users)
- [Products](#products)
- [Orders](#orders)
- [Permissions](#permissions)
- [Example requirements.txt](#example-requirementstxt)
- [Usage](#usage)
- [Notes](#notes)

---

## Authentication & Users

### Register
- **POST `/api/users/register/`**
- Request:
  ```json
  {
    "username": "user1",
    "email": "user1@example.com",
    "password": "yourpassword",
    "user_type": "buyer" // or "seller"
  }
  ```
- Response:  
  `201 Created` with user info.

### Login
- **POST `/api/users/login/`**
- Request:
  ```json
  {
    "username": "user1",
    "password": "yourpassword"
  }
  ```
- Response:  
  Returns authentication token.

### User Profile
- **GET `/api/users/me/`**
- Response:  
  Returns current user's profile.

### Update Profile
- **PUT/PATCH `/api/users/me/`**
- Request:  
  Update fields as needed.

---

## Products

### List Products
- **GET `/api/products/`**
- Query params: `search`, `category`, etc.
- Response:  
  List of products.

### Retrieve Product
- **GET `/api/products/{id}/`**
- Response:  
  Product details.

### Create Product (Sellers only)
- **POST `/api/products/`**
- Request:
  ```json
  {
    "name": "Product Name",
    "description": "Details",
    "price": 100.0,
    "stock": 10,
    "category": "Category Name"
  }
  ```
- Response:  
  Created product.

### Update Product (Sellers only)
- **PUT/PATCH `/api/products/{id}/`**

### Delete Product (Sellers only)
- **DELETE `/api/products/{id}/`**

---

## Orders

### List & Create Orders
- **GET `/api/orders/`** — List orders for the current user.
- **POST `/api/orders/`** — Create a new order (buyers only).
  - Request:
    ```json
    {
      "items": [
        {"product": 1, "quantity": 2},
        {"product": 3, "quantity": 1}
      ]
    }
    ```

### Order Detail & Update
- **GET `/api/orders/{id}/`** — Retrieve order details.
- **PUT/PATCH `/api/orders/{id}/`** — Update an order (buyers only).

### Cancel Order
- **POST `/api/orders/{order_id}/cancel/`** — Cancel an order (buyers only).

### My Orders (with filtering)
- **GET `/api/orders/my-orders/?status=pending`** — List current user's orders, filterable by status.

### Order Statistics
- **GET `/api/orders/statistics/`** — Get order statistics for the current user.

---

## Permissions

- **Buyers:** Can register, login, view/update their profile, create/view/update/cancel their own orders.
- **Sellers:** Can register, login, view/update their profile, create/view/update/delete their own products, view orders containing their products.
- **All endpoints require authentication unless for registration/login.**

---

## Example: requirements.txt

```
Django>=3.2
djangorestframework
djangorestframework-simplejwt
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

- All endpoints (except registration and login) require authentication (e.g., JWT or Token).
- Use the `status` query parameter to filter orders by status (e.g., `/api/orders/my-orders/?status=shipped`).
- Adjust endpoint URLs and request/response formats as per your actual implementation.
