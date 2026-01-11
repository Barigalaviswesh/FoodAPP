package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.OrderitemDAO;
import com.foodapp.daoimpl.OrderitemDAOImpl;
import com.foodapp.model.Orderitem;

@WebServlet("/addOrderItemServlet")
public class AddOrderItemServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            int menuId = Integer.parseInt(req.getParameter("menuId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            int subtotal = Integer.parseInt(req.getParameter("subtotal"));
            
            Orderitem orderItem = new Orderitem(orderId, menuId, quantity, subtotal);
            
            OrderitemDAO orderItemDAO = new OrderitemDAOImpl();
            int result = orderItemDAO.insertOrderhistory(orderItem);
            
            if (result > 0) {
                resp.sendRedirect("addOrderItem.html?success=item_added");
            } else {
                resp.sendRedirect("addOrderItem.html?error=item_failed");
            }
            
        } catch (NumberFormatException e) {
            resp.sendRedirect("addOrderItem.html?error=invalid_input");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("addOrderItem.html?error=server_error");
        }
    }
}