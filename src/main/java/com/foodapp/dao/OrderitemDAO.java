package com.foodapp.dao;

import java.util.List;



import com.foodapp.model.Orderitem;

public interface OrderitemDAO {
    
    void insertOrderhistory(int orderId, int menuId, int quantity, int subtotal);

    List<Orderitem> fetchOrderItems(int orderId);
    
	void insertOrderHistory(int userId, int orderId, int totalAmount, String status);

	int insertOrderhistory(Orderitem orderItem);
}