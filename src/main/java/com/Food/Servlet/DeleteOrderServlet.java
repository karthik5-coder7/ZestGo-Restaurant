package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Food.DAOimpl.OrderDAOimpl;

@WebServlet("/deleteOrder")
public class DeleteOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(
                        req.getParameter("orderId"));

        OrderDAOimpl dao =
                new OrderDAOimpl();

        dao.deleteOrder(orderId);

        resp.sendRedirect("orderHistory");
    }
}