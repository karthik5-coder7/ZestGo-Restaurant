package com.Food.DAO;

import java.util.List;
import com.Food.Model.User;

public interface FavoriteDAO {

    void addFavorite(String userName, int restaurantId);

    List<User> getFavorites(String userName);
}