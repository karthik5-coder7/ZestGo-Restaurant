<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Food.Model.Order" %>
<%@ page import="com.Food.Model.OrderItem" %>
<%@ page import="com.Food.DAOimpl.OrderDAOimpl" %>

<%
List<Order> orders =
(List<Order>)request.getAttribute("orders");

OrderDAOimpl dao = new OrderDAOimpl();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Space Grotesk',sans-serif;
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
    background: var(--paper);
    color:var(--ink);
}

/* ================= NAVBAR ================= */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:16px 60px;
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
    letter-spacing:0.02em;
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
    padding:9px 14px;
    border-radius:8px;
    transition:0.2s;
}

.nav-links a:hover{
    background: rgba(201,162,75,0.15);
    color:var(--gold);
}

/* ================= CONTAINER ================= */

.container{
    width:90%;
    max-width:900px;
    margin:50px auto 70px;
}

.page-head{
    text-align:center;
    margin-bottom:40px;
}

.page-head .eyebrow{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--coral);
    display:block;
    margin-bottom:8px;
}

.heading{
    font-size:30px;
    font-weight:700;
    color:var(--ink);
}

/* ================= ORDER CARD — itinerary record ================= */

.order-card{
    position:relative;
    background: var(--ink);
    border-radius:18px;
    padding:32px 34px 28px;
    margin-bottom:30px;
    box-shadow:0 25px 55px -22px rgba(15,42,46,0.4);
    color:var(--paper);
}

.order-card::before{
    content:"";
    position:absolute;
    inset:10px;
    border:1px dashed rgba(201,162,75,0.25);
    border-radius:12px;
    pointer-events:none;
}

/* ================= HEADER ================= */

.order-header{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;
    gap:16px;
    margin-bottom:22px;
    flex-wrap:wrap;
}

.restaurant{
    font-size:22px;
    font-weight:700;
    color:var(--paper);
}

.restaurant-label{
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    letter-spacing:0.14em;
    text-transform:uppercase;
    color:var(--gold);
    display:block;
    margin-bottom:6px;
}

/* LANDED STAMP */
.status{
    width:66px;
    height:66px;
    border-radius:50%;
    border:2px dashed var(--gold);
    display:flex;
    flex-direction:column;
    align-items:center;
    justify-content:center;
    transform:rotate(-10deg);
    flex-shrink:0;
}

.status span{
    font-family:'JetBrains Mono', monospace;
    font-size:9px;
    font-weight:700;
    letter-spacing:0.05em;
    color:var(--gold);
}

.status .check{
    font-size:16px;
    line-height:1;
    margin-bottom:2px;
}

/* ================= ORDER INFO ================= */

.order-info{
    display:flex;
    flex-wrap:wrap;
    gap:22px;
    padding:14px 0;
    border-top:1px dashed rgba(239,233,220,0.15);
    border-bottom:1px dashed rgba(239,233,220,0.15);
    margin-bottom:6px;
}

.order-info p{
    font-family:'JetBrains Mono', monospace;
    color: rgba(239,233,220,0.55);
    font-size:12px;
}

.order-info p b{
    display:block;
    color: rgba(239,233,220,0.35);
    font-size:9.5px;
    letter-spacing:0.1em;
    text-transform:uppercase;
    font-weight:700;
    margin-bottom:4px;
}

/* ================= ITEMS — manifest ================= */

.item{
    display:flex;
    gap:18px;
    align-items:center;
    padding:18px 0;
    border-bottom:1px dashed rgba(239,233,220,0.12);
}

.item img{
    width:74px;
    height:74px;
    border-radius:10px;
    object-fit:cover;
    flex-shrink:0;
}

.item-details h3{
    color:var(--paper);
    margin-bottom:6px;
    font-size:15.5px;
    font-weight:600;
}

.item-details p{
    color: rgba(239,233,220,0.5);
    margin:2px 0;
    font-size:12.5px;
    font-family:'JetBrains Mono', monospace;
}

/* ================= TOTAL ================= */

.total{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:20px;
    padding-top:16px;
    border-top:2px solid rgba(201,162,75,0.3);
    font-size:19px;
    font-weight:700;
    color:var(--gold);
}

.total .amt{
    font-family:'JetBrains Mono', monospace;
}

/* ================= DELETE BUTTON ================= */

.delete-btn{
    margin-top:20px;
    background: transparent;
    color:var(--coral);
    border:1px solid rgba(228,87,46,0.35);
    padding:11px 20px;
    border-radius:10px;
    cursor:pointer;
    font-size:13.5px;
    font-weight:600;
    transition:0.2s;
}

.delete-btn:hover{
    background: var(--coral);
    color:#fff;
}

/* ================= NO ORDERS ================= */

.no-orders{
    text-align:center;
    padding:100px 20px;
}

.no-orders .seal{
    width:64px;
    height:64px;
    margin:0 auto 20px;
    border-radius:50%;
    border:2px dashed var(--line);
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:24px;
}

.no-orders h2{
    color:var(--ink);
    margin-bottom:10px;
    font-size:24px;
    font-weight:700;
}

.no-orders p{
    color:#64748b;
    font-size:14.5px;
}

/* ================= MOBILE ================= */

@media(max-width:768px){

.navbar{
    flex-direction:column;
    gap:14px;
    padding:18px 20px;
}

.container{
    width:95%;
}

.heading{
    font-size:24px;
}

.order-header{
    flex-direction:row;
    align-items:center;
}

.item img{
    width:64px;
    height:64px;
}

}

</style>

</head>
<body>

<nav class="navbar">

    <a href="callRestaurantServlet" class="logo">
        ZestGo
    </a>

    <div class="nav-links">
        <a href="callRestaurantServlet">Home</a>
        <a href="orderHistory">My Orders</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
    </div>

</nav>

<div class="container">

<div class="page-head">
    <span class="eyebrow">Travel Record</span>
    <h1 class="heading">My Orders</h1>
</div>

<%
if(orders == null || orders.isEmpty()){
%>

<div class="no-orders">
    <div class="seal">📦</div>
    <h2>No Orders Found</h2>
    <p>Your completed orders will show up here.</p>
</div>

<%
}
else
{
    for(Order order : orders)
    {
%>

<div class="order-card">

    <div class="order-header">

        <div>
            <span class="restaurant-label">Delivered From</span>
            <div class="restaurant">
                <%= order.getRestaurantName() %>
            </div>
        </div>

        <div class="status">
            <span class="check">✓</span>
            <span>LANDED</span>
        </div>

    </div>

    <div class="order-info">

        <p>
            <b>Order ID</b>
            <%= order.getOrderId() %>
        </p>

        <p>
            <b>Payment</b>
            <%= order.getPaymentMethod() %>
        </p>

        <p>
            <b>Date</b>
            <%= order.getOrderDate() %>
        </p>

    </div>

    <%
    List<OrderItem> items =
            dao.getOrderItems(order.getOrderId());

    for(OrderItem item : items)
    {
    %>

    <div class="item">

        <img src="<%= item.getImagePath() %>">

        <div class="item-details">

            <h3>
                <%= item.getItemName() %>
            </h3>

            <p>
                Quantity : <%= item.getQuantity() %>
            </p>

            <p>
                Price : ₹<%= item.getPrice() %>
            </p>

        </div>

    </div>

    <%
    }
    %>

    <div class="total">
        <div>Total Amount</div>
        <div class="amt">₹<%= order.getTotalAmount() %></div>
    </div>

    <form action="deleteOrder" method="post">

        <input type="hidden"
               name="orderId"
               value="<%=order.getOrderId()%>">

        <button class="delete-btn">
            Delete
        </button>

    </form>

</div>

<%
    }
}
%>

</div>

</body>
</html>