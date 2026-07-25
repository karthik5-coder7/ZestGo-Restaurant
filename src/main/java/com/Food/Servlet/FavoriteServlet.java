package com.Food.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Food.DAOimpl.FavoriteDAOimpl;

@WebServlet("/addFavorite")
public class FavoriteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        String userName = (String) session.getAttribute("userName");

        if (userName == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int restaurantId =
                Integer.parseInt(req.getParameter("restaurantId"));

        FavoriteDAOimpl dao = new FavoriteDAOimpl();

        if (!dao.isFavorite(userName, restaurantId)) {
            dao.addFavorite(userName, restaurantId);
        }

        resp.sendRedirect("favorites");
    }
}