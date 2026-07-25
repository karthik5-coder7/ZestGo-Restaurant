<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.Food.Model.Cart,com.Food.Model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Space Grotesk', sans-serif;
}

:root{
    --ink:#0F2A2E;
    --teal:#123B3F;
    --teal-light:#1a4b50;
    --gold:#C9A24B;
    --coral:#E4572E;
    --paper:#EFE9DC;
    --line: rgba(15,42,46,0.15);
}

body{
    min-height:100vh;
    background: var(--paper);
    color:var(--ink);
}

/* NAVBAR */
.navbar{
    width:100%;
    padding:16px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    background: var(--ink);
    border-bottom:1px solid rgba(201,162,75,0.25);
    position:sticky;
    top:0;
    z-index:999;
}

.logo{
    font-size:20px;
    font-weight:700;
    color:var(--paper);
    text-decoration:none;
    display:flex;
    align-items:center;
    gap:10px;
}

.logo .mark{
    width:36px;
    height:36px;
    border-radius:10px;
    background: conic-gradient(from 210deg, var(--coral), var(--gold), var(--coral));
    display:flex;
    align-items:center;
    justify-content:center;
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
    font-weight:700;
    color:var(--ink);
}

.nav-links{
    display:flex;
    gap:6px;
}

.nav-links a{
    text-decoration:none;
    color: rgba(239,233,220,0.7);
    font-weight:500;
    font-size:14px;
    padding:8px 12px;
    border-radius:8px;
    transition:0.2s;
}

.nav-links a:hover{
    background: rgba(201,162,75,0.15);
    color:var(--gold);
}

/* CONTAINER */
.container{
    width:90%;
    max-width:640px;
    margin:50px auto 70px;
}

.page-head{
    text-align:center;
    margin-bottom:26px;
}

.page-head .eyebrow{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--coral);
    display:block;
    margin-bottom:6px;
}

.page-head h1{
    font-size:28px;
    font-weight:700;
}

/* RECEIPT */
.receipt{
    position:relative;
    background:#fff;
    box-shadow:0 20px 50px -20px rgba(15,42,46,0.3);
}

/* torn paper edge, top and bottom */
.receipt::before,
.receipt::after{
    content:"";
    position:absolute;
    left:0; right:0;
    height:14px;
    background:
        linear-gradient(135deg, #fff 50%, transparent 50%) 0 0/14px 14px repeat-x,
        linear-gradient(-135deg, #fff 50%, transparent 50%) 0 0/14px 14px repeat-x;
    background-color: var(--paper);
}
.receipt::before{ top:-14px; }
.receipt::after{
    bottom:-14px;
    transform:scaleY(-1);
}

.receipt-inner{
    padding:34px 32px 10px;
}

.receipt-title{
    text-align:center;
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
    letter-spacing:0.14em;
    text-transform:uppercase;
    color:#64748b;
    padding-bottom:20px;
    border-bottom:1px dashed var(--line);
    margin-bottom:6px;
}

/* HEADER ROW */
.cart-header{
    display:grid;
    grid-template-columns:2.6fr 0.9fr 0.9fr 1.3fr 0.9fr;
    padding:14px 0 10px;
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    letter-spacing:0.06em;
    text-transform:uppercase;
    color:#94a3b8;
}

/* ROW */
.cart-row{
    display:grid;
    grid-template-columns:2.6fr 0.9fr 0.9fr 1.3fr 0.9fr;
    align-items:center;
    padding:16px 0;
    border-top:1px dashed var(--line);
    font-size:14.5px;
}

.item-name{
    font-weight:500;
}

/* PRICE */
.price{
    font-family:'JetBrains Mono', monospace;
    font-weight:600;
    color:var(--ink);
}

/* QTY */
.qty{
    display:flex;
    justify-content:center;
    align-items:center;
    gap:8px;
}

.qty-btn{
    width:28px;
    height:28px;
    border:1px solid var(--line);
    border-radius:6px;
    background:#fff;
    color:var(--ink);
    font-size:14px;
    font-weight:700;
    cursor:pointer;
    transition:0.2s;
}

.qty-btn:hover{
    border-color:var(--gold);
    color:var(--gold);
}

.qty span{
    font-family:'JetBrains Mono', monospace;
    font-size:13px;
    min-width:16px;
    text-align:center;
}

/* REMOVE BUTTON */
.remove-btn{
    padding:7px 10px;
    border-radius:6px;
    border:1px solid rgba(228,87,46,0.3);
    background:rgba(228,87,46,0.06);
    color:var(--coral);
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    font-weight:600;
    cursor:pointer;
    transition:0.2s;
}

.remove-btn:hover{
    background:var(--coral);
    color:#fff;
}

/* TOTAL */
.total{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 0 8px;
    margin-top:6px;
    border-top:2px solid var(--ink);
    font-size:19px;
    font-weight:700;
}

.total .amount{
    font-family:'JetBrains Mono', monospace;
    color:var(--coral);
}

/* ORDER NOTE / BARCODE FOOTER */
.receipt-footer{
    padding:16px 0 26px;
    display:flex;
    align-items:center;
    justify-content:space-between;
}

.bars{
    display:flex;
    gap:2px;
    align-items:flex-end;
    height:22px;
}
.bars span{
    display:block;
    width:2px;
    background: var(--ink);
    opacity:0.6;
}

.order-note{
    font-family:'JetBrains Mono', monospace;
    font-size:10px;
    color:#94a3b8;
    letter-spacing:0.06em;
}

/* BOTTOM BUTTONS */
.bottom-buttons{
    display:flex;
    gap:14px;
    margin-top:34px;
}

/* COMMON BUTTON */
.btn{
    flex:1;
    padding:15px;
    border-radius:12px;
    border:none;
    font-size:14.5px;
    font-weight:600;
    cursor:pointer;
    transition:0.2s;
    text-align:center;
    text-decoration:none;
    display:inline-block;
}

/* ADD MORE */
.add-btn{
    background:#fff;
    border:1px solid var(--line);
    color:var(--ink);
}

.add-btn:hover{
    border-color:var(--gold);
    color:var(--gold);
}

/* CHECKOUT */
.checkout-btn{
    background: var(--ink);
    color:var(--gold);
}

.checkout-btn:hover{
    background: var(--teal-light);
}

/* EMPTY STATE */
.empty-state{
    text-align:center;
    padding:70px 30px 50px;
}
.empty-state h1{
    font-size:22px;
    margin-bottom:8px;
}
.empty-state p{
    color:#64748b;
    font-size:14px;
    margin-bottom:24px;
}

/* MOBILE */
@media(max-width:600px){

.cart-header{ display:none; }

.cart-row{
    grid-template-columns:1fr;
    gap:10px;
    text-align:left;
    padding:18px 0;
}

.qty{ justify-content:flex-start; }

.navbar{
    padding:14px 20px;
}

.nav-links{ display:none; }

.bottom-buttons{
    flex-direction:column;
}
}
</style>

</head>
<body>

<nav class="navbar">
    <a href="callRestaurantServlet" class="logo">
        <div class="mark">ZG</div>
        ZestGo
    </a>
    <div class="nav-links">
        <a href="callRestaurantServlet">Home</a>
        <a href="orderHistory">My Orders</a>
        <a href="favorites">Favorites</a>
        <a href="cart.jsp">Cart</a>
    </div>
</nav>

<div class="container">

<div class="page-head">
    <span class="eyebrow">Order Slip</span>
    <h1>Your Cart</h1>
</div>

<%
Cart cart = (Cart) session.getAttribute("cart");
double grandTotal = 0;
Integer restaurantId = (Integer) session.getAttribute("restaurantId");
%>

<% if(cart != null && !cart.getItems().isEmpty()) { %>

<div class="receipt">
    <div class="receipt-inner">

        <div class="receipt-title">ZestGo &middot; Itemized Order</div>

        <div class="cart-header">
            <div>Item</div>
            <div>Price</div>
            <div>Total</div>
            <div>Quantity</div>
            <div>Action</div>
        </div>

        <% for(CartItem item : cart.getItems().values()) {

            grandTotal += item.getTotalPrice();

            int increaseQty = item.getQuantity() + 1;
            int decreaseQty = item.getQuantity() - 1;
        %>

        <div class="cart-row">

            <div class="item-name"><%= item.getName() %></div>

            <div class="price">₹<%= item.getPrice() %></div>

            <div class="price">₹<%= item.getTotalPrice() %></div>

            <div class="qty">

                <!-- Minus Button -->
                <form action="cartServlet" method="post">

                    <input type="hidden" name="menuId"value="<%= item.getMenuId() %>">

                    <input type="hidden" name="restaurantId"value="<%= restaurantId %>">

                    <% if(decreaseQty <= 0){ %>

                        <input type="hidden"name="action"value="delete">

                    <% } else { %>

                        <input type="hidden"name="action"value="update">

                        <input type="hidden" name="quantity"value="<%= Math.max(1, item.getQuantity() - 1) %>">

                    <% } %>

                    <button class="qty-btn" type= "submit">-</button>

                </form>

                <span><%= item.getQuantity() %></span>

                <!-- Plus Button -->
                <form action="cartServlet" method="post">

                    <input type="hidden" name="menuId"value="<%= item.getMenuId() %>">

                    <input type="hidden" name="restaurantId"value="<%= restaurantId %>">

                    <input type="hidden"name="action"value="update">

                    <input type="hidden" name="quantity"value="<%= item.getQuantity() + 1 %>">

                    <button class="qty-btn">+</button>

                </form>

            </div>

            <div>

                <form action="cartServlet" method="post">

                    <input type="hidden" name="menuId"value="<%= item.getMenuId() %>">

                    <input type="hidden"name="restaurantId"value="<%= restaurantId %>">

                    <input type="hidden"name="action"value="delete">

                    <button class="remove-btn">Remove</button>

                </form>

            </div>

        </div>

        <% } %>

        <div class="total">
            <div>Grand Total</div>
            <div class="amount">₹<%= grandTotal %></div>
        </div>

        <div class="receipt-footer">
            <div class="bars" id="bars"></div>
            <div class="order-note">THANK YOU FOR ORDERING</div>
        </div>

    </div>
</div>

<div class="bottom-buttons">

<a href="menu?restaurantId=<%= restaurantId %>&Name=<%= session.getAttribute("Name") %>&CuisineType=<%= session.getAttribute("CuisineType") %>&Rating=<%= session.getAttribute("Rating") %>"
   class="btn add-btn">
    Add More Items
</a>
<a href="checkout.jsp" class="btn checkout-btn">
    Proceed To Checkout
</a>

</div>

<% } else { %>

<div class="receipt">
    <div class="receipt-inner">
        <div class="empty-state">
            <h1>Your cart is empty</h1>
            <p>Please add some food items from the menu.</p>

            <a href="callRestaurantServlet" class="btn checkout-btn" style="display:inline-block;">
                Browse Restaurants
            </a>
        </div>
    </div>
</div>

<% } %>

</div>

<script>
    var bars = document.getElementById('bars');
    if(bars){
        for(var i=0;i<32;i++){
            var b = document.createElement('span');
            var h = 8 + Math.random()*14;
            b.style.height = h+'px';
            bars.appendChild(b);
        }
    }
</script>

</body>
</html>