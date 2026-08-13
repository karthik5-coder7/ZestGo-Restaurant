<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.Food.Model.Cart,com.Food.Model.CartItem" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo | My Cart</title>


<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap"
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

html,
body{
    width:100%;
    min-height:100%;
}

body{

    font-family:'DM Sans',sans-serif;

    background:#071416;

    color:#F5EFE3;

    overflow-x:hidden;

}


/* =====================================================
   COLORS
===================================================== */

:root{

    --ink:#071416;

    --ink-light:#0F2A2E;

    --teal:#123B3F;

    --teal-light:#1A4B50;

    --gold:#C9A24B;

    --gold-light:#E0BD67;

    --coral:#E4572E;

    --paper:#F5EFE3;

    --muted:rgba(245,239,227,.45);

    --line:rgba(255,255,255,.09);

}


/* =====================================================
   3D BACKGROUND
===================================================== */

.background-3d{

    position:fixed;

    inset:0;

    overflow:hidden;

    pointer-events:none;

    z-index:0;

    perspective:1200px;

    background:
        radial-gradient(
            circle at 50% 45%,
            rgba(18,59,63,.35),
            transparent 60%
        );

}


/* =====================================================
   ORBS
===================================================== */

.orb{

    position:absolute;

    border-radius:50%;

    transform-style:preserve-3d;

    opacity:.45;

}


/* GOLD */

.orb-1{

    width:180px;
    height:180px;

    left:5%;
    top:18%;

    background:
        radial-gradient(
            circle at 30% 25%,
            rgba(255,225,140,.8),
            rgba(201,162,75,.16) 35%,
            transparent 70%
        );

    box-shadow:
        0 0 80px
        rgba(201,162,75,.12);

    animation:
        orbOne 14s ease-in-out infinite;

}


/* TEAL */

.orb-2{

    width:260px;
    height:260px;

    right:3%;
    top:15%;

    background:
        radial-gradient(
            circle at 35% 30%,
            rgba(80,180,175,.35),
            rgba(18,59,63,.08) 45%,
            transparent 72%
        );

    animation:
        orbTwo 17s ease-in-out infinite;

}


/* CORAL */

.orb-3{

    width:140px;
    height:140px;

    right:25%;
    bottom:5%;

    background:
        radial-gradient(
            circle at 35% 30%,
            rgba(228,87,46,.35),
            rgba(228,87,46,.04) 50%,
            transparent 75%
        );

    animation:
        orbThree 12s ease-in-out infinite;

}


/* =====================================================
   ORB ANIMATION
===================================================== */

@keyframes orbOne{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            scale(1);

    }

    50%{

        transform:
            translate3d(80px,-50px,100px)
            rotateY(70deg)
            scale(1.08);

    }

}


@keyframes orbTwo{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            rotateX(0deg);

    }

    50%{

        transform:
            translate3d(-90px,60px,120px)
            rotateX(70deg)
            rotateY(100deg);

    }

}


@keyframes orbThree{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            scale(1);

    }

    50%{

        transform:
            translate3d(-80px,-80px,100px)
            scale(1.25);

    }

}


/* =====================================================
   3D RINGS
===================================================== */

.ring{

    position:absolute;

    border-radius:50%;

    border:
        1px solid
        rgba(201,162,75,.18);

    transform-style:preserve-3d;

}


.ring-1{

    width:380px;
    height:380px;

    left:-120px;
    bottom:-130px;

    animation:
        ringOne 18s linear infinite;

}


.ring-2{

    width:280px;
    height:280px;

    right:-90px;
    top:30%;

    border-color:
        rgba(80,180,175,.14);

    animation:
        ringTwo 15s linear infinite;

}


.ring-3{

    width:180px;
    height:180px;

    left:50%;
    top:8%;

    border-color:
        rgba(228,87,46,.12);

    animation:
        ringThree 12s linear infinite;

}


@keyframes ringOne{

    from{

        transform:
            rotateX(65deg)
            rotateZ(0deg);

    }

    to{

        transform:
            rotateX(65deg)
            rotateZ(360deg)
            translateZ(100px);

    }

}


@keyframes ringTwo{

    from{

        transform:
            rotateY(65deg)
            rotateZ(0deg);

    }

    to{

        transform:
            rotateY(65deg)
            rotateZ(-360deg);

    }

}


@keyframes ringThree{

    from{

        transform:
            rotateX(70deg)
            rotateY(15deg)
            rotateZ(0deg);

    }

    to{

        transform:
            rotateX(70deg)
            rotateY(15deg)
            rotateZ(360deg);

    }

}


/* =====================================================
   PARTICLES
===================================================== */

.particle{

    position:absolute;

    width:4px;

    height:4px;

    border-radius:50%;

    background:var(--gold);

    box-shadow:
        0 0 12px
        rgba(201,162,75,.8);

    opacity:.5;

}


.particle-1{
    left:12%;
    top:70%;
    animation:particleFloat 8s ease-in-out infinite;
}

.particle-2{
    left:25%;
    top:25%;
    animation:particleFloat 10s ease-in-out infinite 1s;
}

.particle-3{
    left:45%;
    top:75%;
    animation:particleFloat 9s ease-in-out infinite 2s;
}

.particle-4{
    left:65%;
    top:20%;
    animation:particleFloat 11s ease-in-out infinite 1.5s;
}

.particle-5{
    left:80%;
    top:65%;
    animation:particleFloat 8s ease-in-out infinite 3s;
}

.particle-6{
    left:90%;
    top:35%;
    animation:particleFloat 12s ease-in-out infinite 2s;
}


@keyframes particleFloat{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            scale(1);

        opacity:.2;

    }

    50%{

        transform:
            translate3d(30px,-70px,100px)
            scale(1.7);

        opacity:.75;

    }

}


/* =====================================================
   NAVBAR
===================================================== */

.navbar{

    width:100%;

    padding:16px 5%;

    display:flex;

    justify-content:space-between;

    align-items:center;

    position:relative;

    z-index:20;

    background:
        rgba(7,20,22,.78);

    border-bottom:
        1px solid
        rgba(255,255,255,.07);

    backdrop-filter:
        blur(18px);

}


/* LOGO */

.logo{

    display:flex;

    align-items:center;

    gap:10px;

    color:var(--paper);

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:20px;

    font-weight:700;

    text-decoration:none;

}


.mark{

    width:38px;

    height:38px;

    display:flex;

    align-items:center;

    justify-content:center;

    border-radius:11px;

    background:
        linear-gradient(
            135deg,
            #E2C473,
            #A97B2B
        );

    color:var(--ink);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:12px;

    font-weight:700;

    box-shadow:
        0 10px 30px
        rgba(201,162,75,.20);

}


/* NAV LINKS */

.nav-links{

    display:flex;

    gap:6px;

}


.nav-links a{

    text-decoration:none;

    color:
        rgba(245,239,227,.65);

    font-size:13px;

    font-weight:500;

    padding:
        9px 13px;

    border-radius:9px;

    transition:.25s ease;

}


.nav-links a:hover{

    color:var(--gold);

    background:
        rgba(201,162,75,.10);

}


/* =====================================================
   MAIN CONTAINER
===================================================== */

.container{

    width:92%;

    max-width:760px;

    margin:0 auto;

    padding:
        52px 0 80px;

    position:relative;

    z-index:5;

}


/* =====================================================
   PAGE HEADER
===================================================== */

.page-head{

    text-align:center;

    margin-bottom:42px;

}


.eyebrow{

    display:block;

    margin-bottom:9px;

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.20em;

    text-transform:uppercase;

}


.page-head h1{

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:
        clamp(32px,5vw,44px);

    font-weight:700;

    letter-spacing:-.045em;

}


.page-head h1::after{

    content:"";

    display:block;

    width:45px;

    height:3px;

    margin:14px auto 0;

    border-radius:5px;

    background:
        linear-gradient(
            90deg,
            var(--coral),
            var(--gold)
        );

}


/* =====================================================
   RECEIPT / CART CARD
===================================================== */

.receipt{

    position:relative;

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,.075),
            rgba(255,255,255,.025)
        );

    border:
        1px solid
        rgba(255,255,255,.09);

    border-radius:24px;

    box-shadow:

        0 30px 90px
        rgba(0,0,0,.38),

        inset 0 1px 0
        rgba(255,255,255,.06);

    backdrop-filter:
        blur(18px);

    overflow:hidden;

    transform-style:
        preserve-3d;

    animation:
        receiptFloat
        7s ease-in-out infinite;

}


@keyframes receiptFloat{

    0%,
    100%{

        transform:
            translateY(0);

    }

    50%{

        transform:
            translateY(-4px);

    }

}


/* =====================================================
   RECEIPT INNER
===================================================== */

.receipt-inner{

    padding:
        30px 32px 18px;

}


/* =====================================================
   RECEIPT TITLE
===================================================== */

.receipt-title{

    text-align:center;

    color:
        rgba(245,239,227,.38);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.17em;

    text-transform:uppercase;

    padding-bottom:19px;

    border-bottom:
        1px dashed
        rgba(255,255,255,.12);

}


/* =====================================================
   CART HEADER
===================================================== */

.cart-header{

    display:grid;

    grid-template-columns:
        2.6fr
        .9fr
        .9fr
        1.3fr
        .9fr;

    padding:
        15px 0 10px;

    color:
        rgba(245,239,227,.35);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9px;

    letter-spacing:.06em;

    text-transform:uppercase;

}


/* =====================================================
   CART ROW
===================================================== */

.cart-row{

    display:grid;

    grid-template-columns:
        2.6fr
        .9fr
        .9fr
        1.3fr
        .9fr;

    align-items:center;

    padding:
        17px 0;

    border-top:
        1px dashed
        rgba(255,255,255,.10);

    font-size:14px;

    transition:.25s ease;

}


.cart-row:hover{

    background:
        rgba(201,162,75,.035);

    transform:
        translateX(3px);

}


/* ITEM */

.item-name{

    color:var(--paper);

    font-weight:600;

}


/* PRICE */

.price{

    color:
        rgba(245,239,227,.80);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:12px;

    font-weight:600;

}


/* =====================================================
   QUANTITY
===================================================== */

.qty{

    display:flex;

    justify-content:center;

    align-items:center;

    gap:8px;

}


.qty form{

    margin:0;

}


.qty-btn{

    width:29px;

    height:29px;

    border:
        1px solid
        rgba(255,255,255,.12);

    border-radius:8px;

    background:
        rgba(255,255,255,.045);

    color:var(--gold);

    font-size:14px;

    font-weight:700;

    cursor:pointer;

    transition:.2s ease;

}


.qty-btn:hover{

    border-color:
        var(--gold);

    background:
        rgba(201,162,75,.10);

    transform:
        translateY(-2px);

}


.qty span{

    min-width:18px;

    text-align:center;

    color:var(--paper);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:12px;

}


/* =====================================================
   REMOVE BUTTON
===================================================== */

.remove-btn{

    padding:
        7px 10px;

    border-radius:7px;

    border:
        1px solid
        rgba(228,87,46,.25);

    background:
        rgba(228,87,46,.055);

    color:var(--coral);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    font-weight:600;

    cursor:pointer;

    transition:.2s ease;

}


.remove-btn:hover{

    background:
        var(--coral);

    color:#fff;

    border-color:
        var(--coral);

}


/* =====================================================
   TOTAL
===================================================== */

.total{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:
        21px 0 9px;

    margin-top:7px;

    border-top:
        2px solid
        rgba(245,239,227,.75);

    color:var(--paper);

    font-size:18px;

    font-weight:700;

}


.total .amount{

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:20px;

}


/* =====================================================
   RECEIPT FOOTER
===================================================== */

.receipt-footer{

    padding:
        17px 0 23px;

    display:flex;

    align-items:center;

    justify-content:space-between;

}


.bars{

    display:flex;

    gap:2px;

    align-items:flex-end;

    height:20px;

}


.bars span{

    display:block;

    width:2px;

    background:
        var(--gold);

    opacity:.55;

}


.order-note{

    color:
        rgba(245,239,227,.30);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9px;

    letter-spacing:.06em;

}


/* =====================================================
   BOTTOM BUTTONS
===================================================== */

.bottom-buttons{

    display:flex;

    gap:13px;

    margin-top:28px;

}


/* COMMON */

.btn{

    flex:1;

    display:block;

    padding:15px;

    border-radius:12px;

    text-align:center;

    text-decoration:none;

    font-size:13.5px;

    font-weight:700;

    transition:.25s ease;

}


/* ADD MORE */

.add-btn{

    color:
        rgba(245,239,227,.78);

    background:
        rgba(255,255,255,.045);

    border:
        1px solid
        rgba(255,255,255,.10);

}


.add-btn:hover{

    color:var(--gold);

    border-color:
        rgba(201,162,75,.35);

    background:
        rgba(201,162,75,.07);

    transform:
        translateY(-3px);

}


/* CHECKOUT */

.checkout-btn{

    color:var(--ink);

    background:
        linear-gradient(
            135deg,
            var(--gold-light),
            #A97B2B
        );

    border:
        1px solid
        rgba(201,162,75,.25);

    box-shadow:
        0 12px 30px
        rgba(201,162,75,.10);

}


.checkout-btn:hover{

    transform:
        translateY(-3px);

    box-shadow:
        0 18px 35px
        rgba(201,162,75,.20);

}


/* =====================================================
   EMPTY CART
===================================================== */

.empty-state{

    text-align:center;

    padding:
        65px 25px 55px;

}


.empty-icon{

    width:72px;

    height:72px;

    margin:
        0 auto 20px;

    display:flex;

    align-items:center;

    justify-content:center;

    border-radius:22px;

    background:
        rgba(201,162,75,.07);

    border:
        1px solid
        rgba(201,162,75,.18);

    font-size:30px;

    animation:
        emptyFloat
        4s ease-in-out infinite;

}


@keyframes emptyFloat{

    0%,
    100%{

        transform:
            translateY(0);

    }

    50%{

        transform:
            translateY(-7px);

    }

}


.empty-state h1{

    color:var(--paper);

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:25px;

    margin-bottom:9px;

}


.empty-state p{

    color:
        rgba(245,239,227,.42);

    font-size:13px;

    line-height:1.7;

    margin-bottom:25px;

}


/* =====================================================
   MOBILE
===================================================== */

@media(max-width:700px){

    .navbar{

        padding:
            14px 18px;

    }


    .nav-links{

        display:none;

    }


    .logo{

        font-size:18px;

    }


    .mark{

        width:36px;

        height:36px;

    }


    .container{

        width:
            calc(100% - 24px);

        padding:
            36px 0 55px;

    }


    .page-head{

        margin-bottom:32px;

    }


    .page-head h1{

        font-size:31px;

    }


    .receipt{

        border-radius:20px;

    }


    .receipt-inner{

        padding:
            24px 18px 15px;

    }


    /* Hide desktop column headings */

    .cart-header{

        display:none;

    }


    /* Mobile item */

    .cart-row{

        grid-template-columns:
            1fr;

        gap:11px;

        padding:
            20px 0;

        text-align:left;

    }


    .cart-row:hover{

        transform:none;

    }


    .item-name{

        font-size:16px;

    }


    .price{

        font-size:12px;

    }


    .qty{

        justify-content:flex-start;

    }


    .remove-btn{

        width:max-content;

    }


    .total{

        margin-top:10px;

        font-size:17px;

    }


    .total .amount{

        font-size:18px;

    }


    .receipt-footer{

        padding-bottom:10px;

    }


    .bottom-buttons{

        flex-direction:column;

        gap:10px;

        margin-top:20px;

    }


    .btn{

        width:100%;

    }


    /* Mobile 3D background */

    .orb-1{

        width:120px;
        height:120px;

        left:-35px;

    }


    .orb-2{

        width:170px;
        height:170px;

        right:-65px;

    }


    .orb-3{

        width:100px;
        height:100px;

    }


    .ring-1{

        width:250px;
        height:250px;

    }


    .ring-2{

        width:190px;
        height:190px;

    }


    .ring-3{

        width:130px;
        height:130px;

    }


    .particle{

        width:3px;
        height:3px;

    }

}


/* =====================================================
   SMALL PHONES
===================================================== */

@media(max-width:420px){

    .container{

        width:
            calc(100% - 18px);

    }


    .receipt-inner{

        padding:
            21px 14px 12px;

    }


    .page-head h1{

        font-size:28px;

    }


    .receipt-title{

        font-size:9px;

    }


    .item-name{

        font-size:15px;

    }


    .total{

        font-size:16px;

    }

}


/* =====================================================
   REDUCE MOTION
===================================================== */

@media(prefers-reduced-motion:reduce){

    .background-3d *,
    .receipt,
    .empty-icon{

        animation:none !important;

    }

}

</style>

</head>


<body>


<!-- =====================================================
     3D BACKGROUND
===================================================== -->

<div class="background-3d">

    <div class="orb orb-1"></div>

    <div class="orb orb-2"></div>

    <div class="orb orb-3"></div>

    <div class="ring ring-1"></div>

    <div class="ring ring-2"></div>

    <div class="ring ring-3"></div>

    <div class="particle particle-1"></div>

    <div class="particle particle-2"></div>

    <div class="particle particle-3"></div>

    <div class="particle particle-4"></div>

    <div class="particle particle-5"></div>

    <div class="particle particle-6"></div>

</div>



<!-- =====================================================
     NAVBAR
===================================================== -->

<nav class="navbar">

    <a href="callRestaurantServlet"
       class="logo">

        <div class="mark">
            ZG
        </div>

        ZestGo

    </a>


    <div class="nav-links">

        <a href="callRestaurantServlet">
            Home
        </a>

        <a href="orderHistory">
            My Orders
        </a>

        <a href="favorites">
            Favorites
        </a>

        <a href="cart.jsp">
            Cart
        </a>

    </div>

</nav>



<!-- =====================================================
     MAIN
===================================================== -->

<div class="container">


    <!-- PAGE HEADER -->

    <div class="page-head">

        <span class="eyebrow">
            Order Slip
        </span>

        <h1>
            Your Cart
        </h1>

    </div>



<%

Cart cart =
        (Cart) session.getAttribute("cart");

double grandTotal = 0;

Integer restaurantId =
        (Integer) session.getAttribute("restaurantId");

%>



<% if(cart != null && !cart.getItems().isEmpty()) { %>


    <!-- =================================================
         CART RECEIPT
    ================================================== -->

    <div class="receipt">

        <div class="receipt-inner">


            <div class="receipt-title">

                ZestGo · Itemized Order

            </div>



            <!-- DESKTOP HEADER -->

            <div class="cart-header">

                <div>Item</div>

                <div>Price</div>

                <div>Total</div>

                <div>Quantity</div>

                <div>Action</div>

            </div>



<%

for(CartItem item : cart.getItems().values()){

    grandTotal += item.getTotalPrice();

    int decreaseQty =
            item.getQuantity() - 1;

%>


            <!-- CART ROW -->

            <div class="cart-row">


                <!-- ITEM -->

                <div class="item-name">

                    <%= item.getName() %>

                </div>


                <!-- PRICE -->

                <div class="price">

                    ₹<%= item.getPrice() %>

                </div>


                <!-- TOTAL -->

                <div class="price">

                    ₹<%= item.getTotalPrice() %>

                </div>


                <!-- QUANTITY -->

                <div class="qty">


                    <!-- MINUS -->

                    <form action="cartServlet"
                          method="post">


                        <input
                            type="hidden"
                            name="menuId"
                            value="<%= item.getMenuId() %>">


                        <input
                            type="hidden"
                            name="restaurantId"
                            value="<%= restaurantId %>">


<%

if(decreaseQty <= 0){

%>

                        <input
                            type="hidden"
                            name="action"
                            value="delete">

<%

}else{

%>

                        <input
                            type="hidden"
                            name="action"
                            value="update">


                        <input
                            type="hidden"
                            name="quantity"
                            value="<%= Math.max(1,
                                    item.getQuantity() - 1) %>">

<%

}

%>


                        <button
                            class="qty-btn"
                            type="submit">

                            −

                        </button>


                    </form>



                    <!-- NUMBER -->

                    <span>

                        <%= item.getQuantity() %>

                    </span>



                    <!-- PLUS -->

                    <form action="cartServlet"
                          method="post">


                        <input
                            type="hidden"
                            name="menuId"
                            value="<%= item.getMenuId() %>">


                        <input
                            type="hidden"
                            name="restaurantId"
                            value="<%= restaurantId %>">


                        <input
                            type="hidden"
                            name="action"
                            value="update">


                        <input
                            type="hidden"
                            name="quantity"
                            value="<%= item.getQuantity() + 1 %>">


                        <button
                            class="qty-btn"
                            type="submit">

                            +

                        </button>


                    </form>


                </div>



                <!-- REMOVE -->

                <div>

                    <form action="cartServlet"
                          method="post">


                        <input
                            type="hidden"
                            name="menuId"
                            value="<%= item.getMenuId() %>">


                        <input
                            type="hidden"
                            name="restaurantId"
                            value="<%= restaurantId %>">


                        <input
                            type="hidden"
                            name="action"
                            value="delete">


                        <button
                            class="remove-btn"
                            type="submit">

                            Remove

                        </button>


                    </form>

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
                    Grand Total
                </div>

                <div class="amount">

                    ₹<%= grandTotal %>

                </div>

            </div>



            <!-- =================================================
                 FOOTER
            ================================================== -->

            <div class="receipt-footer">

                <div
                    class="bars"
                    id="bars">
                </div>

                <div class="order-note">

                    THANK YOU FOR ORDERING

                </div>

            </div>


        </div>

    </div>



    <!-- =================================================
         BOTTOM BUTTONS
    ================================================== -->

    <div class="bottom-buttons">


        <a
            href="menu?restaurantId=<%= restaurantId %>&Name=<%= session.getAttribute("Name") %>&CuisineType=<%= session.getAttribute("CuisineType") %>&Rating=<%= session.getAttribute("Rating") %>"
            class="btn add-btn">

            + Add More Items

        </a>


        <a
            href="checkout.jsp"
            class="btn checkout-btn">

            Proceed To Checkout →

        </a>


    </div>



<% } else { %>



    <!-- =================================================
         EMPTY CART
    ================================================== -->

    <div class="receipt">

        <div class="receipt-inner">

            <div class="empty-state">


                <div class="empty-icon">

                    🛒

                </div>


                <h1>

                    Your Cart Is Empty

                </h1>


                <p>

                    Please add some delicious food
                    items from the menu.

                </p>


                <a
                    href="callRestaurantServlet"
                    class="btn checkout-btn">

                    Browse Restaurants

                </a>


            </div>

        </div>

    </div>


<% } %>


</div>



<!-- =====================================================
     BARCODE
===================================================== -->

<script>

var bars =
    document.getElementById('bars');

if(bars){

    for(var i = 0; i < 32; i++){

        var b =
            document.createElement('span');

        var h =
            8 + Math.random() * 14;

        b.style.height =
            h + 'px';

        bars.appendChild(b);

    }

}

</script>


</body>

</html>