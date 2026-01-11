package com.foodapp.dao;

import java.util.List;

import com.foodapp.model.Order;

public interface OrderDAO {
	int insertOrder(Order order);
    List<Order> getAllOrders();
    Order getOrderById(int orderId);
    int updateOrderStatusById(int orderId, String status);
    int deleteOrderById(int orderId);
	Order fetchOrderOnUserId(int userId);
	boolean insertOrder(int userId, int restaurantId, int totalAmount, String status, String paymentOption);
	boolean updateOrder(int orderId, String status);
}

