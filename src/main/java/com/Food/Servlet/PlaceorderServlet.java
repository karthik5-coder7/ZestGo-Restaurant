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
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        String email =
                (String) session.getAttribute("userName");

        // ==============================
        // LOGIN CHECK
        // ==============================
        if (email == null || email.trim().isEmpty()) {

            resp.sendRedirect(
                    req.getContextPath() + "/login.jsp"
            );

            return;
        }

        // ==============================
        // CART CHECK
        // ==============================
        Cart cart =
                (Cart) session.getAttribute("cart");

        if (cart == null ||
                cart.getItems() == null ||
                cart.getItems().isEmpty()) {

            resp.sendRedirect(
                    req.getContextPath() + "/cart.jsp"
            );

            return;
        }

        // ==============================
        // GET CUSTOMER DETAILS
        // ==============================
        String customerName =
                req.getParameter("name");

        String mobile =
                req.getParameter("mobile");

        String address =
                req.getParameter("address");

        String paymentMethod =
                req.getParameter("paymentMethod");

        // ==============================
        // CALCULATE TOTAL
        // ==============================
        double itemTotal = 0;

        for (CartItem item :
                cart.getItems().values()) {

            itemTotal += item.getTotalPrice();
        }

        double deliveryFee =
                itemTotal >= 399 ? 0 : 40;

        double platformFee = 5;

        double totalAmount =
                itemTotal +
                deliveryFee +
                platformFee;

        // ==============================
        // RESTAURANT DETAILS
        // ==============================
        Integer restaurantId =
                (Integer) session.getAttribute(
                        "restaurantId"
                );

        String restaurantName =
                (String) session.getAttribute(
                        "restaurantName"
                );

        Connection con = null;
        PreparedStatement orderStmt = null;
        PreparedStatement itemStmt = null;
        ResultSet rs = null;

        try {

            // ==============================
            // GET DATABASE CONNECTION
            // ==============================
            con = DBConnection.getConnection();

            if (con == null) {

                throw new Exception(
                        "Database connection failed."
                );
            }

            /*
             * IMPORTANT:
             *
             * One transaction means:
             *
             * orders INSERT
             * +
             * orders_items INSERTS
             *
             * are treated as one operation.
             */
            con.setAutoCommit(false);

            // ==============================
            // INSERT ORDER
            // ==============================
            String orderQuery =
                    "INSERT INTO orders "
                    + "(customerName,mobile,address,"
                    + "paymentMethod,totalAmount,"
                    + "restaurantId,restaurantName,email) "
                    + "VALUES (?,?,?,?,?,?,?,?)";

            orderStmt =
                    con.prepareStatement(
                            orderQuery,
                            Statement.RETURN_GENERATED_KEYS
                    );

            orderStmt.setString(
                    1,
                    customerName
            );

            orderStmt.setString(
                    2,
                    mobile
            );

            orderStmt.setString(
                    3,
                    address
            );

            orderStmt.setString(
                    4,
                    paymentMethod
            );

            orderStmt.setDouble(
                    5,
                    totalAmount
            );

            if (restaurantId != null) {

                orderStmt.setInt(
                        6,
                        restaurantId
                );

            } else {

                orderStmt.setNull(
                        6,
                        java.sql.Types.INTEGER
                );
            }

            orderStmt.setString(
                    7,
                    restaurantName
            );

            orderStmt.setString(
                    8,
                    email
            );

            orderStmt.executeUpdate();

            // ==============================
            // GET GENERATED ORDER ID
            // ==============================
            rs =
                    orderStmt.getGeneratedKeys();

            int orderId = 0;

            if (rs.next()) {

                orderId =
                        rs.getInt(1);
            }

            if (orderId <= 0) {

                throw new Exception(
                        "Unable to create order ID."
                );
            }

            // ==============================
            // INSERT ORDER ITEMS
            // ==============================
            String itemQuery =
                    "INSERT INTO orders_items "
                    + "(orderId,menuId,itemName,"
                    + "price,quantity,total,imagePath) "
                    + "VALUES (?,?,?,?,?,?,?)";

            itemStmt =
                    con.prepareStatement(itemQuery);

            /*
             * Instead of executing one INSERT
             * for every item:
             *
             * executeUpdate()
             *
             * we add all items to a batch and
             * execute them together.
             */
            for (CartItem item :
                    cart.getItems().values()) {

                itemStmt.setInt(
                        1,
                        orderId
                );

                itemStmt.setInt(
                        2,
                        item.getMenuId()
                );

                itemStmt.setString(
                        3,
                        item.getName()
                );

                itemStmt.setDouble(
                        4,
                        item.getPrice()
                );

                itemStmt.setInt(
                        5,
                        item.getQuantity()
                );

                itemStmt.setDouble(
                        6,
                        item.getTotalPrice()
                );

                itemStmt.setString(
                        7,
                        item.getImagePath()
                );

                itemStmt.addBatch();
            }

            // Execute all item inserts together
            itemStmt.executeBatch();

            // ==============================
            // COMMIT
            // ==============================
            con.commit();

            System.out.println(
                    "ORDER SUCCESS - Order ID: "
                    + orderId
            );

            // ==============================
            // CLEAR CART
            // ==============================
            session.removeAttribute("cart");

            session.removeAttribute(
                    "restaurantId"
            );

            session.removeAttribute(
                    "restaurantName"
            );

            // ==============================
            // SUCCESS PAGE
            // ==============================
            resp.sendRedirect(
                    req.getContextPath()
                    + "/orderSuccess.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();

            // ==============================
            // ROLLBACK
            // ==============================
            if (con != null) {

                try {

                    con.rollback();

                    System.out.println(
                            "ORDER ROLLED BACK"
                    );

                } catch (Exception rollbackError) {

                    rollbackError.printStackTrace();
                }
            }

            resp.setContentType(
                    "text/html;charset=UTF-8"
            );

            resp.getWriter().println(
                    "<h3>Order Failed!</h3>"
            );

            resp.getWriter().println(
                    "<p>Please try again.</p>"
            );

        } finally {

            // ==============================
            // CLOSE RESOURCES
            // ==============================

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (itemStmt != null) {
                    itemStmt.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (orderStmt != null) {
                    orderStmt.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (con != null) {

                    /*
                     * Restore default state before
                     * closing the connection.
                     */
                    con.setAutoCommit(true);

                    con.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}