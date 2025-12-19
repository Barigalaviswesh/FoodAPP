package com.foodapp.dao;

import java.util.List;




import com.foodapp.dao.RestaurantDAO;
import com.foodapp.model.Restaurant;

public interface RestaurantDAO {
	int insertRestaurant(Restaurant rest);
	List<Restaurant> getAllRestaurants();
	Restaurant getRestaurantById(int id);
	int updateRestaurantById(int id,int isAvail);
	int deleteRestaurantById(int id);
}
