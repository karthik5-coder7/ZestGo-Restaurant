package com.Food.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Food.DAOimpl.UserDAOimpl;
import com.Food.Model.User;

@WebServlet("/searchRestaurant")
	public class SearchRestaurantServlet extends HttpServlet {

	    protected void doGet(HttpServletRequest req,
	                         HttpServletResponse resp)
	            throws ServletException, IOException {

	        String keyword =
	                req.getParameter("keyword");
	        
	       
	       

	        UserDAOimpl dao = new UserDAOimpl();

	        List<User> restaurants = dao.searchRestaurants(keyword);

	        req.setAttribute("allUsers", restaurants);

	        RequestDispatcher rd =
	                req.getRequestDispatcher("restaurant.jsp");

	        rd.forward(req, resp);
	    }
	}