package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.OrderDAO;
import com.foodapp.daoimpl.OrderDAOImpl;

@WebServlet("/addOrderServlet")
public class AddOrderServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            int userId = Integer.parseInt(req.getParameter("userId"));
            int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
            int totalAmount = Integer.parseInt(req.getParameter("totalAmount"));
            String status = req.getParameter("status");
            String paymentOption = req.getParameter("paymentOption");
            
            OrderDAO orderDAO = new OrderDAOImpl();
            boolean isAdded = orderDAO.insertOrder(userId, restaurantId, totalAmount, status, paymentOption);
            
            if (isAdded) {
                resp.sendRedirect("addOrder.html?success=order_added");
            } else {
                resp.sendRedirect("addOrder.html?error=order_failed");
            }
            
        } catch (NumberFormatException e) {
            resp.sendRedirect("addOrder.html?error=invalid_input");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("addOrder.html?error=server_error");
        }
    }
}