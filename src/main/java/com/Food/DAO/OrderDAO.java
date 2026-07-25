package com.Food.DAO;

import java.util.List;
import com.Food.Model.Order;

public interface OrderDAO {

    List<Order> getAllOrders(String customerName);

}