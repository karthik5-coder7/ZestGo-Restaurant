package com.Food.DAO;

import com.Food.Model.Cart;
public interface CartDAO {
 void addItem(Cart cart);
 void updateItem(Cart cart);
 void deleteItem(Cart cart);
 
 Cart getCart();
}
