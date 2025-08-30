package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.model.Restaurant;

/**
 * Servlet implementation class AddRestaurant
 */
@WebServlet("/AddRestaurant")
public class AddRestaurant extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // No need to parse restaurantId
        // int restaurantId = Integer.parseInt(req.getParameter("restid"));
        
        String name = req.getParameter("name");
        String cuisineType = req.getParameter("cusionType"); // assuming 'cusionType' is a typo for 'cuisineType'
        int deliveryTime = Integer.parseInt(req.getParameter("deleiverytime"));
        String isActive = req.getParameter("isactive");
        float rating = Float.parseFloat(req.getParameter("ratings"));

        // Convert the `isActive` field to an integer (assuming it's stored as int 1 or 0)
        int isActiveFlag = isActive.equalsIgnoreCase("yes") ? 1 : 0;

        // Create a new Restaurant object (without restaurantId)
        Restaurant restaurant = new Restaurant(0, name, cuisineType, deliveryTime, isActiveFlag, rating);

        // Instantiate the DAO
        RestaurantDAO restaurantDao = new RestaurantDAOImpl();

        // Insert the restaurant
        int result = restaurantDao.insertRestaurant(restaurant);

        // Redirect based on result
        if (result == 0) {
            resp.sendRedirect("restfail.html");
        } else {
            resp.sendRedirect("adminhome.jsp");
        }
    }
}
