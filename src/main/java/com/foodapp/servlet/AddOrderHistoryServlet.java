package com.foodapp.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.OrderhistoryDAO;
import com.foodapp.daoimpl.OrderhistoryDAOImpl;
import com.foodapp.model.Orderhistory;

@WebServlet("/addOrderHistoryServlet")
public class AddOrderHistoryServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            int userId = Integer.parseInt(req.getParameter("userId"));
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            Date date = Date.valueOf(req.getParameter("date"));
            float totalAmount = Float.parseFloat(req.getParameter("totalAmount"));
            String status = req.getParameter("status");
            
            Orderhistory orderHistory = new Orderhistory();
            orderHistory.setUserId(userId);
            orderHistory.setOrderId(orderId);
            orderHistory.setDate(date);
            orderHistory.setTotalAmount(totalAmount);
            orderHistory.setStatus(status);
            
            OrderhistoryDAO orderHistoryDAO = new OrderhistoryDAOImpl();
            int result = orderHistoryDAO.insertOrderHistory(orderHistory);
            
            if (result > 0) {
                resp.sendRedirect("addOrderHistory.html?success=history_added");
            } else {
                resp.sendRedirect("addOrderHistory.html?error=history_failed");
            }
            
        } catch (NumberFormatException e) {
            resp.sendRedirect("addOrderHistory.html?error=invalid_input");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("addOrderHistory.html?error=server_error");
        }
    }
}