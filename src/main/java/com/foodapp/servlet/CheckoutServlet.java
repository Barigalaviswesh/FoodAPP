package com.foodapp.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.dao.OrderDAO;
import com.foodapp.dao.OrderhistoryDAO;
import com.foodapp.dao.OrderitemDAO;
import com.foodapp.daoimpl.OrderhistoryDAOImpl;
import com.foodapp.daoimpl.OrderitemDAOImpl;
import com.foodapp.daoimpl.OrderDAOImpl;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.Order;
import com.foodapp.model.Orderhistory;
import com.foodapp.model.User;

import com.foodapp.model.Orderitem;


@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("user") == null) {
		    response.sendRedirect("login.html"); // Prevent null pointer exception
		    return;
		}
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		
		int userid=user.getUser_id();
		
		if (cart != null && user != null && !cart.getItems().isEmpty()) {
		
		String paymentMethod = request.getParameter("paymentMethod");
		Integer totalAmountAttr = (Integer) session.getAttribute("totalAmount");
		Integer restaurantIdAttr = (Integer) session.getAttribute("restaurantId");

		if (totalAmountAttr == null || restaurantIdAttr == null) {
		    response.sendRedirect("cart.jsp"); // Redirect to cart page if data is missing
		    return;
		}
		
		System.out.println("Total Amount: " + totalAmountAttr);
		System.out.println("Restaurant ID: " + restaurantIdAttr);


		int orderTotalAmount = totalAmountAttr;
		Order order = new Order();
		order.setUserId(userid);
		order.setRestaurantId(restaurantIdAttr);	
		order.setPaymentOption(paymentMethod);
		order.setStatus("Pending");		
		order.setTotalAmount(orderTotalAmount);				
	    
	    OrderDAO orderDAO = new OrderDAOImpl();
        OrderitemDAO orderItemDAO = new OrderitemDAOImpl();
        OrderhistoryDAO orderHistoryDAO = new OrderhistoryDAOImpl();
        
        int orderId = orderDAO.insertOrder(order);

        System.out.println("Generated Order ID: " + orderId);
        
        if (orderId > 0) {
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem cartItem = entry.getValue();
                Orderitem orderItem = new Orderitem();
                orderItem.setOrderId(orderId);
                orderItem.setMenuId(cartItem.getItemId());
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setSubtotal((int) (cartItem.getPrice() * cartItem.getQuantity()));
                orderItemDAO.insertOrderhistory(orderItem);
            }
            System.out.println("Inserted OrderItem");            
            Orderhistory orderHistory = new Orderhistory();
            orderHistory.setOrderId(orderId);
            orderHistory.setUserId(userid);
            orderHistory.setStatus("Pending");
            orderHistory.setTotalAmount(totalAmountAttr);
            orderHistory.setDate(new Date(order.getDate().getTime()));
            orderHistoryDAO.insertOrderHistory(orderHistory);
            
            session.removeAttribute("cart"); // Clear the cart after order is placed
            response.sendRedirect("order_confirmation.jsp");
        } else {
            response.sendRedirect("cart.jsp");
        }
	}
	else
	{
			response.sendRedirect("cart.jsp");
	}
}


}