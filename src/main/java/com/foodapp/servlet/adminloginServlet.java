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

@WebServlet("/adminloginServlet")
public class adminloginServlet extends HttpServlet {
	
		
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String email = req.getParameter("email");
			 String password  = req.getParameter("password");
			 
			 
			 AdminDao adao = new AdminImpl();
			 
			 Admin admin = adao.getAdminByEmail(email);
			 
			 if(admin != null)
			 {
				 if(password.equals(admin.getPassword()))
				 {
					 resp.sendRedirect("adminhome.jsp");
				 }
				 else
				 {
					 resp.sendRedirect("passMis.html");
				 }
			 }
			 else
			 {
				 resp.sendRedirect("adminMsg.html");
			 }
			
		}
		
}
