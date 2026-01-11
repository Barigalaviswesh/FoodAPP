package com.foodapp.model;

public class CartItem {

    private int itemId;
    private int restaurantId;
    private String name;
    private double price;
    private int quantity;
    private String imgPath;

    // ✅ MAIN CONSTRUCTOR (USED BY CartServlet)
    public CartItem(int itemId, int restaurantId, String name, double price, int quantity, String imgPath) {
        this.itemId = itemId;
        this.restaurantId = restaurantId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.imgPath = imgPath;
    }

    // ✅ GETTERS & SETTERS
    public int getItemId() {
        return itemId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
