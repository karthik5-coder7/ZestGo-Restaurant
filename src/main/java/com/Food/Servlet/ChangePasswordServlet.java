package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.DAOimpl.LoginDAOimpl;

@WebServlet("/changePassword")
	public class ChangePasswordServlet extends HttpServlet {

	    protected void doPost(HttpServletRequest req,
	                          HttpServletResponse resp)
	            throws ServletException, IOException {

	        HttpSession session =
	                req.getSession();

	        String userName =
	                (String) session.getAttribute("userName");

	        String oldPassword =
	                req.getParameter("oldPassword");

	        String newPassword =
	                req.getParameter("newPassword");

	        String confirmPassword =
	                req.getParameter("confirmPassword");

	        if(!newPassword.equals(confirmPassword))
	        {
	            resp.getWriter().println(
	                    "Passwords do not match");
	            return;
	        }

	        LoginDAOimpl dao =
	                new LoginDAOimpl();

	        boolean updated =
	                dao.changePassword(
	                        userName,
	                        oldPassword,
	                        newPassword);

	        if(updated)
	        {
	            resp.sendRedirect("profile.jsp");
	        }
	        else
	        {
	            resp.getWriter().println(
	                    "Current password is incorrect");
	        }
	    }
	}