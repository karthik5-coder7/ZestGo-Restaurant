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

@WebServlet("/callRestaurantServlet")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UserDAOimpl dao = new UserDAOimpl();

        String keyword = req.getParameter("keyword");

        List<User> allUsers;

        if (keyword != null && !keyword.trim().isEmpty()) {

            // Search restaurant name, cuisine and menu item
            allUsers = dao.searchRestaurant(keyword);

        } else {

            // Show all restaurants
            allUsers = dao.getAllUsers();
        }

        req.setAttribute("allUsers", allUsers);

        RequestDispatcher rd = req.getRequestDispatcher("/restaurant.jsp");
        rd.forward(req, resp);
    }
}