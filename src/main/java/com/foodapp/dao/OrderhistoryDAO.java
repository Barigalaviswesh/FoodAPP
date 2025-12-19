package com.foodapp.dao;

import java.util.List;

import com.foodapp.dao.OrderhistoryDAO;

public interface OrderhistoryDAO {
	 com.foodapp.model.Orderhistory fetchOrderHistoryById(int id);  // Fetch order history by orderhistory_id

	    int insertOrderHistory(OrderhistoryDAO orderHistory);  // Insert order history details

	    int updateOrderHistoryStatusById(int id, String status);  // Update status by orderhistory_id

	    List<com.foodapp.model.Orderhistory> fetchOrderHistoryByUserId(int uid);  // Fetch order history by user_id

		int insertOrderHistory(com.foodapp.model.Orderhistory orderHistory);
	}
