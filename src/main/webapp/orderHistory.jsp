<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Food.Model.Order" %>
<%@ page import="com.Food.Model.OrderItem" %>
<%@ page import="com.Food.DAOimpl.OrderDAOimpl" %>

<%
List<Order> orders =
        (List<Order>) request.getAttribute("orders");

OrderDAOimpl dao = new OrderDAOimpl();
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo - My Orders</title>

<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500;700&display=swap"
      rel="stylesheet">

<style>

/* =====================================================
   RESET
===================================================== */

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

    color:#EFE9DC;

    overflow-x:hidden;

    position:relative;

    background:
        radial-gradient(
            circle at 50% 45%,
            #1a4b50 0%,
            #123B3F 35%,
            #0F2A2E 72%,
            #081517 100%
        );
}


/* =====================================================
   COLORS
===================================================== */

:root{

    --ink:#0F2A2E;

    --teal:#123B3F;

    --teal-light:#1a4b50;

    --gold:#C9A24B;

    --gold-light:#e0b862;

    --coral:#E4572E;

    --paper:#EFE9DC;

    --muted:#9eabb0;

    --white:#ffffff;
}


/* =====================================================
   3D BACKGROUND SCENE
===================================================== */

.background-scene{

    position:fixed;

    inset:0;

    overflow:hidden;

    pointer-events:none;

    z-index:0;

    perspective:1000px;
}


/* =====================================================
   3D GOLDEN SPHERE
===================================================== */

.orb{

    position:absolute;

    width:230px;

    height:230px;

    top:15%;

    right:7%;

    border-radius:50%;

    background:
        radial-gradient(
            circle at 28% 23%,
            rgba(255,255,255,.75) 0%,
            rgba(255,255,255,.20) 7%,
            rgba(224,184,98,.95) 18%,
            rgba(201,162,75,.75) 42%,
            rgba(122,91,29,.55) 68%,
            rgba(20,20,10,.8) 100%
        );

    box-shadow:

        inset -35px -35px 55px
        rgba(0,0,0,.55),

        inset 20px 20px 35px
        rgba(255,255,255,.12),

        0 30px 80px
        rgba(0,0,0,.4),

        0 0 70px
        rgba(201,162,75,.14);

    transform-style:preserve-3d;

    animation:
        orbFloat 9s ease-in-out infinite;
}


/* =====================================================
   ORB ANIMATION
===================================================== */

@keyframes orbFloat{

    0%{

        transform:
            translate3d(0,0,0)
            rotateX(0deg)
            rotateY(0deg)
            scale(1);

    }

    25%{

        transform:
            translate3d(-35px,25px,50px)
            rotateX(25deg)
            rotateY(45deg)
            scale(1.06);

    }

    50%{

        transform:
            translate3d(-15px,65px,20px)
            rotateX(55deg)
            rotateY(100deg)
            scale(.95);

    }

    75%{

        transform:
            translate3d(30px,30px,60px)
            rotateX(25deg)
            rotateY(145deg)
            scale(1.05);

    }

    100%{

        transform:
            translate3d(0,0,0)
            rotateX(0deg)
            rotateY(180deg)
            scale(1);

    }

}


/* =====================================================
   3D ROTATING CUBE
===================================================== */

.cube{

    position:absolute;

    width:130px;

    height:130px;

    left:8%;

    bottom:17%;

    border-radius:25px;

    background:
        linear-gradient(
            135deg,
            rgba(201,162,75,.75),
            rgba(228,87,46,.42),
            rgba(18,59,63,.55)
        );

    border:
        1px solid
        rgba(239,233,220,.25);

    box-shadow:

        inset 15px 15px 30px
        rgba(255,255,255,.12),

        inset -25px -25px 40px
        rgba(0,0,0,.45),

        0 35px 75px
        rgba(0,0,0,.45);

    transform-style:preserve-3d;

    animation:
        cubeFloat 11s ease-in-out infinite;
}


/* =====================================================
   CUBE INNER GLOW
===================================================== */

.cube::before{

    content:"";

    position:absolute;

    inset:18px;

    border-radius:17px;

    border:
        1px solid
        rgba(239,233,220,.20);

    background:
        linear-gradient(
            135deg,
            rgba(255,255,255,.12),
            transparent
        );

    box-shadow:
        inset 5px 5px 15px
        rgba(255,255,255,.08);
}


/* =====================================================
   CUBE ANIMATION
===================================================== */

@keyframes cubeFloat{

    0%{

        transform:
            perspective(800px)
            translate3d(0,0,0)
            rotateX(15deg)
            rotateY(-20deg)
            rotateZ(0deg);

    }

    25%{

        transform:
            perspective(800px)
            translate3d(35px,-30px,50px)
            rotateX(55deg)
            rotateY(35deg)
            rotateZ(15deg);

    }

    50%{

        transform:
            perspective(800px)
            translate3d(10px,-60px,80px)
            rotateX(100deg)
            rotateY(90deg)
            rotateZ(35deg);

    }

    75%{

        transform:
            perspective(800px)
            translate3d(-35px,-25px,50px)
            rotateX(150deg)
            rotateY(140deg)
            rotateZ(15deg);

    }

    100%{

        transform:
            perspective(800px)
            translate3d(0,0,0)
            rotateX(195deg)
            rotateY(180deg)
            rotateZ(0deg);

    }

}


/* =====================================================
   FLOATING RINGS
===================================================== */

.ring{

    position:absolute;

    border-radius:50%;

    border:
        1px solid
        rgba(201,162,75,.18);

    transform-style:preserve-3d;

    animation:
        ringFloat 15s linear infinite;
}


.ring-one{

    width:280px;

    height:280px;

    left:-130px;

    top:25%;
}


.ring-two{

    width:420px;

    height:420px;

    right:-220px;

    bottom:-160px;

    border-color:
        rgba(239,233,220,.08);

    animation-duration:22s;

    animation-direction:reverse;
}


@keyframes ringFloat{

    from{

        transform:
            rotateX(60deg)
            rotateZ(0deg);

    }

    to{

        transform:
            rotateX(60deg)
            rotateZ(360deg);

    }

}


/* =====================================================
   SMALL FLOATING PARTICLES
===================================================== */

.particle{

    position:absolute;

    width:5px;

    height:5px;

    border-radius:50%;

    background:var(--gold);

    box-shadow:
        0 0 12px
        rgba(201,162,75,.7);

    animation:
        particleFloat 7s ease-in-out infinite;
}


.p1{
    top:24%;
    left:35%;
}

.p2{
    top:62%;
    right:28%;
    animation-delay:2s;
}

.p3{
    top:40%;
    left:13%;
    animation-delay:4s;
}

.p4{
    bottom:25%;
    right:13%;
    animation-delay:1s;
}


@keyframes particleFloat{

    0%,
    100%{

        transform:
            translate3d(0,0,0);

        opacity:.35;
    }

    50%{

        transform:
            translate3d(25px,-35px,70px);

        opacity:1;
    }

}


/* =====================================================
   NAVBAR
===================================================== */

.navbar{

    width:100%;

    min-height:72px;

    padding:16px 6%;

    background:
        rgba(15,42,46,.96);

    display:flex;

    align-items:center;

    justify-content:space-between;

    gap:20px;

    position:relative;

    z-index:20;

    border-bottom:
        1px solid
        rgba(201,162,75,.25);

    box-shadow:
        0 10px 30px
        rgba(0,0,0,.25);
}


.logo{

    color:var(--paper);

    text-decoration:none;

    font-size:23px;

    font-weight:700;

    letter-spacing:.02em;

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

    font-family:
        'JetBrains Mono',
        monospace;

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
        rgba(239,233,220,.72);

    text-decoration:none;

    font-size:13px;

    font-weight:500;

    padding:9px 13px;

    border-radius:8px;

    transition:
        color .2s ease,
        background .2s ease,
        transform .2s ease;
}


.nav-links a:hover{

    color:var(--gold);

    background:
        rgba(201,162,75,.12);

    transform:
        translateY(-1px);
}


/* =====================================================
   MAIN CONTAINER
===================================================== */

.container{

    width:92%;

    max-width:1000px;

    margin:45px auto 70px;

    position:relative;

    z-index:2;
}


/* =====================================================
   PAGE HEADER
===================================================== */

.page-head{

    text-align:center;

    margin-bottom:35px;
}


.page-head .eyebrow{

    display:block;

    margin-bottom:8px;

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10.5px;

    letter-spacing:.18em;

    text-transform:uppercase;
}


.heading{

    color:var(--paper);

    font-size:35px;

    font-weight:700;

    line-height:1.2;

    margin-bottom:8px;
}


.page-description{

    color:
        rgba(239,233,220,.55);

    font-size:14px;
}


/* =====================================================
   ORDER CARD
===================================================== */

.order-card{

    position:relative;

    overflow:hidden;

    background:
        linear-gradient(
            135deg,
            rgba(15,42,46,.97),
            rgba(18,59,63,.96)
        );

    border:
        1px solid
        rgba(201,162,75,.20);

    border-radius:20px;

    padding:31px 34px 28px;

    margin-bottom:28px;

    color:var(--paper);

    box-shadow:

        0 25px 55px -22px
        rgba(0,0,0,.55),

        0 0 0 1px
        rgba(255,255,255,.015);

    transition:
        transform .28s ease,
        box-shadow .28s ease;
}


.order-card:hover{

    transform:
        translateY(-5px);

    box-shadow:

        0 35px 70px -25px
        rgba(0,0,0,.65),

        0 0 35px
        rgba(201,162,75,.06);
}


/* =====================================================
   CARD INNER BORDER
===================================================== */

.order-card::before{

    content:"";

    position:absolute;

    inset:10px;

    border:
        1px dashed
        rgba(201,162,75,.25);

    border-radius:13px;

    pointer-events:none;

    z-index:0;
}


/* =====================================================
   CARD DECORATIVE ORB
===================================================== */

.order-card::after{

    content:"";

    position:absolute;

    width:180px;

    height:180px;

    right:-90px;

    top:-90px;

    border-radius:50%;

    border:
        1px solid
        rgba(201,162,75,.16);

    box-shadow:

        0 0 0 25px
        rgba(201,162,75,.025),

        0 0 0 50px
        rgba(201,162,75,.015);

    pointer-events:none;

    animation:
        cardOrb 12s ease-in-out infinite;
}


@keyframes cardOrb{

    0%,
    100%{

        transform:
            rotate(0deg)
            translateY(0);
    }

    50%{

        transform:
            rotate(12deg)
            translateY(10px);
    }

}


/* =====================================================
   ORDER HEADER
===================================================== */

.order-header{

    position:relative;

    z-index:2;

    display:flex;

    justify-content:space-between;

    align-items:center;

    gap:20px;

    margin-bottom:20px;
}


.restaurant-label{

    display:block;

    margin-bottom:6px;

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9.5px;

    letter-spacing:.16em;

    text-transform:uppercase;
}


.restaurant{

    color:var(--paper);

    font-size:23px;

    font-weight:700;

    line-height:1.2;
}


/* =====================================================
   STATUS
===================================================== */

.status{

    width:72px;

    height:72px;

    flex-shrink:0;

    border-radius:50%;

    border:
        2px dashed
        var(--gold);

    display:flex;

    flex-direction:column;

    align-items:center;

    justify-content:center;

    transform:rotate(-8deg);

    background:
        rgba(201,162,75,.035);
}


.status span{

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:8.5px;

    font-weight:700;

    letter-spacing:.05em;
}


.status .check{

    font-size:17px;

    line-height:1;

    margin-bottom:3px;
}


/* =====================================================
   ORDER INFORMATION
===================================================== */

.order-info{

    position:relative;

    z-index:2;

    display:flex;

    flex-wrap:wrap;

    gap:22px;

    padding:15px 0;

    border-top:
        1px dashed
        rgba(239,233,220,.15);

    border-bottom:
        1px dashed
        rgba(239,233,220,.15);
}


.order-info p{

    color:
        rgba(239,233,220,.58);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:11.5px;
}


.order-info p b{

    display:block;

    margin-bottom:4px;

    color:
        rgba(239,233,220,.35);

    font-size:9px;

    letter-spacing:.1em;

    text-transform:uppercase;
}


/* =====================================================
   ITEM
===================================================== */

.item{

    position:relative;

    z-index:2;

    display:flex;

    align-items:center;

    gap:17px;

    padding:18px 0;

    border-bottom:
        1px dashed
        rgba(239,233,220,.12);
}


.item img{

    width:78px;

    height:78px;

    flex-shrink:0;

    object-fit:cover;

    border-radius:12px;

    border:
        1px solid
        rgba(201,162,75,.20);

    box-shadow:
        0 8px 20px
        rgba(0,0,0,.20);

    transition:
        transform .25s ease;
}


.item:hover img{

    transform:
        scale(1.04)
        rotate(-1deg);
}


.item-details{

    min-width:0;

    flex:1;
}


.item-details h3{

    color:var(--paper);

    font-size:16px;

    font-weight:600;

    margin-bottom:7px;

    line-height:1.3;
}


.item-details p{

    color:
        rgba(239,233,220,.50);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:11.5px;

    margin:3px 0;
}


/* =====================================================
   TOTAL
===================================================== */

.total{

    position:relative;

    z-index:2;

    display:flex;

    justify-content:space-between;

    align-items:center;

    gap:15px;

    margin-top:18px;

    padding-top:17px;

    border-top:
        2px solid
        rgba(201,162,75,.28);

    color:var(--gold);

    font-size:18px;

    font-weight:700;
}


.total .amt{

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:20px;
}


/* =====================================================
   DELETE BUTTON
===================================================== */

.delete-btn{

    position:relative;

    z-index:3;

    margin-top:19px;

    padding:10px 19px;

    border-radius:9px;

    border:
        1px solid
        rgba(228,87,46,.35);

    background:
        rgba(228,87,46,.06);

    color:var(--coral);

    cursor:pointer;

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:13px;

    font-weight:600;

    transition:
        background .2s ease,
        color .2s ease,
        transform .2s ease;
}


.delete-btn:hover{

    background:var(--coral);

    color:#fff;

    transform:
        translateY(-1px);
}


/* =====================================================
   NO ORDERS
===================================================== */

.no-orders{

    position:relative;

    overflow:hidden;

    text-align:center;

    padding:80px 25px;

    background:
        rgba(18,59,63,.75);

    border:
        1px solid
        rgba(201,162,75,.15);

    border-radius:20px;

    box-shadow:
        0 20px 45px
        rgba(0,0,0,.30);
}


.no-orders .seal{

    width:70px;

    height:70px;

    margin:0 auto 20px;

    border-radius:50%;

    display:flex;

    align-items:center;

    justify-content:center;

    border:
        2px dashed
        var(--gold);

    background:
        rgba(201,162,75,.07);

    font-size:25px;

    animation:
        gentleFloat 4s ease-in-out infinite;
}


@keyframes gentleFloat{

    0%,
    100%{

        transform:
            translateY(0);
    }

    50%{

        transform:
            translateY(-6px);
    }

}


.no-orders h2{

    color:var(--paper);

    font-size:25px;

    margin-bottom:9px;
}


.no-orders p{

    color:
        rgba(239,233,220,.55);

    font-size:14px;
}


/* =====================================================
   FOOTER
===================================================== */

footer{

    position:relative;

    z-index:2;

    width:92%;

    max-width:1000px;

    margin:0 auto 35px;

    padding:22px 10px;

    text-align:center;

    border-top:
        1px solid
        rgba(239,233,220,.12);

    color:
        rgba(239,233,220,.35);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.10em;
}


/* =====================================================
   TABLET
===================================================== */

@media(max-width:850px){

    .container{

        width:94%;
    }

    .order-card{

        padding:
            29px 27px 25px;
    }

}


/* =====================================================
   MOBILE
===================================================== */

@media(max-width:700px){

    .navbar{

        padding:
            14px 18px;

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

        padding:
            8px 9px;
    }


    .container{

        width:94%;

        margin-top:28px;
    }


    .page-head{

        margin-bottom:25px;
    }


    .heading{

        font-size:27px;
    }


    .page-description{

        font-size:13px;
    }


    .order-card{

        padding:
            25px 19px 22px;

        border-radius:17px;

        margin-bottom:21px;
    }


    .order-header{

        align-items:center;

        gap:13px;
    }


    .restaurant{

        font-size:19px;

        padding-right:5px;
    }


    .restaurant-label{

        font-size:8.5px;
    }


    .status{

        width:61px;

        height:61px;
    }


    .status .check{

        font-size:15px;
    }


    .status span{

        font-size:7.5px;
    }


    .order-info{

        gap:14px;

        padding:13px 0;
    }


    .order-info p{

        font-size:10px;
    }


    .item{

        gap:12px;

        padding:15px 0;
    }


    .item img{

        width:65px;

        height:65px;

        border-radius:10px;
    }


    .item-details h3{

        font-size:14px;
    }


    .item-details p{

        font-size:10px;
    }


    .total{

        font-size:16px;

        margin-top:16px;

        padding-top:15px;
    }


    .total .amt{

        font-size:17px;
    }


    .delete-btn{

        width:100%;

        padding:11px;
    }


    /* smaller background objects */

    .orb{

        width:150px;

        height:150px;

        right:-40px;

        top:20%;
    }


    .cube{

        width:90px;

        height:90px;

        left:-25px;

        bottom:15%;
    }


    .ring-one{

        width:190px;

        height:190px;

        left:-100px;
    }


    .ring-two{

        width:260px;

        height:260px;

        right:-150px;

        bottom:-80px;
    }

}


/* =====================================================
   SMALL PHONES
===================================================== */

@media(max-width:420px){

    .navbar{

        padding:
            13px 10px;
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

        display:grid;

        grid-template-columns:
            repeat(4,1fr);

        width:100%;
    }


    .nav-links a{

        text-align:center;

        font-size:10px;

        padding:
            8px 3px;
    }


    .container{

        width:95%;

        margin-top:22px;
    }


    .heading{

        font-size:24px;
    }


    .order-card{

        padding:
            23px 15px 20px;
    }


    .order-header{

        align-items:flex-start;
    }


    .restaurant{

        font-size:17px;
    }


    .status{

        width:56px;

        height:56px;
    }


    .order-info{

        display:grid;

        grid-template-columns:
            repeat(2,1fr);

        gap:12px;
    }


    .item img{

        width:58px;

        height:58px;
    }


    .item-details h3{

        font-size:13px;
    }


    .item-details p{

        font-size:9.5px;
    }


    .total{

        font-size:15px;
    }


    .total .amt{

        font-size:16px;
    }

}


/* =====================================================
   REDUCED MOTION
===================================================== */

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
     3D BACKGROUND
===================================================== -->

<div class="background-scene">

    <div class="orb"></div>

    <div class="cube"></div>

    <div class="ring ring-one"></div>

    <div class="ring ring-two"></div>

    <div class="particle p1"></div>

    <div class="particle p2"></div>

    <div class="particle p3"></div>

    <div class="particle p4"></div>

</div>



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
     MAIN
===================================================== -->

<div class="container">


    <div class="page-head">

        <span class="eyebrow">
            Travel Record
        </span>

        <h1 class="heading">
            My Orders
        </h1>

        <p class="page-description">
            Your ZestGo dining history
        </p>

    </div>



<%
if(orders == null || orders.isEmpty()){
%>


    <!-- =================================================
         NO ORDERS
    ================================================== -->

    <div class="no-orders">

        <div class="seal">
            📦
        </div>

        <h2>
            No Orders Found
        </h2>

        <p>
            Your completed orders will show up here.
        </p>

    </div>


<%
}
else
{
    for(Order order : orders)
    {
%>


    <!-- =================================================
         ORDER CARD
    ================================================== -->

    <div class="order-card">


        <div class="order-header">


            <div>

                <span class="restaurant-label">
                    Delivered From
                </span>


                <div class="restaurant">

                    <%= order.getRestaurantName() %>

                </div>

            </div>



            <div class="status">

                <span class="check">
                    ✓
                </span>

                <span>
                    LANDED
                </span>

            </div>


        </div>



        <!-- ORDER INFORMATION -->

        <div class="order-info">


            <p>

                <b>
                    Order ID
                </b>

                <%= order.getOrderId() %>

            </p>



            <p>

                <b>
                    Payment
                </b>

                <%= order.getPaymentMethod() %>

            </p>



            <p>

                <b>
                    Date
                </b>

                <%= order.getOrderDate() %>

            </p>


        </div>



<%

    List<OrderItem> items =
        dao.getOrderItems(order.getOrderId());

    for(OrderItem item : items)
    {

%>


        <!-- =================================================
             ORDER ITEM
        ================================================== -->

        <div class="item">


            <img
                src="<%= item.getImagePath() %>"
                alt="<%= item.getItemName() %>">



            <div class="item-details">


                <h3>

                    <%= item.getItemName() %>

                </h3>


                <p>

                    Quantity :
                    <%= item.getQuantity() %>

                </p>


                <p>

                    Price :
                    ₹<%= item.getPrice() %>

                </p>


            </div>


        </div>


<%

    }

%>


        <!-- =================================================
             TOTAL
        ================================================== -->

        <div class="total">

            <div>
                Total Amount
            </div>

            <div class="amt">

                ₹<%= order.getTotalAmount() %>

            </div>

        </div>



        <!-- =================================================
             DELETE ORDER
        ================================================== -->

        <form action="deleteOrder"
              method="post">

            <input
                type="hidden"
                name="orderId"
                value="<%= order.getOrderId() %>">


            <button
                type="submit"
                class="delete-btn">

                Delete Order

            </button>

        </form>


    </div>


<%
    }
}
%>


</div>



<!-- =====================================================
     FOOTER
===================================================== -->

<footer>

    © 2026 ZESTGO · YOUR FOOD JOURNEY

</footer>


</body>

</html>