package com.Food.Model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private  Map<Integer, CartItem> items;

    public Cart() {
        items = new HashMap<>();
    }

    
    
    // additem
    public  void addItem(CartItem item) {

        int menuId = item.getMenuId();

        if(items.containsKey(menuId)) {
            CartItem existing = items.get(menuId);
            existing.setQuantity(
                    existing.getQuantity()
                    + item.getQuantity());
        }
        else {
            items.put(menuId, item);
        }
    }

    
    
    // updateitem
    public void updateItem(int menuId,int quantity) {

        if(items.containsKey(menuId)) {
        	if(quantity > 0)
        	{
        		CartItem existingItem = items.get(menuId);
            	existingItem.setQuantity(quantity);
//            items.get(menuId).setQuantity(quantity);
        	} else 
        	{
        		items.remove(menuId);
        	}
        }
    }
    
    
    
    //removeItem
    public void removeItem(int menuId) {
        items.remove(menuId);
    }
    
    
    

    public Map<Integer, CartItem> getItems() {
        return items;
    }
}