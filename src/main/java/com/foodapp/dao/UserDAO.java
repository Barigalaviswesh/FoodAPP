package com.foodapp.dao;



import java.util.List;




import com.foodapp.model.User;

public interface UserDAO {
	
	List<User> getAllUsers();
	User getUserById(String email);
	User getUserByEmailAndPassword(String email, String password);
	int updateUserById(int id,String address);
	int deleteUserById(int id);
	int insertUser(User user);
}