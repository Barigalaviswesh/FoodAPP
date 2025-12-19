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
	
	String query = " select * from admin where email = ?";
	private PreparedStatement pstmt;
	private ResultSet result;
	private com.foodapp.model.Admin Admin;
	
	
	static 
	{

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, un, pwd);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	@Override
	public com.foodapp.model.Admin getAdminByEmail(String Email) {
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, Email);
			
			 result = pstmt.executeQuery();
			 
			 while(result.next())
			 {
				 Admin  =  new com.foodapp.model.Admin (result.getString("email"),result.getString("password"));
			 }
			 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return Admin;
	}

}
