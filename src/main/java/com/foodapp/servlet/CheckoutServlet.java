package com.foodapp.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
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
		
		OrderDAO orderDAO = new OrderDAOImpl();
        OrderitemDAO orderItemDAO = new OrderitemDAOImpl();
        OrderhistoryDAO orderHistoryDAO = new OrderhistoryDAOImpl();
        
        // ✅ Group items by restaurant and create separate orders for each
        Map<Integer, List<CartItem>> itemsByRestaurant = cart.getItemsByRestaurant();
        boolean allOrdersSuccess = true;
        
        for (Map.Entry<Integer, List<CartItem>> restaurantEntry : itemsByRestaurant.entrySet()) {
            int restaurantId = restaurantEntry.getKey();
            List<CartItem> restaurantItems = restaurantEntry.getValue();
            
            // Calculate total for this restaurant
            int restaurantTotal = 0;
            for (CartItem item : restaurantItems) {
                restaurantTotal += (int) (item.getPrice() * item.getQuantity());
            }
            
            System.out.println("Creating order for Restaurant ID: " + restaurantId + ", Total: " + restaurantTotal);
            
            // Create order for this restaurant
            Order order = new Order();
            order.setUserId(userid);
            order.setRestaurantId(restaurantId);	
            order.setPaymentOption(paymentMethod);
            order.setStatus("Pending");		
            order.setTotalAmount(restaurantTotal);
            
            int orderId = orderDAO.insertOrder(order);
            System.out.println("Generated Order ID: " + orderId);
            
            if (orderId > 0) {
                // Add order items for this restaurant
                for (CartItem cartItem : restaurantItems) {
                    Orderitem orderItem = new Orderitem();
                    orderItem.setOrderId(orderId);
                    orderItem.setMenuId(cartItem.getItemId());
                    orderItem.setQuantity(cartItem.getQuantity());
                    orderItem.setSubtotal((int) (cartItem.getPrice() * cartItem.getQuantity()));
                    orderItemDAO.insertOrderhistory(orderItem);
                }
                System.out.println("Inserted OrderItems for Restaurant: " + restaurantId);
                
                // Create order history
                Orderhistory orderHistory = new Orderhistory();
                orderHistory.setOrderId(orderId);
                orderHistory.setUserId(userid);
                orderHistory.setStatus("Pending");
                orderHistory.setTotalAmount(restaurantTotal);
                orderHistory.setDate(new Date(System.currentTimeMillis()));
                int historyResult = orderHistoryDAO.insertOrderHistory(orderHistory);
                System.out.println("Inserted OrderHistory: " + historyResult);
            } else {
                allOrdersSuccess = false;
                System.out.println("Failed to create order for Restaurant: " + restaurantId);
            }
        }
        
        if (allOrdersSuccess) {
            session.removeAttribute("cart"); // Clear the cart after all orders are placed
            response.sendRedirect("order_confirmation.jsp");
        } else {
            response.sendRedirect("cart.jsp?error=Some orders failed to process");
        }
	}
	else
	{
			response.sendRedirect("cart.jsp");
	}
}


}