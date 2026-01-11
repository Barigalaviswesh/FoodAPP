package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.foodapp.dao.AdminDao;

public class AdminImpl implements AdminDao {
	static String url = "jdbc:mysql://localhost:3306/foodapp";
	static String un = "root";
	static String pwd = "root";
	private static Connection con; 
	
	String selectQuery = "SELECT * FROM admin WHERE email = ?";
	String insertQuery = "INSERT INTO admin (email, password) VALUES (?, ?)";
	private PreparedStatement pstmt;
	private ResultSet result;
	private com.foodapp.model.Admin Admin;
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, un, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public com.foodapp.model.Admin getAdminByEmail(String Email) {
		try {
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, Email);
			
			result = pstmt.executeQuery();
			 
			while(result.next()) {
				Admin = new com.foodapp.model.Admin(result.getString("email"), result.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Admin;
	}
	
	@Override
	public boolean addAdmin(com.foodapp.model.Admin admin) {
		try {
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setString(1, admin.getEmail());
			pstmt.setString(2, admin.getPassword());
			
			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
