package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.MenuDAO;
import com.foodapp.daoimpl.MenuDaoImpl;
import com.foodapp.model.Menu;

/**
 * Servlet implementation class AddMenu
 */
@WebServlet("/AddMenu")
public class AddMenu extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Retrieve parameters from the request
        int menuId = Integer.parseInt(req.getParameter("menuid"));
        int restaurantId = Integer.parseInt(req.getParameter("restid"));
        String itemName = req.getParameter("itemname");
        String description = req.getParameter("description");
        float price = Float.parseFloat(req.getParameter("price"));
        int isAvailable = Integer.parseInt(req.getParameter("isavail")); // Expecting String here
        String imgPath = req.getParameter("imgPath");
        
        // Create a new Menu object
        Menu menu = new Menu(menuId, restaurantId, itemName, description, price, isAvailable, imgPath);
        
        // Instantiate the DAO
        MenuDAO menuDao = new MenuDaoImpl();
        
        // Insert the menu item
        int result = menuDao.insertMenu(menu);
        
        // Redirect based on the result
        if (result == 0) {
            resp.sendRedirect("menuFail.html");
        } else {
            resp.sendRedirect("adminhome.jsp");
        }
    }


}
