package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.mindrot.jbcrypt.BCrypt;

import com.Food.DAOimpl.LoginDAOimpl;
import com.Food.Model.Login;

@WebServlet("/callLoginServlet")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		LoginDAOimpl loginDAO = new LoginDAOimpl();

		Login user = loginDAO.validateUser(email, password);

		if(user != null)
		{
			// Create Session
			HttpSession session = req.getSession();
			
			  // Store logged in user
			session.setAttribute("userName", email);
			
		    resp.sendRedirect("callRestaurantServlet");
		}
		else
		{
		    resp.sendRedirect("login.jsp");
		}
		
	}

}