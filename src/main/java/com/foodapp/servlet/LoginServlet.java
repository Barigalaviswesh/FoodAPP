package com.foodapp.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.dao.UserDAO;
import com.foodapp.daoimpl.UserDAOImpl;
import com.foodapp.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.getUserById(email);

        if (user == null || !password.equals(user.getPassword())) {
            System.out.println("Invalid login attempt for email: " + email);
            response.sendRedirect("failure.html");
            return;
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("User", user); // Ensure consistent key

        System.out.println("Login successful for email: " + email);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/HomeServlet");
        dispatcher.forward(request, response);
    }
}
