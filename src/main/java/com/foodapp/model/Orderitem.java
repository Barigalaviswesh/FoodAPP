package com.foodapp.model;

public class Orderitem {
    private int orderitemId;
    private int orderId;
    private int menuId;
    private int quantity;
    private int subtotal;
    
    public Orderitem() {
		super();
	}

    public Orderitem(int orderitemId, int orderId, int menuId, int quantity, int subtotal) {
        this.orderitemId = orderitemId;
        this.orderId = orderId;
        this.menuId = menuId;
        this.quantity = quantity;
        this.subtotal = subtotal;
    }
    public Orderitem(int orderId, int menuId, int quantity, int itemTotal) {
        this.orderId = orderId;
        this.menuId = menuId;
        this.quantity = quantity;
        this.subtotal = subtotal;
    }
    
    @Override
    public String toString() {
        return "OrderItem{" +
                "orderId=" + orderId +
                ", menuId=" + menuId +
                ", quantity=" + quantity +
                ", subtotal=" + subtotal +
                '}';
    }

    public int getOrderitemId() {
        return orderitemId;
    }

    public void setOrderitemId(int orderitemId) {
        this.orderitemId = orderitemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }
}

