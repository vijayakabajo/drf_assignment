# 🛒 Django DRF E-Commerce Backend

## 🚀 Features
- JWT Authentication with Buyer/Seller roles
- Product listing, creation, and filtering
- Order creation, viewing, updating, and cancelation
- Role-specific access control
- "My Orders" endpoint with status filters
- Modular structure with separate apps (`users`, `product`, `orders`)

## ⚙️ Setup Instructions

1. Clone the Repository  
git clone https://github.com/vijayakabajo/drf_assignment.git  
cd drf_assignment

2. Create And Activate Virtual Environment  
python -m venv venv  
venv\Scripts\activate

3. Install Dependencies  
pip install -r requirements.txt

4. Create `.env` File  
At the root of the project, create a `.env` file:
i.e: AES_KEY=qwertyuiqwertyuiqwertyuiqwertyui

5. Apply Migrations Or Import DB(.sql)
python manage.py makemigrations  
python manage.py migrate

6. Run the Server  
python manage.py runserver

## 🔐 Authentication Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /api/users/register/ | Register a user (buyer or seller) |
| POST | /api/users/login/ | Login and receive JWT tokens |
| POST | /api/users/token/refresh/ | Refresh access token |
| POST | /api/users/logout/ | Simple Logout (No Logic, Just Logout Message) |

Authorization Header:  
Authorization: Bearer <your_token>

## 🛍️ Product Endpoints

| Method | Endpoint | Access | Description |
|--------|----------|--------|-------------|
| GET | /api/products/ | Public | List all products |
| POST | /api/products/ | Seller only | Add a new product |
| GET | /api/products/<id>/ | Authenticated | Get product detail |
| GET | /api/products/my-products/ | Seller | Get seller’s products |

## 📦 Order Endpoints

| Method | Endpoint | Access | Description |
|--------|----------|--------|-------------|
| GET | /api/orders/ | Buyer/Seller | Buyer: own orders, Seller: orders involving their products |
| POST | /api/orders/ | Buyer only | Create new order |
| GET | /api/orders/<id>/ | Buyer/Seller | Retrieve specific order |
| PUT/PATCH | /api/orders/<id>/ | Buyer | Update shipping address or status |
| GET | /api/orders/my-orders/?status=pending | Buyer/Seller | Filter current user’s orders by status |

## 🔄 /orders/ vs /my-orders/

| Endpoint | Purpose |
|----------|---------|
| /orders/ | Full CRUD with role-based logic. |
| /my-orders/ | Optimized for current user, supports filtering like ?status=delivered |



Use the provided Postman collection to test all APIs.
Link: https://www.postman.com/mission-technologist-85419837/workspace/ecom-assignment/folder/31776639-7abc0949-242c-4ae8-9c45-3d53eb6d2122?action=share&creator=31776639&ctx=documentation 


## 👨‍💻 Author

Built with ❤️ by [@vijayakabajo](https://github.com/vijayakabajo)
