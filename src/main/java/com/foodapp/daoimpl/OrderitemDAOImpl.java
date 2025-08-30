package com.foodapp.daoimpl;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.OrderitemDAO;
import com.foodapp.model.Orderitem;

public class OrderitemDAOImpl implements OrderitemDAO {
	 	private static Connection con;
	    private PreparedStatement pstmt;
	    private ResultSet resultSet;
	    private List<Orderitem> orderitemList = new ArrayList<>();
	    private static final String INSERT_ORDERITEM = "INSERT INTO orderitem (orderId, menuId, quantity, subtotal) VALUES (?, ?, ?, ?)";
	    private static final String GET_ORDERITEMS_BY_ORDERID = "SELECT * FROM orderitem WHERE orderId=?";

	    // Static block to initialize the database connection
	    static {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodApp", "root", "root");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    

		@Override
	    public void insertOrderhistory(int orderId, int menuId, int quantity, int subtotal) {
			try {
	            pstmt = con.prepareStatement(INSERT_ORDERITEM);
	            pstmt.setInt(1, orderId);
	            pstmt.setInt(2, menuId);
	            pstmt.setInt(3, quantity);
	            pstmt.setInt(4, subtotal);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			
	    }
		@Override
		public int insertOrderhistory(Orderitem orderItem) {
			int result = -1;

		    try {

		    	pstmt = con.prepareStatement(INSERT_ORDERITEM);
		    	pstmt.setInt(1, orderItem.getOrderId());
		        pstmt.setInt(2, orderItem.getMenuId());
		        pstmt.setInt(3, orderItem.getQuantity());
		        pstmt.setInt(4, orderItem.getSubtotal());

		        result = pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return result;
	    }
		

	    @Override
	    public List<Orderitem> fetchOrderItems(int orderId) {
	        List<Orderitem> orderItems = new ArrayList<>();
	        try {
	            pstmt = con.prepareStatement(GET_ORDERITEMS_BY_ORDERID);
	            pstmt.setInt(1, orderId);
	            resultSet = pstmt.executeQuery();
	            orderItems = extractOrderitemListFromResultSet(resultSet);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderItems;
	    }

	    // Helper method to extract order items from the ResultSet
	    private List<Orderitem> extractOrderitemListFromResultSet(ResultSet resultSet) {
	        List<Orderitem> orderitemList = new ArrayList<>();
	        try {
	            while (resultSet.next()) {
	                orderitemList.add(new Orderitem(
	                        resultSet.getInt("orderitemId"),
	                        resultSet.getInt("orderId"),
	                        resultSet.getInt("menuId"),
	                        resultSet.getInt("quantity"),
	                        resultSet.getInt("subtotal")
	                ));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderitemList;
	    }

		@Override
		public void insertOrderHistory(int userId, int orderId, int totalAmount, String status) {
			// TODO Auto-generated method stub
			
		}

		

		

		
	}
