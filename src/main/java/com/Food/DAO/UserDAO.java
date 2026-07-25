package com.Food.DAO;

import java.util.List;

import com.Food.Model.User;

public interface UserDAO {
	
	void addUser(User user);
	User getUser(int restaurantID);
	void updateUser(User user);
	void deleteUser(int restaurantID);
	List<User> getAllUsers();
}