<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,
                 com.Food.Model.Menu,
                 com.Food.Model.User" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo - Restaurant Menu</title>

<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500;700&display=swap"
      rel="stylesheet">

<style>

/* =========================================================
   RESET
========================================================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

html{
    scroll-behavior:smooth;
}

body{
    min-height:100vh;
    font-family:'Space Grotesk',sans-serif;

    color:#0F2A2E;

    background:#EFE9DC;

    overflow-x:hidden;

    position:relative;
}


/* =========================================================
   COLORS
========================================================= */

:root{

    --ink:#0F2A2E;

    --teal:#123B3F;

    --teal-light:#1a4b50;

    --gold:#C9A24B;

    --gold-light:#e0b862;

    --coral:#E4572E;

    --paper:#EFE9DC;

    --white:#ffffff;

    --muted:#64748b;
}


/* =========================================================
   LIGHTWEIGHT 3D BACKGROUND
========================================================= */

body::before{

    content:"";

    position:fixed;

    width:430px;
    height:430px;

    top:-180px;
    right:-120px;

    border-radius:50%;

    background:
        radial-gradient(
            circle at 35% 30%,
            rgba(201,162,75,0.30),
            rgba(201,162,75,0.10) 40%,
            transparent 72%
        );

    pointer-events:none;

    z-index:0;

    animation:
        floatingOrb 12s ease-in-out infinite;
}


body::after{

    content:"";

    position:fixed;

    width:330px;
    height:330px;

    bottom:-150px;
    left:-120px;

    border-radius:50%;

    border:1px solid rgba(18,59,63,0.14);

    box-shadow:

        0 0 0 35px rgba(18,59,63,0.025),

        0 0 0 70px rgba(18,59,63,0.018),

        0 0 0 105px rgba(18,59,63,0.012);

    pointer-events:none;

    z-index:0;

    animation:
        floatingRing 18s linear infinite;
}


@keyframes floatingOrb{

    0%,
    100%{
        transform:
            translate3d(0,0,0)
            scale(1);
    }

    50%{
        transform:
            translate3d(-45px,40px,0)
            scale(1.10);
    }
}


@keyframes floatingRing{

    from{
        transform:rotate(0deg);
    }

    to{
        transform:rotate(360deg);
    }
}


/* =========================================================
   NAVBAR
========================================================= */

.navbar{

    width:100%;

    min-height:72px;

    padding:16px 6%;

    background:rgba(15,42,46,0.97);

    display:flex;

    align-items:center;

    justify-content:space-between;

    gap:20px;

    position:relative;

    z-index:20;

    border-bottom:
        1px solid rgba(201,162,75,0.25);

    box-shadow:
        0 10px 30px rgba(15,42,46,0.15);
}


.logo{

    color:var(--paper);

    text-decoration:none;

    font-size:23px;

    font-weight:700;

    letter-spacing:0.02em;

    white-space:nowrap;
}


.logo::before{

    content:"ZG";

    display:inline-flex;

    align-items:center;

    justify-content:center;

    width:34px;

    height:34px;

    margin-right:9px;

    border-radius:50%;

    background:
        linear-gradient(
            135deg,
            var(--gold),
            var(--coral)
        );

    color:var(--ink);

    font-family:'JetBrains Mono',monospace;

    font-size:10px;

    font-weight:700;

    vertical-align:middle;
}


.nav-links{

    display:flex;

    align-items:center;

    justify-content:flex-end;

    gap:5px;

    flex-wrap:wrap;
}


.nav-links a{

    color:
        rgba(239,233,220,0.72);

    text-decoration:none;

    font-size:13px;

    font-weight:500;

    padding:9px 13px;

    border-radius:8px;

    transition:
        color 0.2s ease,
        background 0.2s ease,
        transform 0.2s ease;
}


.nav-links a:hover{

    color:var(--gold);

    background:
        rgba(201,162,75,0.12);

    transform:translateY(-1px);
}


/* =========================================================
   MAIN HEADER
========================================================= */

.header{

    width:92%;

    max-width:1150px;

    margin:42px auto 28px;

    position:relative;

    z-index:2;
}


.restaurant-info{

    position:relative;

    padding:32px 34px;

    border-radius:20px;

    background:
        linear-gradient(
            135deg,
            var(--ink),
            var(--teal)
        );

    color:var(--paper);

    overflow:hidden;

    box-shadow:
        0 25px 55px -22px
        rgba(15,42,46,0.45);
}


.restaurant-info::before{

    content:"";

    position:absolute;

    width:220px;
    height:220px;

    right:-70px;
    top:-100px;

    border-radius:50%;

    border:1px solid
        rgba(201,162,75,0.22);

    box-shadow:
        0 0 0 25px rgba(201,162,75,0.035),
        0 0 0 50px rgba(201,162,75,0.025);

    animation:
        headerFloat 10s ease-in-out infinite;
}


@keyframes headerFloat{

    0%,
    100%{
        transform:translateY(0) rotate(0deg);
    }

    50%{
        transform:translateY(15px) rotate(8deg);
    }
}


.restaurant-info::after{

    content:"";

    position:absolute;

    width:80px;
    height:80px;

    right:120px;
    bottom:-45px;

    border-radius:50%;

    background:
        rgba(201,162,75,0.08);

    filter:blur(2px);
}


.board-label{

    display:inline-block;

    margin-bottom:10px;

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:0.18em;

    text-transform:uppercase;

    color:var(--gold);
}


.restaurant-info h1{

    position:relative;

    z-index:2;

    font-size:34px;

    line-height:1.15;

    margin-bottom:7px;

    font-weight:700;
}


.restaurant-info p{

    position:relative;

    z-index:2;

    color:
        rgba(239,233,220,0.60);

    font-size:14px;

    margin-bottom:12px;
}


.rating{

    position:relative;

    z-index:2;

    display:inline-block;

    padding:6px 11px;

    border-radius:7px;

    background:
        rgba(201,162,75,0.12);

    border:
        1px solid rgba(201,162,75,0.25);

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:12px;

    font-weight:700;
}


/* =========================================================
   FAVORITE BUTTON
========================================================= */

.favorite-btn{

    position:relative;

    z-index:3;

    border:none;

    padding:11px 16px;

    border-radius:9px;

    cursor:pointer;

    color:var(--ink);

    background:
        linear-gradient(
            135deg,
            var(--gold),
            var(--gold-light)
        );

    font-family:'Space Grotesk',sans-serif;

    font-size:13px;

    font-weight:700;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease;
}


.favorite-btn:hover{

    transform:translateY(-2px);

    box-shadow:
        0 10px 22px -8px
        rgba(201,162,75,0.55);
}


.favorite-btn:active{

    transform:translateY(0);
}


/* =========================================================
   MENU SECTION
========================================================= */

.menu-section{

    width:92%;

    max-width:1150px;

    margin:0 auto 50px;

    position:relative;

    z-index:2;
}


.menu-section > h2{

    color:var(--ink);

    font-size:27px;

    font-weight:700;

    margin-bottom:5px;
}


.section-sub{

    display:block;

    margin-bottom:24px;

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10.5px;

    letter-spacing:0.12em;

    text-transform:uppercase;

    color:var(--coral);
}


/* =========================================================
   MENU GRID
========================================================= */

.menu-grid{

    display:grid;

    grid-template-columns:
        repeat(3, minmax(0,1fr));

    gap:25px;
}


/* =========================================================
   MENU CARD
========================================================= */

.menu-card{

    position:relative;

    overflow:hidden;

    background:#ffffff;

    border-radius:16px;

    border:
        1px solid rgba(15,42,46,0.08);

    box-shadow:
        0 16px 35px -18px
        rgba(15,42,46,0.30);

    transform:
        translateZ(0);

    transition:
        transform 0.28s ease,
        box-shadow 0.28s ease;

    will-change:transform;
}


.menu-card:hover{

    transform:
        translateY(-8px)
        perspective(800px)
        rotateX(1deg)
        rotateY(-1deg);

    box-shadow:
        0 25px 50px -20px
        rgba(15,42,46,0.40);
}


/* =========================================================
   FOOD IMAGE
========================================================= */

.menu-card > img{

    display:block;

    width:100%;

    height:220px;

    object-fit:cover;

    transition:
        transform 0.45s ease;

    background:#ddd;
}


.menu-card:hover > img{

    transform:scale(1.045);
}


/* Image overlay */

.menu-card::before{

    content:"";

    position:absolute;

    top:0;
    left:0;
    right:0;

    height:220px;

    background:
        linear-gradient(
            to bottom,
            rgba(15,42,46,0.02),
            transparent 55%,
            rgba(15,42,46,0.20)
        );

    pointer-events:none;

    z-index:1;
}


/* =========================================================
   MENU CONTENT
========================================================= */

.menu-content{

    padding:19px;
}


.menu-content h3{

    color:var(--ink);

    font-size:19px;

    font-weight:700;

    margin-bottom:7px;

    line-height:1.25;
}


.description{

    min-height:40px;

    color:var(--muted);

    font-size:13px;

    line-height:1.5;

    margin-bottom:14px;

    display:-webkit-box;

    -webkit-line-clamp:2;

    -webkit-box-orient:vertical;

    overflow:hidden;
}


/* =========================================================
   PRICE + RATING
========================================================= */

.price-rating{

    display:flex;

    align-items:center;

    justify-content:space-between;

    gap:10px;

    margin-bottom:15px;
}


.price{

    color:var(--ink);

    font-size:19px;

    font-weight:700;
}


.star{

    padding:5px 9px;

    border-radius:6px;

    background:var(--ink);

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:11px;

    font-weight:700;

    white-space:nowrap;
}


/* =========================================================
   ADD CART BUTTON
========================================================= */

.add-btn{

    width:100%;

    padding:12px;

    border:none;

    border-radius:9px;

    cursor:pointer;

    color:var(--ink);

    background:
        linear-gradient(
            135deg,
            var(--gold),
            var(--gold-light)
        );

    font-family:'Space Grotesk',sans-serif;

    font-size:14px;

    font-weight:700;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease;
}


.add-btn:hover{

    transform:translateY(-2px);

    box-shadow:
        0 12px 25px -10px
        rgba(201,162,75,0.60);
}


.add-btn:active{

    transform:translateY(0);
}


/* =========================================================
   SECOND FAVORITE BUTTON
========================================================= */

.menu-content form + form{

    margin-top:9px;
}


.menu-content form + form .favorite-btn{

    width:100%;

    padding:11px;

    background:
        rgba(228,87,46,0.07);

    color:var(--coral);

    border:
        1px solid rgba(228,87,46,0.20);

    font-size:13px;
}


.menu-content form + form .favorite-btn:hover{

    background:
        rgba(228,87,46,0.12);

    box-shadow:none;
}


/* =========================================================
   FOOTER
========================================================= */

footer{

    width:92%;

    max-width:1150px;

    margin:55px auto 0;

    padding:22px 10px;

    text-align:center;

    border-top:
        1px solid rgba(15,42,46,0.10);

    color:
        rgba(15,42,46,0.45);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:0.10em;
}


/* =========================================================
   TABLET
========================================================= */

@media(max-width:1000px){

    .menu-grid{

        grid-template-columns:
            repeat(2,minmax(0,1fr));

        gap:20px;
    }

    .header,
    .menu-section,
    footer{

        width:94%;
    }

    .restaurant-info h1{

        font-size:30px;
    }
}


/* =========================================================
   MOBILE
========================================================= */

@media(max-width:700px){

    .navbar{

        padding:14px 18px;

        flex-direction:column;

        align-items:stretch;

        gap:12px;
    }


    .logo{

        text-align:center;

        font-size:21px;
    }


    .nav-links{

        justify-content:center;

        gap:3px;
    }


    .nav-links a{

        font-size:11px;

        padding:8px 9px;
    }


    .header{

        width:94%;

        margin-top:25px;

        margin-bottom:22px;
    }


    .restaurant-info{

        padding:25px 21px;

        border-radius:16px;
    }


    .restaurant-info h1{

        font-size:26px;

        padding-right:40px;
    }


    .restaurant-info p{

        font-size:13px;
    }


    .menu-section{

        width:94%;
    }


    .menu-section > h2{

        font-size:24px;
    }


    .menu-grid{

        grid-template-columns:1fr;

        gap:18px;
    }


    .menu-card > img{

        height:215px;
    }


    .menu-content{

        padding:17px;
    }


    .menu-content h3{

        font-size:18px;
    }


    .description{

        min-height:auto;
    }


    footer{

        width:94%;

        margin-top:35px;
    }
}


/* =========================================================
   SMALL PHONES
========================================================= */

@media(max-width:420px){

    body{

        padding-bottom:25px;
    }


    .navbar{

        min-height:auto;

        padding:13px 10px;
    }


    .logo{

        font-size:19px;
    }


    .logo::before{

        width:29px;

        height:29px;

        font-size:9px;

        margin-right:6px;
    }


    .nav-links{

        width:100%;

        display:grid;

        grid-template-columns:
            repeat(4,1fr);
    }


    .nav-links a{

        text-align:center;

        font-size:10px;

        padding:8px 3px;
    }


    .header{

        width:95%;

        margin-top:18px;
    }


    .restaurant-info{

        padding:22px 17px;
    }


    .restaurant-info h1{

        font-size:23px;

        padding-right:0;
    }


    .board-label{

        font-size:9px;
    }


    .menu-section{

        width:95%;
    }


    .menu-section > h2{

        font-size:22px;
    }


    .section-sub{

        font-size:8.5px;
    }


    .menu-card > img{

        height:195px;
    }


    .menu-content{

        padding:15px;
    }


    .price{

        font-size:18px;
    }


    .star{

        font-size:10px;

        padding:5px 7px;
    }


    .add-btn{

        padding:12px;

        font-size:13px;
    }


    .menu-content form + form .favorite-btn{

        font-size:12px;
    }
}


/* =========================================================
   REDUCED MOTION
========================================================= */

@media(prefers-reduced-motion:reduce){

    *,
    *::before,
    *::after{

        animation:none !important;

        transition:none !important;

        scroll-behavior:auto !important;
    }
}

</style>

</head>


<body>


<!-- =====================================================
     NAVBAR
===================================================== -->

<nav class="navbar">

    <a href="callRestaurantServlet"
       class="logo">
        ZestGo
    </a>


    <div class="nav-links">

        <a href="callRestaurantServlet">
            Home
        </a>

        <a href="orderHistory">
            My Orders
        </a>

        <a href="cart.jsp">
            Cart
        </a>

        <a href="login.jsp">
            Login
        </a>

    </div>

</nav>



<!-- =====================================================
     RESTAURANT HEADER
===================================================== -->

<div class="header">

    <div class="restaurant-info">

        <span class="board-label">
            Now Serving
        </span>


        <h1>
            <%= session.getAttribute("Name") %>
        </h1>


        <p>
            <%= session.getAttribute("CuisineType") %>
        </p>


        <span class="rating">
            <%= session.getAttribute("Rating") %> ★
        </span>


        <!-- ADD RESTAURANT TO FAVORITES -->

        <form action="addFavorite"
              method="post"
              style="margin-top:20px;">

            <input type="hidden"
                   name="restaurantId"
                   value="<%= session.getAttribute("restaurantId") %>">


            <button type="submit"
                    class="favorite-btn">

                ❤️ Add Restaurant to Favorites

            </button>

        </form>

    </div>

</div>



<!-- =====================================================
     MENU
===================================================== -->

<section class="menu-section">

    <h2>
        Recommended Items
    </h2>


    <span class="section-sub">
        ZestGo Menu · Select your dishes
    </span>


    <div class="menu-grid">


<%

List<Menu> allMenusByRestaurant =
    (List<Menu>) request.getAttribute(
        "allMenusByRestaurant"
    );


if(allMenusByRestaurant != null)
{

    for(Menu menu : allMenusByRestaurant)
    {

%>


        <!-- =================================================
             MENU CARD
        ================================================== -->

        <div class="menu-card">


            <!-- FOOD IMAGE -->

            <img
                src="<%= menu.getImagePath() %>"
                alt="<%= menu.getItemName() %>">


            <div class="menu-content">


                <!-- FOOD NAME -->

                <h3>
                    <%= menu.getItemName() %>
                </h3>


                <!-- DESCRIPTION -->

                <p class="description">
                    <%= menu.getDescription() %>
                </p>


                <!-- PRICE + RATING -->

                <div class="price-rating">

                    <span class="price">
                        ₹ <%= menu.getPrice() %>
                    </span>


                    <span class="star">
                        <%= menu.getRating() %> ★
                    </span>

                </div>



                <!-- =================================================
                     ADD TO CART
                ================================================== -->

                <form action="cartServlet"
                      method="post">

                    <input
                        type="hidden"
                        name="menuId"
                        value="<%= menu.getMenuId() %>">


                    <input
                        type="hidden"
                        name="restaurantId"
                        value="<%= menu.getRestaurantId() %>">


                    <input
                        type="hidden"
                        name="quantity"
                        value="1">


                    <input
                        type="hidden"
                        name="action"
                        value="add">


                    <button
                        type="submit"
                        class="add-btn">

                        🛒 Add To Cart

                    </button>

                </form>



                <!-- =================================================
                     ADD TO FAVORITES
                ================================================== -->

                <form action="addFavorite"
                      method="post">

                    <input
                        type="hidden"
                        name="restaurantId"
                        value="<%= menu.getRestaurantId() %>">


                    <button
                        type="submit"
                        class="favorite-btn">

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



<!-- =====================================================
     FOOTER
===================================================== -->

<footer>

    © 2026 ZESTGO · DESIGNED BY KARTHIK

</footer>


</body>

</html>