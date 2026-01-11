package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminlogout")
public class AdminLogoutServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the current session
        HttpSession session = req.getSession(false);
        
        if(session != null) {
            // Remove admin-specific attributes
            session.removeAttribute("admin");
            session.removeAttribute("adminEmail");
            
            // Invalidate the session
            session.invalidate();
        }
        
        // Redirect to admin page
        resp.sendRedirect("admin.html");
    }
}