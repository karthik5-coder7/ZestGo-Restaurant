package com.Food.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.DAOimpl.MenuDAOimpl;
import com.Food.Model.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String restaurantIdStr = req.getParameter("restaurantId");

        if (restaurantIdStr == null || restaurantIdStr.trim().isEmpty()) {
            resp.getWriter().println("Restaurant ID is missing.");
            return;
        }

        int restaurantID;

        try {
            restaurantID = Integer.parseInt(restaurantIdStr);
        } catch (NumberFormatException e) {
            resp.getWriter().println("Invalid Restaurant ID.");
            return;
        }

        HttpSession session = req.getSession();

        session.setAttribute("restaurantId", restaurantID);

        MenuDAOimpl menuDAOimpl = new MenuDAOimpl();

        List<Menu> allMenusByRestaurant =
                menuDAOimpl.getAllMenusByRestaurant(restaurantID);

        req.setAttribute("allMenusByRestaurant", allMenusByRestaurant);

        String name = req.getParameter("Name");
        String cuisineType = req.getParameter("CuisineType");
        String rating = req.getParameter("Rating");

        if (name != null) {
            req.getSession().setAttribute("Name", name);
            req.getSession().setAttribute("restaurantName", name);
        }

        if (cuisineType != null) {
            req.getSession().setAttribute("CuisineType", cuisineType);
        }

        if (rating != null) {
            req.getSession().setAttribute("Rating", rating);
        }

        RequestDispatcher rd = req.getRequestDispatcher("/menu.jsp");
        rd.forward(req, resp);
    }
}