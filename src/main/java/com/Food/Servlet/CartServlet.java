package com.Food.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.DAOimpl.MenuDAOimpl;
import com.Food.Model.Cart;
import com.Food.Model.CartItem;
import com.Food.Model.Menu;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet{

   
   @Override
   protected void service(HttpServletRequest req,
                          HttpServletResponse resp)
           throws ServletException, IOException {

       HttpSession session = req.getSession();

       Cart cart = (Cart) session.getAttribute("cart");

       Integer restaurantId =
               (Integer) session.getAttribute("restaurantId");

       String restaurantParam =
               req.getParameter("restaurantId");

       if(restaurantParam == null || restaurantParam.trim().isEmpty()){

           resp.sendRedirect("callRestaurantServlet");
           return;
       }

       int newRestaurantId =
               Integer.parseInt(restaurantParam);

       if(cart == null ||
          restaurantId == null ||
          !restaurantId.equals(newRestaurantId)){

           cart = new Cart();

           session.setAttribute("cart", cart);

           session.setAttribute("restaurantId",
                                newRestaurantId);
       }

       String action = req.getParameter("action");

       if("add".equals(action)){

           addItemToCart(req, cart);

       }else if("update".equals(action)){

           updateItemTocart(req, cart);

       }else if("delete".equals(action)){

           deleteItemToCart(req, cart);
       }

       session.setAttribute("cart", cart);

       if(cart.getItems().isEmpty()){

           session.removeAttribute("cart");
       }

       resp.sendRedirect("cart.jsp");
   }

   
   
   private void deleteItemToCart(HttpServletRequest req, Cart cart) {
	   int menuId = Integer.parseInt(req.getParameter("menuId"));
	   cart.removeItem(menuId);
	
}

   
   
   private void updateItemTocart(HttpServletRequest req, Cart cart) {
	   int menuId = Integer.parseInt(req.getParameter("menuId"));
	   int quantity = Integer.parseInt(req.getParameter("quantity"));
	   
	   cart.updateItem(menuId, quantity);	
}

   
   
   private void addItemToCart(HttpServletRequest req, Cart cart) {
	   int menuId = Integer.parseInt(req.getParameter("menuId"));
	   System.out.println("Received MenuID = " + menuId);
	int quantity = Integer.parseInt(req.getParameter("quantity"));
	
	MenuDAOimpl menuDAOimpl = new MenuDAOimpl();
	Menu menu = menuDAOimpl.getMenu(menuId);
	System.out.println("Menu Object = " + menu);
	
	CartItem cartItem = new CartItem(menu.getMenuId(), 
										menu.getRestaurantId(), 
										menu.getItemName(), 
										menu.getPrice(),
										quantity,
										menu.getImagePath());
	
	cart.addItem(cartItem);
	
   }
}