package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.DAOimpl.LoginDAOimpl;
import com.Food.Model.Login;

@WebServlet("/callLoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println("===== LOGIN REQUEST =====");
        System.out.println("LOGIN EMAIL = " + email);

        if (email == null ||
                email.trim().isEmpty() ||
                password == null ||
                password.isEmpty()) {

            resp.sendRedirect("login.jsp");
            return;
        }

        LoginDAOimpl loginDAO =
                new LoginDAOimpl();

        Login user =
                loginDAO.validateUser(
                        email.trim(),
                        password
                );

        if (user != null) {

            System.out.println(
                    "LOGIN SUCCESS: " + user.getEmail()
            );

            /*
             * Create/reuse the user's session.
             */
            HttpSession session =
                    req.getSession(true);

            session.setAttribute(
                    "userName",
                    user.getEmail()
            );

            session.setAttribute(
                    "user",
                    user
            );

            /*
             * Redirect to Home.
             *
             * RestaurantServlet now uses the restaurant
             * cache, so Home does not need to query all
             * restaurants every time.
             */
            resp.sendRedirect(
                    req.getContextPath()
                    + "/callRestaurantServlet"
            );

        } else {

            System.out.println(
                    "LOGIN FAILED: Invalid email or password"
            );

            resp.sendRedirect(
                    req.getContextPath()
                    + "/login.jsp?error=invalid"
            );
        }
    }
}