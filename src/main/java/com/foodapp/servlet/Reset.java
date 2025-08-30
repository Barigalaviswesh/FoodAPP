package com.foodapp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Reset
 */
@WebServlet("/Reset")
public class Reset extends HttpServlet {
	String update = "update user set password=? where email=?";
	private Connection con;
	private PreparedStatement pstmt;

	@Override
	public void init() throws ServletException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodapp","root","root");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String cpassword = req.getParameter("cpassword");

			if(password.equals(cpassword)) {
				pstmt = con.prepareStatement(update);
				pstmt.setString(1,password);
				pstmt.setString(2,email);

				int x = pstmt.executeUpdate();
				if(x == 1) {
					resp.sendRedirect("success.html");
				}
				else {
					resp.sendRedirect("failure.html");
				}
			}
			else {
				resp.sendRedirect("failure.html");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
