from django.urls import reverse, resolve

# apps/orders/test_urls.py

from .views import (
    OrderListCreateView,
    OrderDetailView,
    cancel_order,
    my_orders,
    order_statistics,
)

def test_order_list_create_url():
    url = reverse('order-list-create')
    assert resolve(url).func.view_class == OrderListCreateView

def test_order_detail_url():
    url = reverse('order-detail', args=[1])
    assert resolve(url).func.view_class == OrderDetailView

def test_cancel_order_url():
    url = reverse('cancel-order', args=[1])
    assert resolve(url).func == cancel_order

def test_my_orders_url():
    url = reverse('my-orders')
    assert resolve(url).func == my_orders

def test_order_statistics_url():
    url = reverse('order-statistics')
    assert resolve(url).func == order_statistics