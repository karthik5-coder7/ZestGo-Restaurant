<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@
   
    page import="java.util.List,
                 com.Food.Model.Menu,
                 com.Food.Model.User"
   
    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurant Menu</title>
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
    text-decoration:none;
    font-size:20px;
    font-weight:700;
    color:var(--paper);
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

/* ================= DEPARTURE BOARD HEADER ================= */

.header{
    margin:40px auto;
    width:92%;
    max-width:1100px;
    background: var(--ink);
    border-radius:18px;
    padding:36px 40px;
    box-shadow:0 25px 55px -20px rgba(15,42,46,0.4);
    position:relative;
    color:var(--paper);
}

.header::before{
    content:"";
    position:absolute;
    inset:10px;
    border:1px dashed rgba(201,162,75,0.3);
    border-radius:12px;
    pointer-events:none;
}

.board-label{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--coral);
    margin-bottom:10px;
}

.restaurant-info h1{
    font-family:'JetBrains Mono', monospace;
    font-size:38px;
    font-weight:700;
    letter-spacing:0.02em;
    color:var(--paper);
    margin-bottom:10px;
}

.restaurant-info p{
    color: rgba(239,233,220,0.6);
    margin:4px 0;
    font-size:14.5px;
    font-family:'JetBrains Mono', monospace;
    letter-spacing:0.03em;
}

.rating{
    display:inline-block;
    margin-top:16px;
    background: rgba(201,162,75,0.15);
    color:var(--gold);
    padding:8px 16px;
    border-radius:20px;
    font-weight:700;
    font-family:'JetBrains Mono', monospace;
    font-size:13px;
    border:1px solid rgba(201,162,75,0.3);
}

.favorite-btn{
    margin-top:22px;
    padding:12px 22px;
    border:none;
    border-radius:10px;
    cursor:pointer;
    font-size:14.5px;
    font-weight:700;
    color:#fff;
    background: var(--coral);
    transition:0.2s;
}

.favorite-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 12px 25px -10px rgba(228,87,46,0.5);
}

/* ================= MENU ================= */

.menu-section{
    width:92%;
    max-width:1100px;
    margin:auto;
    padding-bottom:60px;
}

.menu-section h2{
    font-size:26px;
    font-weight:700;
    color:var(--ink);
    margin-bottom:6px;
}

.menu-section .section-sub{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.14em;
    text-transform:uppercase;
    color:#94a3b8;
    margin-bottom:30px;
    display:block;
}

.menu-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(320px,1fr));
    gap:28px;
}

/* ================= CARD — boarding stub ================= */

.menu-card{
    background:#fff;
    border-radius:14px;
    overflow:hidden;
    border:1px solid var(--line);
    box-shadow:0 14px 30px -16px rgba(15,42,46,0.25);
    transition:0.25s ease;
}

.menu-card:hover{
    transform:translateY(-6px);
    box-shadow:0 22px 42px -18px rgba(15,42,46,0.35);
}

.menu-card img{
    width:100%;
    height:200px;
    object-fit:cover;
    display:block;
}

.menu-content{
    padding:22px;
    position:relative;
}

/* perforation between image and content */
.menu-content::before{
    content:"";
    position:absolute;
    top:0; left:0; right:0;
    height:1px;
    background-image: repeating-linear-gradient(90deg, var(--line) 0 6px, transparent 6px 12px);
}

.menu-content h3{
    color:var(--ink);
    font-size:19px;
    font-weight:700;
    margin:8px 0 10px;
}

.description{
    color:#64748b;
    font-size:13.5px;
    line-height:1.6;
    margin-bottom:16px;
}

/* ================= PRICE — fare style ================= */

.price-rating{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:18px;
}

.price{
    font-family:'JetBrains Mono', monospace;
    font-size:20px;
    font-weight:700;
    color:var(--ink);
}

.price::before{
    content:"FARE ";
    font-size:9px;
    font-weight:700;
    letter-spacing:0.1em;
    color:#94a3b8;
    display:block;
    margin-bottom:2px;
}

.star{
    background: var(--ink);
    color:var(--gold);
    padding:6px 12px;
    border-radius:6px;
    font-weight:700;
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
}

/* ================= BUTTONS ================= */

.add-btn{
    width:100%;
    padding:13px;
    border:none;
    border-radius:10px;
    cursor:pointer;
    font-size:14.5px;
    font-weight:700;
    color:var(--ink);
    background: linear-gradient(135deg, var(--gold), #e0b862);
    transition:0.2s;
    margin-bottom:10px;
}

.add-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 12px 25px -10px rgba(201,162,75,0.5);
}

.menu-content .favorite-btn{
    width:100%;
    margin-top:0;
    background: transparent;
    border:1px solid rgba(228,87,46,0.3);
    color:var(--coral);
}

.menu-content .favorite-btn:hover{
    background: var(--coral);
    color:#fff;
    box-shadow:none;
}

/* ================= FOOTER ================= */

footer{
    margin-top:20px;
    background: var(--ink);
    padding:26px;
    text-align:center;
    color: rgba(239,233,220,0.5);
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.05em;
}

/* ================= MOBILE ================= */

@media(max-width:768px){

.navbar{
    flex-direction:column;
    gap:14px;
    padding:18px 20px;
}

.header{
    width:95%;
    padding:26px;
}

.restaurant-info h1{
    font-size:26px;
}

.menu-section{
    width:95%;
}

.menu-grid{
    grid-template-columns:1fr;
}

}
</style>
</head>
<body>


<nav class="navbar">
    <a href="/FoodApp/callRestaurantServlet" class="logo">
        ZestGo
    </a>

    <div class="nav-links">
        <a href="/FoodApp/callRestaurantServlet">Home</a>
        <a href="/FoodApp/orderHistory">My Orders</a>
        <a href="/FoodApp/cart.jsp">Cart</a>
        <a href="/FoodApp/login.jsp">Login</a>
    </div>
</nav>


<div class="header">
    <div class="restaurant-info">

        <span class="board-label">Now Serving</span>

        <h1><%= session.getAttribute("Name") %></h1>

        <p><%= session.getAttribute("CuisineType") %></p>

        <span class="rating">
            <%= session.getAttribute("Rating") %> ★
        </span>

        <form action="addFavorite" method="post" style="margin-top:20px;">

            <input type="hidden"
                   name="restaurantId"
                   value="<%= session.getAttribute("restaurantId") %>">

            <button type="submit" class="favorite-btn">
                ❤️ Add Restaurant to Favorites
            </button>

        </form>

    </div>
</div>


<section class="menu-section">

<h2>Recommended Items</h2>
<span class="section-sub">Boarding Passes · Select your dishes</span>

<div class="menu-grid">

<% 

List<Menu> allMenusByRestaurant =
(List<Menu>) request.getAttribute("allMenusByRestaurant");

if(allMenusByRestaurant != null)
{
    for(Menu menu : allMenusByRestaurant)
    {
	%>
			<div class="menu-card">
		<img src="<%= menu.getImagePath() %>"
     		 alt="<%= menu.getItemName() %>"
    		 style="width:100%;height:220px;object-fit:cover;">
		<div class="menu-content">
		<h3><%= menu.getItemName() %></h3>
		<p class="description"><%= menu.getDescription() %></p>
		<div class="price-rating">
    <span class="price">₹ <%= menu.getPrice() %></span>
    <span class="star"><%= menu.getRating() %> ★</span>
</div>

<!-- Add To Cart -->
<form action="cartServlet" method="post">

    <input type="hidden"
           name="menuId"
           value="<%= menu.getMenuId() %>">

    <input type="hidden"
           name="restaurantId"
           value="<%= menu.getRestaurantId() %>">

    <input type="hidden"
           name="quantity"
           value="1">

    <input type="hidden"
           name="action"
           value="add">

    <button type="submit" class="add-btn">
        🛒 Add To Cart
    </button>

</form>

<!-- Add Favorite -->
<form action="addFavorite" method="post">

    <input type="hidden"
           name="restaurantId"
           value="<%= menu.getRestaurantId() %>">

    <button type="submit" class="favorite-btn">
        ❤️ Add to Favorites
    </button>

</form>
		
		
		
		</div>
		</div>
	<%
}
}

%>


</div>

</section>

<footer>© 2026 ZESTGO · DESIGNED BY KARTHIK</footer>

</body>
</html>