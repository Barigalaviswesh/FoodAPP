package com.foodapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodapp.dao.MenuDAO;
import com.foodapp.daoimpl.MenuDaoImpl;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.Menu;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        String action = request.getParameter("action");

        MenuDAO menuDAO = new MenuDaoImpl();

        if ("add".equals(action)) {

            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Menu menu = menuDAO.getMenuById(itemId);

            CartItem item = new CartItem(
                    menu.getMid(),
                    menu.getRid(),
                    menu.getItemName(),
                    menu.getPrice(),
                    quantity,
                    menu.getimgPath()
            );

            cart.addItem(item, menu.getRid());

            session.setAttribute("cart", cart);

            // ✅ AJAX response with cart count
            response.setContentType("text/plain");
            response.getWriter().write("OK:" + cart.getTotalItemCount());
            return;
        }

        else if ("update".equals(action)) {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.updateItem(itemId, quantity);
            session.setAttribute("cart", cart);
            
            // ✅ AJAX response with cart count
            response.setContentType("text/plain");
            response.getWriter().write("OK:" + cart.getTotalItemCount());
            return;
        }

        else if ("remove".equals(action)) {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            cart.removeItem(itemId);
            session.setAttribute("cart", cart);
            
            // ✅ AJAX response with cart count
            response.setContentType("text/plain");
            response.getWriter().write("OK:" + cart.getTotalItemCount());
            return;
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}
