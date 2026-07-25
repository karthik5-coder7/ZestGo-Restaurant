package com.Food.DAO;

import java.util.List;
import com.Food.Model.Menu;

public interface MenuDAO {

    List<Menu> getAllMenusByRestaurant(int restaurantId);

    Menu getMenu(int menuId);

    List<Menu> searchMenu(String keyword);
}