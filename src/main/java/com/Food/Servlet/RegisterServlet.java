package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.Food.DAOimpl.RegisterDAOimpl;
import com.Food.Model.Register;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get form data
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        // Encrypt password using BCrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        // Create Register object
        Register register = new Register(
                name,
                email,
                address,
                hashedPassword,
                role
        );

        // Save user
        RegisterDAOimpl registerDAOimpl = new RegisterDAOimpl();
        int result = registerDAOimpl.addUser(register);

        // Redirect based on result
        if (result == 1) {
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("msg", "Email already registered! Please Login.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}