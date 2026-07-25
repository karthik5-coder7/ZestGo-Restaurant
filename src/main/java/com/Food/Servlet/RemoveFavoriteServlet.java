package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.DAOimpl.FavoriteDAOimpl;

@WebServlet("/removeFavorite")
	public class RemoveFavoriteServlet extends HttpServlet {

	    protected void doGet(HttpServletRequest req,
	                         HttpServletResponse resp)
	            throws ServletException, IOException {

	        HttpSession session = req.getSession();

	        String userName =
	                (String) session.getAttribute("userName");

	        int restaurantId =
	                Integer.parseInt(
	                        req.getParameter("restaurantId"));

	        FavoriteDAOimpl dao =
	                new FavoriteDAOimpl();

	        dao.removeFavorite(userName, restaurantId);

	        resp.sendRedirect("favorites");
	    }
	}