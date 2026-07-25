<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@page import="java.util.List, com.Food.Model.User"%>
<%@page import="com.Food.DAOimpl.FavoriteDAOimpl"%>

<%
String userName = (String) session.getAttribute("userName");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZestGo</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">

<style>
:root{
    --ink:#0F2A2E;
    --teal:#123B3F;
    --teal-light:#1a4b50;
    --gold:#C9A24B;
    --coral:#E4572E;
    --paper:#EFE9DC;
    --line: rgba(15,42,46,0.12);
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Space Grotesk', sans-serif;
}

body{
    background: var(--paper);
    color:var(--ink);
}

/* NAVBAR */
.navbar{
    background: var(--ink);
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:16px 50px;
    position:sticky;
    top:0;
    z-index:1000;
    border-bottom:1px solid rgba(201,162,75,0.25);
}

/* LOGO */
.logo-wrap{
    display:flex;
    align-items:center;
    gap:12px;
    text-decoration:none;
}

.logo-img{
    width:60px;
    height:60px;
    border-radius:50%;
    object-fit:cover;
    background:#fff;
    border:3px solid #ffffff;
    box-shadow:0 4px 12px rgba(0,0,0,0.25);
}

.logo-text{
    font-size:22px;
    font-weight:700;
    color:var(--paper);
    letter-spacing:1px;
}

/* NAV LINKS */
.nav-links{
    display:flex;
    align-items:center;
    gap:6px;
}

.nav-links a{
    text-decoration:none;
    color: rgba(239,233,220,0.7);
    padding:9px 14px;
    border-radius:8px;
    font-weight:500;
    font-size:14px;
    transition:0.2s;
}

.nav-links a:hover{
    background: rgba(201,162,75,0.15);
    color:var(--gold);
}

/* AVATAR + DROPDOWN */
.avatar-wrap{
    position:relative;
}

.avatar-btn{
    width:38px;
    height:38px;
    border-radius:50%;
    border:none;
    cursor:pointer;
    background: conic-gradient(from 210deg, var(--coral), var(--gold), var(--coral));
    color:var(--ink);
    font-family:'JetBrains Mono', monospace;
    font-weight:700;
    font-size:13px;
    display:flex;
    align-items:center;
    justify-content:center;
    box-shadow:0 0 0 2px rgba(239,233,220,0.15);
    transition:0.2s;
}

.avatar-btn:hover{
    box-shadow:0 0 0 2px rgba(201,162,75,0.5);
}

.dropdown{
    position:absolute;
    top:52px;
    right:0;
    width:250px;
    background: var(--ink);
    border:1px solid rgba(201,162,75,0.25);
    border-radius:12px;
    box-shadow:0 20px 40px -12px rgba(0,0,0,0.5);
    padding:8px;
    display:none;
    flex-direction:column;
    z-index:1100;
}

.dropdown.open{
    display:flex;
}

.dropdown .mail{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    color: rgba(239,233,220,0.5);
    padding:10px 12px 12px;
    border-bottom:1px dashed rgba(239,233,220,0.15);
    margin-bottom:6px;
    word-break:break-all;
}

.dropdown a{
    text-decoration:none;
    color: rgba(239,233,220,0.85);
    font-size:14px;
    font-weight:500;
    padding:10px 12px;
    border-radius:8px;
    display:flex;
    align-items:center;
    gap:10px;
    transition:0.15s;
}

.dropdown a:hover{
    background: rgba(201,162,75,0.15);
    color:var(--gold);
}

.dropdown a.logout{
    color:var(--coral);
    margin-top:4px;
}

.dropdown a.logout:hover{
    background: rgba(228,87,46,0.15);
    color:var(--coral);
}

/* HERO */
.hero{
    padding:80px 24px 70px;
    text-align:center;
    background:
        radial-gradient(circle at 20% 10%, var(--teal-light) 0%, var(--ink) 65%);
}

.hero h1{
    font-size:36px;
    font-weight:700;
    color:var(--paper);
    margin-bottom:8px;
}

.hero .eyebrow{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--gold);
    margin-bottom:14px;
    display:block;
}

/* SEARCH BOX */
.search-box{
    margin-top:24px;
    width:560px;
    max-width:100%;
    padding:15px 22px;
    border-radius:12px;
    border:1px solid rgba(239,233,220,0.2);
    background: rgba(239,233,220,0.06);
    color:var(--paper);
    outline:none;
    font-family:'Space Grotesk', sans-serif;
    font-size:15px;
    transition:0.2s;
}

.search-box::placeholder{
    color: rgba(239,233,220,0.4);
}

.search-box:focus{
    border-color:var(--gold);
    background: rgba(239,233,220,0.1);
}

/* GRID */
.restaurant-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(270px,1fr));
    gap:24px;
    padding:50px;
}

/* CARD — boarding-pass style */
.card{
    background:#fff;
    border-radius:14px;
    overflow:hidden;
    position:relative;
    box-shadow:0 10px 30px -12px rgba(15,42,46,0.25);
    border:1px solid var(--line);
    transition:0.25s ease;
}

.card:hover{
    transform:translateY(-6px);
    box-shadow:0 18px 40px -14px rgba(15,42,46,0.35);
}

/* IMAGE */
.card img{
    width:100%;
    height:190px;
    object-fit:cover;
    display:block;
}

/* OFFER STAMP */
.offer{
    position:absolute;
    top:12px;
    left:12px;
    background: var(--ink);
    color:var(--gold);
    padding:6px 12px;
    border-radius:6px;
    font-family:'JetBrains Mono', monospace;
    font-size:10px;
    letter-spacing:0.05em;
    text-transform:uppercase;
    border:1px solid rgba(201,162,75,0.4);
}

/* FAVORITE */
.favorite{
    position:absolute;
    top:10px;
    right:10px;
    width:38px;
    height:38px;
    border:none;
    border-radius:50%;
    background: rgba(255,255,255,0.9);
    color:var(--coral);
    cursor:pointer;
    font-size:16px;
    box-shadow:0 4px 12px rgba(0,0,0,.15);
    transition:0.2s;
}

.favorite:hover{
    transform:scale(1.12);
    background:var(--coral);
    color:#fff;
}

/* CONTENT */
.card-content{
    padding:16px 18px 18px;
    position:relative;
}

/* perforation between image and content, ticket-style */
.card-content::before{
    content:"";
    position:absolute;
    top:0; left:0; right:0;
    height:1px;
    background-image: repeating-linear-gradient(90deg, var(--line) 0 6px, transparent 6px 12px);
}

.title-rating{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;
    gap:10px;
    margin-top:6px;
}

.title-rating h3{
    font-size:16px;
    font-weight:700;
}

.rating{
    background: var(--ink);
    color:var(--gold);
    padding:4px 9px;
    border-radius:6px;
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    white-space:nowrap;
}

.card-content p{
    color:#475569;
    font-size:13px;
    margin-top:6px;
}

.card-content small{
    display:block;
    margin-top:8px;
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    color: var(--gold);
    letter-spacing:0.04em;
}

/* CARD LINK */
.card-link{
    text-decoration:none;
    color:inherit;
    display:block;
}

/* FOOTER */
footer{
    text-align:center;
    padding:26px;
    background: var(--ink);
    color: rgba(239,233,220,0.5);
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.05em;
}

/* Mobile */
@media(max-width:768px){
    .navbar{ padding:14px 20px; flex-wrap:wrap; gap:10px; }
    .nav-links{ flex-wrap:wrap; justify-content:center; }
    .hero{ padding:56px 20px 46px; }
    .hero h1{ font-size:26px; }
    .search-box{ width:100%; }
    .restaurant-grid{ padding:24px; gap:18px; }
}
</style>
</head>

<body>

<nav class="navbar">

    <!-- LOGO -->
    <a href="callRestaurantServlet" class="logo-wrap">
    <img src="Image/ZestGo.png" class="logo-img" alt="ZestGo Logo">
    <div class="logo-text">ZestGo</div>
</a>

    <div class="nav-links">
        <a href="callRestaurantServlet">Home</a>

        <% if(userName == null){ %>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Sign Up</a>
        <% } else { %>
            <div class="avatar-wrap">
                <button type="button" class="avatar-btn" id="avatarBtn"
                        onclick="document.getElementById('avatarDropdown').classList.toggle('open'); event.stopPropagation();">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="8" r="4"></circle>
                        <path d="M4 20c0-4.4 3.6-7 8-7s8 2.6 8 7"></path>
                    </svg>
                </button>

                <div class="dropdown" id="avatarDropdown">
                    <div class="mail"><%= userName %></div>
                    <a href="profile.jsp">👤 My Profile</a>
                    <a href="orderHistory">📦 My Orders</a>
                    <a href="favorites">❤️ Favorites</a>
                    <a href="cart.jsp">🛒 Cart</a>
                    <a href="logout" class="logout">🚪 Logout</a>
                </div>
            </div>
        <% } %>
    </div>

</nav>

<script>
document.addEventListener('click', function(e){
    var dropdown = document.getElementById('avatarDropdown');
    if(dropdown && dropdown.classList.contains('open')){
        dropdown.classList.remove('open');
    }
});
</script>

<section class="hero">
    <div>
        <span class="eyebrow">ZestGo Delivery</span>
        <h1>🍽️ Every Craving, One Destination.</h1>

        <form action="callRestaurantServlet" method="get">
            <input type="text" name="keyword" class="search-box"
                   placeholder="Search restaurants...">
        </form>
    </div>
</section>

<div class="restaurant-grid">

<%
FavoriteDAOimpl favDao = new FavoriteDAOimpl();
List<User> allUsers = (List<User>) request.getAttribute("allUsers");

for(User user : allUsers){

    boolean favorite = false;

    if(userName != null){
        favorite = favDao.isFavorite(userName, user.getRestaurantID());
    }
%>

<div class="card">

    <!-- FAVORITE -->
    <% if(favorite){ %>
    <form action="removeFavorite" method="get">
        <input type="hidden" name="restaurantId" value="<%= user.getRestaurantID() %>">
        <button class="favorite" type="submit">❤️</button>
    </form>
    <% } else { %>
    <form action="addFavorite" method="get">
        <input type="hidden" name="restaurantId" value="<%= user.getRestaurantID() %>">
        <button class="favorite" type="submit">🤍</button>
    </form>
    <% } %>

    <!-- CLICKABLE CARD -->
    <a class="card-link"
       href="menu?restaurantId=<%= user.getRestaurantID() %>&Name=<%= user.getName() %>&CuisineType=<%= user.getCuisineType() %>&Rating=<%= user.getRating() %>">

       <%
String[] offers = {
    "🔥 50% OFF",
    "🎉 40% OFF",
    "🚚 FREE DELIVERY",
    "💳 ₹125 OFF",
    "🍕 BUY 1 GET 1",
    "🥳 30% OFF",
    "💰 ₹100 CASHBACK",
    "⭐ 20% OFF",
    "🎁 FREE DESSERT",
    "🍔 COMBO @ ₹199",
    "🌮 Flat ₹99 OFF",
    "🍟 Extra 15% OFF",
    "🥤 Free Coke",
    "🍗 Family Pack Offer",
    "🍰 Free Cake Slice"
};

String offer = offers[Math.abs(user.getRestaurantID()) % offers.length];
%>

<span class="offer"><%= offer %></span>

        <img src="<%= user.getImagePath() %>">

        <div class="card-content">
            <div class="title-rating">
                <h3><%= user.getName() %></h3>
                <span class="rating"><%= user.getRating() %> ★</span>
            </div>

            <p><%= user.getCuisineType() %></p>
            <p>📍 <%= user.getAddress() %></p>
            <small><%= user.getDeliveryTime() %></small>
        </div>

    </a>

</div>

<% } %>

</div>

<footer>
© 2026 ZESTGO · DESIGNED BY KARTHIK
</footer>

</body>
</html>