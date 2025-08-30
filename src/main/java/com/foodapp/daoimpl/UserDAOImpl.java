package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;

public class UserDAOImpl implements UserDAO {
	static Connection con;
	private PreparedStatement pstmt;
	static int x ;
	private ResultSet resultSet;

	private List<User> useresultSetList = new ArrayList<User>();
	private Statement stmt;
	User user;
	private static final String INSERT_USER = "insert into user(userName,email,password,address) values(?,?,?,?)";
	private static final String GET_ALL_USEresultSet = "select * from `user`";
	private static final String SELECT_ON_EMAIL = "select * from `user` where email=?";
	private static final String DELETE_USER_BY_ID = "delete from `user` where userId=?";
	private static final String UPDATE_ROLE_BY_ID = "update `user` set role=? where userId=?";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodapp","root","root");
		} 
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

@Override
	public int insertUser(User user) {
		try {
			pstmt = con.prepareStatement(INSERT_USER);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAddress());		
			x = pstmt.executeUpdate();



		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> useresultSetList = new ArrayList<>();
		try {
			stmt = con.createStatement();
			resultSet = stmt.executeQuery(GET_ALL_USEresultSet);

			useresultSetList = extractUserListFromResultSet(resultSet);  // No need for casting
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return useresultSetList;
	}
	
	@Override
	public User getUserById(String email) {

			try {

				pstmt = con.prepareStatement(SELECT_ON_EMAIL);
				pstmt.setString(1, email);
				 resultSet = pstmt.executeQuery();
				 
				while(resultSet.next()) 
				{
					user = new User(resultSet.getString("username"),resultSet.getString("email"),
							resultSet.getString("password"),resultSet.getString("address"));
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			return user;
		}



	@Override
	public int updateUserById(int id, String role) {
		try {
			pstmt = con.prepareStatement(UPDATE_ROLE_BY_ID);
			pstmt.setInt(2, id);
			pstmt.setString(1, role);
			x = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public int deleteUserById(int id) {

		try {
			pstmt = con.prepareStatement(DELETE_USER_BY_ID);
			pstmt.setInt(1, id);
			x = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	public List<User> extractUserListFromResultSet(ResultSet resultSet) {
		List<User> useresultSet = new ArrayList<>();
		try {
			while (resultSet.next()) {
				User user = new User();
				// populate the user object with the data from resultSet
				useresultSet.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return useresultSet;
	}

	
	

	
	}

