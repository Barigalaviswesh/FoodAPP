package com.foodapp.model;

import java.io.Serializable;

public class Restaurant implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String restName;
    private String cuisineType;
    private int deliveryTime;
    private int isActive;
    private float rating;
    private String imgPath;

    public Restaurant() {}

    // Constructor WITHOUT image
    public Restaurant(int id, String restName, String cuisineType,
                      int deliveryTime, int isActive, float rating) {
        this.id = id;
        this.restName = restName;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.isActive = isActive;
        this.rating = rating;
    }

    // Constructor WITH image
    public Restaurant(int id, String restName, String cuisineType,
                      int deliveryTime, int isActive, float rating, String imgPath) {
        this.id = id;
        this.restName = restName;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.isActive = isActive;
        this.rating = rating;
        this.imgPath = imgPath;
    }

    // ===== GETTERS & SETTERS =====

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRestName() {
        return restName;
    }

    public void setRestName(String restName) {
        this.restName = restName;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    @Override
    public String toString() {
        return id + " " + restName + " " + cuisineType + " "
                + deliveryTime + " " + isActive + " " + rating + " " + imgPath;
    }
}
