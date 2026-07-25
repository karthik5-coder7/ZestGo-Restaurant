package com.Food.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Food.DAOimpl.OrderDAOimpl;
import com.Food.Model.Order;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        String email =
                (String) session.getAttribute("userName");

        OrderDAOimpl dao =
                new OrderDAOimpl();

        List<Order> orders =
                dao.getAllOrders(email);

        req.setAttribute("orders", orders);

        RequestDispatcher rd =
                req.getRequestDispatcher(
                        "orderHistory.jsp");

        rd.forward(req, resp);
    }
}