package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.model.Restaurant;

@WebServlet("/AddRestaurant")
@MultipartConfig
public class AddRestaurant extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1️⃣ Read parameters as STRING (safe)
        String name = req.getParameter("name");
        String cuisineType = req.getParameter("cusionType");
        String deliveryTimeStr = req.getParameter("deleiverytime");
        String isActiveStr = req.getParameter("isactive");
        String ratingStr = req.getParameter("ratings");
        String imgPath = req.getParameter("imgPath");



        // 2️⃣ DEBUG (check in console)
        System.out.println("deliveryTime = " + deliveryTimeStr);
        System.out.println("isActive = " + isActiveStr);
        System.out.println("rating = " + ratingStr);

        // 3️⃣ Validate null values
        if (deliveryTimeStr == null || isActiveStr == null || ratingStr == null) {
            resp.sendRedirect("restfail.html");
            return;
        }

        // 4️⃣ Convert safely
        int deliveryTime = Integer.parseInt(deliveryTimeStr);
        int isActiveFlag = Integer.parseInt(isActiveStr);
        float rating = Float.parseFloat(ratingStr);

        // 5️⃣ Handle image (even if you don’t save it yet)
        Part imagePart = req.getPart("restaurantImage");
        String imageName = imagePart != null ? imagePart.getSubmittedFileName() : null;
        System.out.println("Image = " + imageName);

        // 6️⃣ Create Restaurant object
        Restaurant restaurant = new Restaurant(
                0,
                name,
                cuisineType,
                deliveryTime,
                isActiveFlag,
                rating,
                imgPath
        );

        // 7️⃣ DAO call
        RestaurantDAO restaurantDao = new RestaurantDAOImpl();
        int result = restaurantDao.insertRestaurant(restaurant);

        // 8️⃣ Redirect
        if (result > 0) {
            resp.sendRedirect("adminhome.jsp");
        } else {
            resp.sendRedirect("restfail.html");
        }
    }
}
