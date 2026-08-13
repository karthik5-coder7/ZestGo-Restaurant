package com.Food.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Food.Model.User;
import com.Food.utility.DBConnection;

public class FavoriteDAOimpl {

    public List<User> getFavorites(String userName) {

        List<User> list = new ArrayList<>();

        String query =
                "SELECT f.* FROM food_app f " +
                "JOIN favorites fa ON f.restaurantId = fa.restaurantId " +
                "WHERE fa.userName=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, userName);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    User u = new User();

                    u.setRestaurantID(rs.getInt("restaurantId"));
                    u.setName(rs.getString("name"));
                    u.setCuisineType(rs.getString("cuisineType"));
                    u.setAddress(rs.getString("address"));
                    u.setRating(rs.getFloat("rating"));
                    u.setDeliveryTime(rs.getString("deliveryTime"));
                    u.setPrice(rs.getInt("price"));
                    u.setImagePath(rs.getString("imagePath"));

                    list.add(u);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void addFavorite(String userName, int restaurantId) {

        String query =
                "INSERT INTO favorites(userName, restaurantId) " +
                "SELECT ?, ? " +
                "WHERE NOT EXISTS (" +
                "SELECT * FROM favorites " +
                "WHERE userName=? AND restaurantId=?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, userName);
            ps.setInt(2, restaurantId);
            ps.setString(3, userName);
            ps.setInt(4, restaurantId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeFavorite(String userName, int restaurantId) {

        String query =
                "DELETE FROM favorites " +
                "WHERE userName=? AND restaurantId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, userName);
            ps.setInt(2, restaurantId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isFavorite(String userName, int restaurantId) {

        String query =
                "SELECT * FROM favorites " +
                "WHERE userName=? AND restaurantId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, userName);
            ps.setInt(2, restaurantId);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
