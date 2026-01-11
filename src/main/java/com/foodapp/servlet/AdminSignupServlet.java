package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.AdminDao;
import com.foodapp.daoimpl.AdminImpl;
import com.foodapp.model.Admin;

@WebServlet("/adminsignupServlet")
public class AdminSignupServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        
        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            resp.sendRedirect("admin.html?error=password_mismatch");
            return;
        }
        
        AdminDao adao = new AdminImpl();
        
        // Check if admin already exists
        Admin existingAdmin = adao.getAdminByEmail(email);
        if (existingAdmin != null) {
            resp.sendRedirect("admin.html?error=admin_exists");
            return;
        }
        
        // Create new admin
        Admin newAdmin = new Admin(email, password);
        boolean isAdded = adao.addAdmin(newAdmin);
        
        if (isAdded) {
            resp.sendRedirect("admin.html?success=admin_created");
        } else {
            resp.sendRedirect("admin.html?error=creation_failed");
        }
    }
}