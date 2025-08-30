package com.foodapp.model;


public class Restaurant {
	private int id;
	private String restName;
	private String cuisineType;
	private int deliveryTime;
	private int isActive;
	private float rating;
	private String imgpath;

	public Restaurant() {

	}

	/**
	 * @param restaurantId 
	 * @param restName
	 * @param cuisineType
	 * @param deliveryTime
	 * @param isActive
	 * @param rating
	 */
	public Restaurant(int restaurantId, String restName, String cuisineType, int deliveryTime, int isActive, float rating) {
		super();
		this.restName = restName;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.isActive = isActive;
		this.rating = rating;
	}

	public Restaurant(int id, String restName, String cuisineType, int deliveryTime, int isActive, float rating,String imgPath) {
		super();
		this.id = id;
		this.restName = restName;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.isActive = isActive;
		this.rating = rating;
		this.imgpath=imgPath;
	}

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

	public void setActive(int isActive) {
		this.isActive = isActive;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
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

	@Override
	public String toString() {
		return id + "  " + restName + "  " + cuisineType + "  "
				+ deliveryTime + "  " + isActive + "  " + rating ;
	}

	public void setAddress(String string) {
		// TODO Auto-generated method stub
		
	}

	
	
}


