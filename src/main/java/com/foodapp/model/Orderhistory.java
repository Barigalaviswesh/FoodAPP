package com.foodapp.model;

import java.sql.Date;

public class Orderhistory {
    private int orderHistoryId;
    private int userId;
    private int orderId;
    private Date date;
    private float totalAmount;
    private String status;
    
    
    // Constructors
    public Orderhistory() {}

    public Orderhistory(int orderHistoryId, int userId, int orderId, Date date, float totalAmount, String status) {
        this.orderHistoryId = orderHistoryId;
        this.userId = userId;
        this.orderId = orderId;
        this.date = date;
        this.totalAmount = totalAmount;
        this.status = status;
    }

	public int getOrderHistoryId() {
		return orderHistoryId;
	}

	public void setOrderHistoryId(int orderHistoryId) {
		this.orderHistoryId = orderHistoryId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
