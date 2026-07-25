package com.Food.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.Model.Cart;
import com.Food.Model.CartItem;
import com.Food.utility.DBConnection;

@WebServlet("/placeOrderServlet")
public class PlaceorderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        
        String userName = (String) session.getAttribute("userName");

        if(userName == null)
        {
            resp.setContentType("text/html");

            resp.getWriter().println(
                "<script>"
                + "alert('You are not logged in. Please login first!');"
                + "window.location='login.jsp';"
                + "</script>");

            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        String customerName = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String paymentMethod = req.getParameter("paymentMethod");
        String email = (String) session.getAttribute("userName");

        double itemTotal = 0;

        for (CartItem item : cart.getItems().values()) {
            itemTotal += item.getTotalPrice();
        }

        double deliveryFee = itemTotal >= 399 ? 0 : 40;
        double platformFee = 5;
        double totalAmount = itemTotal + deliveryFee + platformFee;

        Connection con = null;
        PreparedStatement orderStmt = null;
        PreparedStatement itemStmt = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();
            
            Integer restaurantId =
                    (Integer) session.getAttribute("restaurantId");

            String restaurantName =
                    (String) session.getAttribute("restaurantName");

            // Insert into orders table
            String orderQuery =
            		"INSERT INTO orders "
            		+ "(customerName,mobile,address,paymentMethod,totalAmount,restaurantId,restaurantName,email) "
            		+ "VALUES (?,?,?,?,?,?,?,?)";

            orderStmt = con.prepareStatement(
                    orderQuery,
                    Statement.RETURN_GENERATED_KEYS);

            orderStmt.setString(1, customerName);
            orderStmt.setString(2, mobile);
            orderStmt.setString(3, address);
            orderStmt.setString(4, paymentMethod);
            orderStmt.setDouble(5, totalAmount);
            if (restaurantId != null) {
                orderStmt.setInt(6, restaurantId);
            } else {
                orderStmt.setNull(6, java.sql.Types.INTEGER);
            }
            orderStmt.setString(7, restaurantName);
            orderStmt.setString(8, email);

            orderStmt.executeUpdate();

            // Get generated orderId
            rs = orderStmt.getGeneratedKeys();

            int orderId = 0;

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert into orders_items table
            String itemQuery =
                    "INSERT INTO orders_items "
                    + "(orderId,menuId,itemName,price,quantity,total,imagePath) "
                    + "VALUES (?,?,?,?,?,?,?)";

            System.out.println(itemQuery);
            itemStmt = con.prepareStatement(itemQuery);

            for (CartItem item : cart.getItems().values()) {

                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getMenuId());
                itemStmt.setString(3, item.getName());
                itemStmt.setDouble(4, item.getPrice());
                itemStmt.setInt(5, item.getQuantity());
                itemStmt.setDouble(6, item.getTotalPrice());
                itemStmt.setString(7, item.getImagePath());

                itemStmt.executeUpdate();
            }

            // Clear cart
            session.removeAttribute("cart");
            session.removeAttribute("restaurantId");
            session.removeAttribute("restaurantName");

            // Redirect to success page
            resp.sendRedirect("orderSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Order Failed !<br>");
            resp.getWriter().println(e.getMessage());
        } finally {

            try {
                if (rs != null)
                    rs.close();

                if (itemStmt != null)
                    itemStmt.close();

                if (orderStmt != null)
                    orderStmt.close();

                if (con != null)
                    con.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}