package com.Food.utility;

import java.sql.Timestamp;


import java.util.List;
import java.util.Scanner;

import com.Food.DAO.UserDAO;
import com.Food.DAOimpl.UserDAOimpl;
import com.Food.Model.User;

public class Launch {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
//		
//		System.out.println("Enter the UserName: ");
//		String userName = scan.next();
//		
//		System.out.println("Enter the Password: ");
//		String password = scan.next();
//		
//		System.out.println("Enter the Email: ");
//		String email = scan.next();
//		
//		System.out.println("Enter the Address: ");
//		String address = scan.next();
//		
//		System.out.println("Enter the Role: ");
//		String role = scan.next();
//		
//          
//		
//		User u = new User(userName, password, email, address, role, null, null);
	
		
//		UserDAOimpl userDAO = new UserDAOimpl();
		
		
//		userDAO.addUser(u);
//		System.out.println(u);
		
//		User u = userDAO.getUser(3);
//		System.out.println(u);
		
//		User u = userDAO.getUser(1);
//		u.setAddress("Mico Layout");
//		System.out.println(u);
//		System.out.println("User UPDATED");
		
//		userDAO.deleteUser(1);
//		System.out.println("User DELETED");
		
		UserDAOimpl userDAO = new UserDAOimpl();
		List<User> allUser = userDAO.getAllUsers();
		for (User user : allUser) {
			System.out.println(user);
		}
	}	
}