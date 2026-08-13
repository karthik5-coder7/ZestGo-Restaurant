package com.Food.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Food.DAO.OrderDAO;
import com.Food.Model.Order;
import com.Food.Model.OrderItem;
import com.Food.utility.DBConnection;

public class OrderDAOimpl implements OrderDAO {

    @Override
    public List<Order> getAllOrders(String email) {

        List<Order> orders = new ArrayList<>();

        String query =
                "SELECT * FROM orders " +
                "WHERE email=? " +
                "AND isDeleted=0 " +
                "ORDER BY orderDate DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Order order = new Order();

                    order.setOrderId(rs.getInt("orderId"));
                    order.setCustomerName(rs.getString("customerName"));
                    order.setMobile(rs.getString("mobile"));
                    order.setAddress(rs.getString("address"));
                    order.setPaymentMethod(rs.getString("paymentMethod"));
                    order.setTotalAmount(rs.getDouble("totalAmount"));
                    order.setRestaurantId(rs.getInt("restaurantId"));
                    order.setRestaurantName(rs.getString("restaurantName"));
                    order.setOrderDate(rs.getTimestamp("orderDate"));

                    orders.add(order);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    public List<OrderItem> getOrderItems(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        String query =
                "SELECT * FROM orders_items WHERE orderId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, orderId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    OrderItem item = new OrderItem();

                    item.setItemName(rs.getString("itemName"));
                    item.setPrice(rs.getDouble("price"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setImagePath(rs.getString("imagePath"));

                    items.add(item);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }

    public void deleteOrder(int orderId) {

        String query =
                "UPDATE orders SET isDeleted=1 WHERE orderId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, orderId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
