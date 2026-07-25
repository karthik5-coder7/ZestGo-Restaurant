<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.Food.Model.User" %>

<%
List<User> favorites =
        (List<User>) request.getAttribute("favorites");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Favorites</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500;700&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Space Grotesk',sans-serif;
}

body{
    min-height:100vh;
    background:#EFE9DC;
    color:#0F2A2E;
}

/* CONTAINER */
.container{
    width:90%;
    max-width:1200px;
    margin:40px auto;
}

/* TITLE */
.heading{
    text-align:center;
    font-size:34px;
    font-weight:700;
    margin-bottom:40px;
    color:#0F2A2E;
    font-family:'Space Grotesk',sans-serif;
}

/* GRID */
.favorite-grid{
    display:grid;
    grid-template-columns:repeat(3, 1fr);
    gap:30px 25px;
}

/* CARD — stamp look */
.card{
    background:#fff;
    border-radius:6px;
    overflow:hidden;
    box-shadow:0 14px 30px -14px rgba(15,42,46,0.3);
    transition:0.25s ease;
    position:relative;
    border:1px solid rgba(15,42,46,0.1);
}

.card:hover{
    transform:translateY(-8px) rotate(-0.4deg);
    box-shadow:0 22px 44px -16px rgba(15,42,46,0.4);
}

/* IMAGE */
.card img{
    width:100%;
    height:180px;
    object-fit:cover;
}

/* BADGE — postmark style */
.card::before{
    content:"♥ SAVED";
    position:absolute;
    top:14px;
    right:14px;
    background:rgba(239,233,220,0.92);
    color:#0F2A2E;
    padding:6px 12px;
    border-radius:20px;
    border:1.5px dashed #0F2A2E;
    font-family:'JetBrains Mono',monospace;
    font-size:10.5px;
    letter-spacing:0.05em;
    font-weight:700;
    transform:rotate(-8deg);
}

/* CONTENT */
.content{
    padding:18px;
}

.content h2{
    font-size:18px;
    font-weight:700;
    margin-bottom:6px;
}

.content p{
    color:#64748b;
    font-size:13.5px;
    margin:3px 0;
}

/* RATING — denomination style */
.rating{
    display:inline-block;
    margin-top:10px;
    background:#0F2A2E;
    color:#C9A24B;
    padding:5px 10px;
    border-radius:6px;
    font-family:'JetBrains Mono',monospace;
    font-weight:700;
    font-size:12px;
}

/* BUTTON */
.open-btn{
    display:inline-block;
    margin-top:15px;
    padding:10px 18px;
    border-radius:8px;
    background:#0F2A2E;
    color:#C9A24B;
    text-decoration:none;
    font-size:14px;
    font-weight:600;
    transition:0.2s;
}

.open-btn:hover{
    background:#1a4b50;
}

.remove-btn{
    display:inline-block;
    margin-top:15px;
    margin-left:10px;
    padding:10px 14px;
    border-radius:8px;
    background:rgba(228,87,46,0.08);
    border:1px solid rgba(228,87,46,0.3);
    color:#E4572E;
    text-decoration:none;
    font-size:14px;
    font-weight:600;
    transition:0.2s;
}

.remove-btn:hover{
    background:#E4572E;
    color:#fff;
}

/* EMPTY STATE */
.empty{
    text-align:center;
    margin-top:150px;
}

.empty h2{
    font-size:28px;
    font-weight:700;
    margin-bottom:10px;
}

.empty p{
    color:#64748b;
    font-size:15px;
}

/* RESPONSIVE */
@media(max-width:1000px){
    .favorite-grid{
        grid-template-columns:repeat(2, 1fr);
    }
}

@media(max-width:650px){
    .favorite-grid{
        grid-template-columns:repeat(1, 1fr);
    }
}

</style>

</head>

<body>

<div class="container">

<h1 class="heading">❤️ My Favorite Restaurants</h1>

<%
if(favorites != null && !favorites.isEmpty()){
%>

<div class="favorite-grid">

<%
for(User user : favorites){
%>

<div class="card">

<img src="<%= user.getImagePath() %>">

<div class="content">

<h2><%= user.getName() %></h2>

<p><%= user.getCuisineType() %></p>

<p>📍 <%= user.getAddress() %></p>

<span class="rating">⭐ <%= user.getRating() %></span>

<br>

<!-- FIXED MENU LINK -->
<a class="open-btn"
   href="menu?restaurantId=<%= user.getRestaurantID() %>">
   View Menu
</a>

<!-- REMOVE FAVORITE -->
<a class="remove-btn"
   href="removeFavorite?restaurantId=<%= user.getRestaurantID() %>">
   ❌ Remove
</a>

</div>

</div>

<%
}
%>

</div>

<%
}else{
%>

<div class="empty">
<h2>No Favorites Yet ❤️</h2>
<p>Go back and add restaurants to your favorites.</p>

<a class="open-btn" href="callRestaurantServlet">
Browse Restaurants
</a>

</div>

<%
}
%>

</div>

</body>
</html>