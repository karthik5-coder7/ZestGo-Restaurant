package com.Food.DAOimpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Food.DAO.UserDAO;
import com.Food.Model.User;
import com.Food.utility.DBConnection;

public class UserDAOimpl implements UserDAO {

    private static final String INSERT_QUERY =
            "INSERT INTO food_app(Name, CuisineType, DeliveryTime, Address, AdminUserID, Rating, IsActive, ImagePath, Price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_QUERY =
            "SELECT * FROM food_app WHERE RestaurantID = ?";

    private static final String UPDATE_QUERY =
            "UPDATE food_app SET Name=?, CuisineType=?, DeliveryTime=?, Address=?, AdminUserID=?, Rating=?, IsActive=?, ImagePath=?, Price=? WHERE RestaurantID=?";

    private static final String DELETE_QUERY =
            "DELETE FROM food_app WHERE RestaurantID=?";

    private static final String SELECT_ALL_QUERY =
            "SELECT * FROM food_app";

    @Override
    public void addUser(User user) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getCuisineType());
            pstmt.setString(3, user.getDeliveryTime());
            pstmt.setString(4, user.getAddress());
            pstmt.setInt(5, user.getAdminUserID());
            pstmt.setFloat(6, user.getRating());
            pstmt.setString(7, user.getIsActive());
            pstmt.setString(8, user.getImagePath());
            pstmt.setDouble(9, user.getPrice());

            int rows = pstmt.executeUpdate();

            System.out.println(rows + " Restaurant Inserted Successfully");

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    @Override
    public User getUser(int restaurantID) {

        User user = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY)) {

            pstmt.setInt(1, restaurantID);

            ResultSet res = pstmt.executeQuery();

            if (res.next()) {

                user = new User();

                user.setRestaurantID(res.getInt("RestaurantID"));
                user.setName(res.getString("Name"));
                user.setCuisineType(res.getString("CuisineType"));
                user.setDeliveryTime(res.getString("DeliveryTime"));
                user.setAddress(res.getString("Address"));
                user.setAdminUserID(res.getInt("AdminUserID"));
                user.setRating(res.getFloat("Rating"));
                user.setIsActive(res.getString("IsActive"));
                user.setImagePath(res.getString("ImagePath"));
                user.setPrice(res.getInt("Price"));
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return user;
    }

    @Override
    public void updateUser(User user) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getCuisineType());
            pstmt.setString(3, user.getDeliveryTime());
            pstmt.setString(4, user.getAddress());
            pstmt.setInt(5, user.getAdminUserID());
            pstmt.setFloat(6, user.getRating());
            pstmt.setString(7, user.getIsActive());
            pstmt.setString(8, user.getImagePath());
            pstmt.setDouble(9, user.getPrice());
            pstmt.setInt(10, user.getRestaurantID());

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                System.out.println("Restaurant Updated Successfully");
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    @Override
    public void deleteUser(int restaurantID) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY)) {

            pstmt.setInt(1, restaurantID);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                System.out.println("Restaurant Deleted Successfully");
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    @Override
    public List<User> getAllUsers() {

        List<User> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT_ALL_QUERY)) {

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {

                User user = new User();

                user.setRestaurantID(res.getInt("RestaurantID"));
                user.setName(res.getString("Name"));
                user.setCuisineType(res.getString("CuisineType"));
                user.setDeliveryTime(res.getString("DeliveryTime"));
                user.setAddress(res.getString("Address"));
                user.setAdminUserID(res.getInt("AdminUserID"));
                user.setRating(res.getFloat("Rating"));
                user.setIsActive(res.getString("IsActive"));
                user.setImagePath(res.getString("ImagePath"));
                user.setPrice(res.getInt("Price"));

                list.add(user);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return list;
        
    }
    
    
    public List<User> searchRestaurants(String keyword) {

        List<User> list = new ArrayList<>();

        String query =
            "SELECT * FROM food_app " +
            "WHERE name LIKE ? " +
            "OR cuisineType LIKE ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    
    
    public List<User> searchRestaurant(String keyword) {

        List<User> list = new ArrayList<>();

        String query =
            "SELECT DISTINCT f.* " +
            "FROM food_app f " +
            "JOIN menu m " +
            "ON f.restaurantId = m.restaurantId " +
            "WHERE f.name LIKE ? " +
            "OR f.cuisineType LIKE ? " +
            "OR m.itemName LIKE ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    User user = new User();

                    user.setRestaurantID(rs.getInt("restaurantId"));
                    user.setName(rs.getString("name"));
                    user.setCuisineType(rs.getString("cuisineType"));
                    user.setAddress(rs.getString("address"));
                    user.setRating(rs.getFloat("rating"));
                    user.setDeliveryTime(rs.getString("deliveryTime"));
                    user.setPrice(rs.getInt("price"));
                    user.setImagePath(rs.getString("imagePath"));

                    list.add(user);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}