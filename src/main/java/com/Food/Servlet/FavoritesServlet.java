package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import com.Food.Model.User;
import com.Food.DAOimpl.FavoriteDAOimpl;



@WebServlet("/favorites")
	public class FavoritesServlet
	        extends HttpServlet {

	    

		protected void doGet(HttpServletRequest req,
	                         HttpServletResponse resp)
	            throws ServletException, IOException {

	        HttpSession session =
	                req.getSession();

	        String userName =
	                (String) session.getAttribute("userName");

	        FavoriteDAOimpl dao =
	                new FavoriteDAOimpl();

	        List<User> list =
	                dao.getFavorites(userName);

	        req.setAttribute("favorites", list);

	        RequestDispatcher rd =
	                req.getRequestDispatcher(
	                        "/favorite.jsp");

	        rd.forward(req, resp);
	    }
	}