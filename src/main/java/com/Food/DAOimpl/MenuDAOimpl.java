package com.Food.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Food.DAO.MenuDAO;
import com.Food.Model.Menu;
import com.Food.utility.DBConnection;

public class MenuDAOimpl implements MenuDAO {

    private static final String SELECT_QUERY =
            "SELECT * FROM menu WHERE RestaurantID=?";

    private static final String SELECT_MENU_QUERY =
            "SELECT * FROM menu WHERE MenuID=?";

    @Override
    public List<Menu> getAllMenusByRestaurant(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY)) {

            pstmt.setInt(1, restaurantId);

            try (ResultSet res = pstmt.executeQuery()) {

                while (res.next()) {

                    Menu menu = new Menu();

                    menu.setMenuId(res.getInt("MenuID"));
                    menu.setRestaurantId(res.getInt("RestaurantID"));
                    menu.setItemName(res.getString("ItemName"));
                    menu.setPrice(res.getInt("Price"));
                    menu.setDescription(res.getString("Description"));
                    menu.setImagePath(res.getString("ImagePath"));
                    menu.setRating(res.getFloat("Rating"));

                    menuList.add(menu);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public Menu getMenu(int menuId) {

        Menu menu = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT_MENU_QUERY)) {

            pstmt.setInt(1, menuId);

            try (ResultSet res = pstmt.executeQuery()) {

                if (res.next()) {

                    menu = new Menu();

                    menu.setMenuId(res.getInt("MenuID"));
                    menu.setRestaurantId(res.getInt("RestaurantID"));
                    menu.setItemName(res.getString("ItemName"));
                    menu.setPrice(res.getInt("Price"));
                    menu.setDescription(res.getString("Description"));
                    menu.setImagePath(res.getString("ImagePath"));
                    menu.setRating(res.getFloat("Rating"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public List<Menu> searchMenu(String keyword) {

        List<Menu> list = new ArrayList<>();

        String sql = "SELECT * FROM menu WHERE ItemName LIKE ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Menu menu = new Menu();

                    menu.setMenuId(rs.getInt("MenuID"));
                    menu.setRestaurantId(rs.getInt("RestaurantID"));
                    menu.setItemName(rs.getString("ItemName"));
                    menu.setPrice(rs.getInt("Price"));
                    menu.setDescription(rs.getString("Description"));
                    menu.setImagePath(rs.getString("ImagePath"));
                    menu.setRating(rs.getFloat("Rating"));

                    list.add(menu);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
