package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Food.DAOimpl.RegisterDAOimpl;
import com.Food.Model.Register;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String name =
                req.getParameter("name");

        String email =
                req.getParameter("email");

        String address =
                req.getParameter("address");

        String password =
                req.getParameter("password");

        String confirmPassword =
                req.getParameter("confirmPassword");

        String role =
                req.getParameter("role");


        System.out.println();
        System.out.println("=================================");
        System.out.println("===== REGISTER REQUEST =====");
        System.out.println("=================================");

        System.out.println(
                "NAME = " + name
        );

        System.out.println(
                "EMAIL = " + email
        );

        System.out.println(
                "ADDRESS = " + address
        );

        System.out.println(
                "ROLE = " + role
        );

        System.out.println(
                "PASSWORD RECEIVED = "
                + (password != null
                   && !password.isEmpty())
        );

        System.out.println(
                "CONFIRM PASSWORD RECEIVED = "
                + (confirmPassword != null
                   && !confirmPassword.isEmpty())
        );


        // -------------------------------------------------
        // VALIDATION
        // -------------------------------------------------

        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || address == null || address.trim().isEmpty()
                || password == null || password.isEmpty()) {

            System.out.println(
                    "REGISTER VALIDATION FAILED"
            );

            req.setAttribute(
                    "msg",
                    "Please fill all required fields."
            );

            req.getRequestDispatcher(
                    "register.jsp"
            ).forward(req, resp);

            return;
        }


        // -------------------------------------------------
        // DEFAULT ROLE
        // -------------------------------------------------

        if (role == null || role.trim().isEmpty()) {

            role = "user";

        }


        // -------------------------------------------------
        // CONFIRM PASSWORD
        // -------------------------------------------------

        if (confirmPassword == null
                || !password.equals(confirmPassword)) {

            System.out.println(
                    "REGISTER FAILED: PASSWORDS DO NOT MATCH"
            );

            req.setAttribute(
                    "msg",
                    "Passwords do not match."
            );

            req.getRequestDispatcher(
                    "register.jsp"
            ).forward(req, resp);

            return;
        }


        // -------------------------------------------------
        // CREATE REGISTER OBJECT
        // -------------------------------------------------

        Register register =
                new Register(
                        name.trim(),
                        email.trim(),
                        address.trim(),
                        password,
                        role
                );


        // -------------------------------------------------
        // DATABASE
        // -------------------------------------------------

        RegisterDAOimpl dao =
                new RegisterDAOimpl();

        int result =
                dao.addUser(register);


        // -------------------------------------------------
        // SUCCESS
        // -------------------------------------------------

        if (result == 1) {

            System.out.println(
                    "================================="
            );

            System.out.println(
                    "REGISTRATION SUCCESSFUL"
            );

            System.out.println(
                    "EMAIL = " + email
            );

            System.out.println(
                    "REDIRECTING TO LOGIN"
            );

            System.out.println(
                    "================================="
            );

            resp.sendRedirect(
                    req.getContextPath()
                    + "/login.jsp"
            );

            return;
        }


        // -------------------------------------------------
        // DUPLICATE EMAIL
        // -------------------------------------------------

        if (result == -1) {

            System.out.println(
                    "REGISTRATION FAILED: EMAIL EXISTS"
            );

            req.setAttribute(
                    "msg",
                    "This email is already registered. Please login."
            );

            req.setAttribute(
                    "registeredEmail",
                    email
            );

            req.getRequestDispatcher(
                    "register.jsp"
            ).forward(req, resp);

            return;
        }


        // -------------------------------------------------
        // DATABASE ERROR
        // -------------------------------------------------

        System.out.println(
                "REGISTRATION FAILED: DATABASE ERROR"
        );

        req.setAttribute(
                "msg",
                "Registration failed. Please try again."
        );

        req.getRequestDispatcher(
                "register.jsp"
        ).forward(req, resp);
    }
}