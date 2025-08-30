package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.daoimpl.MenuDaoImpl;
import com.foodapp.dao.MenuDAO;

import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.Menu;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");
		if("add".equals(action)) {
			addItemToCart(request, cart);
		}
		else if("update".equals(action)) {
			updateCartItem(request,cart);
		}
		else if("remove".equals(action)) {
			removeItemFromCart(request,cart);
			
		}
		
		session.setAttribute("cart", cart);
		response.sendRedirect("cart.jsp");
	}
	
	private void addItemToCart(HttpServletRequest request, Cart cart) {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		MenuDAO menuDAO = new MenuDaoImpl();
		Menu menuItem = menuDAO.getMenuById(itemId);
		
		HttpSession session = request.getSession();
		session.setAttribute("restaurantId", menuItem.getRid());
		
		if(menuItem != null) {
			CartItem item = new CartItem(
					menuItem.getMid(),
					menuItem.getRid(),
					menuItem.getItemName(),
					quantity,
					menuItem.getPrice()
					
					);
			cart.addItem(item);
		}
		
	}
    private void updateCartItem(HttpServletRequest request, Cart cart) {
    	int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        if (quantity > 0) {
            cart.updateItem(itemId, quantity);
        }
	}
     private void removeItemFromCart(HttpServletRequest request, Cart cart) {
    	 int itemId = Integer.parseInt(request.getParameter("itemId"));
         cart.removeItem(itemId);
	
    }

}
