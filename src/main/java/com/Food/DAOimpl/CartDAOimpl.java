package com.Food.DAOimpl;

import com.Food.DAO.CartDAO;
import com.Food.Model.Cart;

public class CartDAOimpl implements CartDAO {

    private Cart cart;

    public CartDAOimpl() {
        cart = new Cart();
    }

    @Override
    public void addItem(Cart cart) {
        this.cart = cart;
    }

    @Override
    public void updateItem(Cart cart) {
        this.cart = cart;
    }

    @Override
    public void deleteItem(Cart cart) {
        this.cart = cart;
    }

    @Override
    public Cart getCart() {
        return cart;
    }
}