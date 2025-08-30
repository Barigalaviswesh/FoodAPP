package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.model.Restaurant;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private HttpSession session;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

		// Get the restaurant list from RestaurantDAOImpl
		RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
		List<Restaurant> restaurantList = restaurantDAO.getAllRestaurants();
		session=request.getSession();
		session.setAttribute("restaurant", restaurantList);

		// Add the restaurant list to request
		request.setAttribute("restList", restaurantList);

		response.sendRedirect("home.jsp");
	}
}
