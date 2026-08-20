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

    private static final String RESTAURANT_CACHE =
            "ALL_RESTAURANTS_CACHE";

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");

        UserDAOimpl dao = new UserDAOimpl();

        List<User> allUsers;

        /*
         * SEARCH
         *
         * Search should always go to the database because
         * the keyword changes the result.
         */
        if (keyword != null && !keyword.trim().isEmpty()) {

            String searchKeyword = keyword.trim();

            allUsers = dao.searchRestaurant(searchKeyword);

        }

        /*
         * NORMAL HOME PAGE
         *
         * Use cached restaurant data instead of querying
         * the database every time the user returns to Home.
         */
        else {

            synchronized (getServletContext()) {

                @SuppressWarnings("unchecked")
                List<User> cachedUsers =
                        (List<User>) getServletContext()
                                .getAttribute(RESTAURANT_CACHE);

                if (cachedUsers == null) {

                    System.out.println(
                            "RESTAURANT CACHE EMPTY - Loading from database..."
                    );

                    cachedUsers = dao.getAllUsers();

                    getServletContext().setAttribute(
                            RESTAURANT_CACHE,
                            cachedUsers
                    );

                    System.out.println(
                            "RESTAURANT CACHE CREATED - "
                            + cachedUsers.size()
                            + " restaurants loaded."
                    );

                } else {

                    System.out.println(
                            "RESTAURANT CACHE USED - "
                            + cachedUsers.size()
                            + " restaurants."
                    );
                }

                allUsers = cachedUsers;
            }
        }

        req.setAttribute("allUsers", allUsers);

        RequestDispatcher rd =
                req.getRequestDispatcher(
                        "/restaurant.jsp"
                );

        rd.forward(req, resp);
    }

    /*
     * Call this method whenever restaurant data is changed.
     * It forces the next Home request to reload the database.
     */
    public static void clearRestaurantCache(
            javax.servlet.ServletContext context) {

        context.removeAttribute(RESTAURANT_CACHE);

        System.out.println(
                "RESTAURANT CACHE CLEARED"
        );
    }
}