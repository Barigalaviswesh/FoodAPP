package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.MenuDAO;
import com.foodapp.daoimpl.MenuDaoImpl;
import com.foodapp.model.Menu;

/**
 * Servlet implementation class MenuServlet
 */
@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int restaurantId = Integer.parseInt(req.getParameter("id"));  // Assume id corresponds to restaurant
        
        MenuDAO mdao = new MenuDaoImpl();
        List<Menu> menuList = mdao.getAllRestMenu(restaurantId); // Fetch list of menus for the restaurant
        
        req.getSession().setAttribute("menuList", menuList);  // Store the list in session
        
        resp.sendRedirect("menu.jsp");  // Redirect to menu.jsp
    }
}

