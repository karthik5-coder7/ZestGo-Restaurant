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
        System.out.println(
                "LOGIN PASSWORD RECEIVED = "
                + (password != null && !password.isEmpty())
        );

        if (email == null ||
                email.trim().isEmpty() ||
                password == null ||
                password.isEmpty()) {

            System.out.println(
                    "LOGIN FAILED: Email or password empty"
            );

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

            resp.sendRedirect(
                    "callRestaurantServlet"
            );

        } else {

            System.out.println(
                    "LOGIN FAILED: Invalid email or password"
            );

            /*
             * Redirect with an error message so we know
             * why the login page was opened again.
             */
            resp.sendRedirect(
                    "login.jsp?error=invalid"
            );
        }
    }
}