package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.OrderhistoryDAO;
import com.foodapp.model.Orderhistory;

public class OrderhistoryDAOImpl implements OrderhistoryDAO {
	 private static Connection con;
	    private PreparedStatement pstmt;
	    private ResultSet resultSet;
	    private static Orderhistory orderHistory;
	    private ArrayList<Orderhistory> orderHistoryList = new ArrayList<>();
	    private int x = -1;

	    private static final String ORDER_HISTORY_BY_ID = "SELECT * FROM orderhistory WHERE orderhistoryId = ?";
	    private static final String INSERT_ORDER_HISTORY = "INSERT INTO orderhistory (orderhistoryId, userId, orderId, date, totalAmount, status) VALUES (?, ?, ?, ?, ?, ?)";
	    private static final String UPDATE_ORDER_HISTORY_STATUS = "UPDATE orderhistory SET status = ? WHERE orderhistoryId = ?";
	    private static final String GET_ORDER_HISTORY_BY_USER_ID = "SELECT * FROM orderhistory WHERE userId = ?";

	    static {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodApp", "root", "root");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    @Override
	    public Orderhistory fetchOrderHistoryById(int id) {
	        try {
	            pstmt = con.prepareStatement(ORDER_HISTORY_BY_ID);
	            pstmt.setInt(1, id);
	            resultSet = pstmt.executeQuery();

	            orderHistoryList = (ArrayList<Orderhistory>) extractOrderHistoryListFromResultSet(resultSet);
	            orderHistory = orderHistoryList.get(0);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderHistory;
	    }

	    @Override
	    public int insertOrderHistory(Orderhistory orderHistory) {
	        try {
	            pstmt = con.prepareStatement(INSERT_ORDER_HISTORY);
	            pstmt.setInt(1, orderHistory.getOrderHistoryId());
	            pstmt.setInt(2, orderHistory.getUserId());
	            pstmt.setInt(3, orderHistory.getOrderId());
	            pstmt.setDate(4, orderHistory.getDate());
	            pstmt.setFloat(5, orderHistory.getTotalAmount());
	            pstmt.setString(6, orderHistory.getStatus());

	            x = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return x;
	    }

	    @Override
	    public int updateOrderHistoryStatusById(int id, String status) {
	        try {
	            pstmt = con.prepareStatement(UPDATE_ORDER_HISTORY_STATUS);
	            pstmt.setString(1, status);
	            pstmt.setInt(2, id);

	            x = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return x;
	    }

	    @Override
	    public List<Orderhistory> fetchOrderHistoryByUserId(int uid) {
	        try {
	            pstmt = con.prepareStatement(GET_ORDER_HISTORY_BY_USER_ID);
	            pstmt.setInt(1, uid);
	            resultSet = pstmt.executeQuery();

	            orderHistoryList = (ArrayList<Orderhistory>) extractOrderHistoryListFromResultSet(resultSet);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderHistoryList;
	    }

	    private List<Orderhistory> extractOrderHistoryListFromResultSet(ResultSet resultSet) {
	        try {
	            while (resultSet.next()) {
	                orderHistoryList.add(new Orderhistory(
	                        resultSet.getInt(1),
	                        resultSet.getInt(2),
	                        resultSet.getInt(3),
	                        resultSet.getDate(4),
	                        resultSet.getFloat(5),
	                        resultSet.getString(6)
	                ));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderHistoryList;
	    }

		@Override
		public int insertOrderHistory(OrderhistoryDAO orderHistory) {
			// TODO Auto-generated method stub
			return 0;
		}

		

	
}

