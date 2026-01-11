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

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        // safety check
        if (idParam == null) {
            response.sendRedirect("HomeServlet");
            return;
        }

        int restaurantId = Integer.parseInt(idParam);

        MenuDAO menuDAO = new MenuDaoImpl();
        List<Menu> menuList = menuDAO.getAllRestMenu(restaurantId);

        // ✅ USE REQUEST (NOT SESSION)
        request.setAttribute("menuList", menuList);
        request.setAttribute("restaurantId", restaurantId);

        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
