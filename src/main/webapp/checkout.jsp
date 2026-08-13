<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.Food.Model.Cart,com.Food.Model.CartItem" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo | Checkout</title>

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

    min-height:100vh;

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
            transparent 62%
        );

}


/* =====================================================
   FLOATING ORBS
===================================================== */

.orb{

    position:absolute;

    border-radius:50%;

    transform-style:preserve-3d;

    pointer-events:none;

}


/* GOLD */

.orb-1{

    width:190px;

    height:190px;

    left:-40px;

    top:15%;

    background:
        radial-gradient(
            circle at 30% 25%,
            rgba(255,225,140,.75),
            rgba(201,162,75,.13) 38%,
            transparent 72%
        );

    box-shadow:
        0 0 90px
        rgba(201,162,75,.12);

    opacity:.55;

    animation:
        floatGold
        14s ease-in-out infinite;

}


/* TEAL */

.orb-2{

    width:270px;

    height:270px;

    right:-90px;

    top:10%;

    background:
        radial-gradient(
            circle at 35% 30%,
            rgba(70,180,175,.35),
            rgba(18,59,63,.08) 45%,
            transparent 75%
        );

    opacity:.55;

    animation:
        floatTeal
        17s ease-in-out infinite;

}


/* CORAL */

.orb-3{

    width:150px;

    height:150px;

    right:22%;

    bottom:-45px;

    background:
        radial-gradient(
            circle at 35% 30%,
            rgba(228,87,46,.35),
            rgba(228,87,46,.04) 50%,
            transparent 75%
        );

    opacity:.5;

    animation:
        floatCoral
        12s ease-in-out infinite;

}


@keyframes floatGold{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            scale(1);

    }

    50%{

        transform:
            translate3d(80px,-45px,100px)
            rotateY(70deg)
            scale(1.08);

    }

}


@keyframes floatTeal{

    0%,
    100%{

        transform:
            translate3d(0,0,0);

    }

    50%{

        transform:
            translate3d(-90px,65px,120px)
            rotateX(70deg)
            rotateY(100deg);

    }

}


@keyframes floatCoral{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            scale(1);

    }

    50%{

        transform:
            translate3d(-70px,-70px,100px)
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
        rgba(201,162,75,.16);

    transform-style:preserve-3d;

}


.ring-1{

    width:420px;

    height:420px;

    left:-170px;

    bottom:-200px;

    animation:
        rotateRing1
        18s linear infinite;

}


.ring-2{

    width:310px;

    height:310px;

    right:-120px;

    top:30%;

    border-color:
        rgba(70,180,175,.14);

    animation:
        rotateRing2
        15s linear infinite;

}


.ring-3{

    width:190px;

    height:190px;

    left:50%;

    top:3%;

    border-color:
        rgba(228,87,46,.10);

    animation:
        rotateRing3
        13s linear infinite;

}


@keyframes rotateRing1{

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


@keyframes rotateRing2{

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


@keyframes rotateRing3{

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

    opacity:.45;

}


.particle-1{
    left:10%;
    top:70%;
    animation:particleMove 8s ease-in-out infinite;
}

.particle-2{
    left:25%;
    top:25%;
    animation:particleMove 10s ease-in-out infinite 1s;
}

.particle-3{
    left:45%;
    top:75%;
    animation:particleMove 9s ease-in-out infinite 2s;
}

.particle-4{
    left:65%;
    top:20%;
    animation:particleMove 11s ease-in-out infinite 1.5s;
}

.particle-5{
    left:80%;
    top:65%;
    animation:particleMove 8s ease-in-out infinite 3s;
}

.particle-6{
    left:90%;
    top:35%;
    animation:particleMove 12s ease-in-out infinite 2s;
}


@keyframes particleMove{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            scale(1);

        opacity:.18;

    }

    50%{

        transform:
            translate3d(30px,-70px,100px)
            scale(1.7);

        opacity:.7;

    }

}


/* =====================================================
   NAVBAR
===================================================== */

.navbar{

    width:100%;

    padding:
        15px 5%;

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


.logo-mark{

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

}


.nav-links{

    display:flex;

    gap:6px;

}


.nav-links a{

    text-decoration:none;

    color:
        rgba(245,239,227,.65);

    font-size:13px;

    padding:
        9px 13px;

    border-radius:9px;

    transition:.25s;

}


.nav-links a:hover{

    color:var(--gold);

    background:
        rgba(201,162,75,.10);

}


/* =====================================================
   PAGE
===================================================== */

.page{

    position:relative;

    z-index:5;

    width:92%;

    max-width:1050px;

    margin:0 auto;

    padding:
        45px 0 70px;

}


/* =====================================================
   PAGE HEADER
===================================================== */

.page-head{

    margin-bottom:30px;

}


.eyebrow{

    display:block;

    margin-bottom:8px;

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.20em;

    text-transform:uppercase;

}


h1{

    color:var(--paper);

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:
        clamp(32px,5vw,44px);

    font-weight:700;

    letter-spacing:-.045em;

    margin-bottom:8px;

}


.subtitle{

    display:inline-block;

    color:
        rgba(245,239,227,.42);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.08em;

    text-transform:uppercase;

}


/* =====================================================
   CHECKOUT BOARD
===================================================== */

.pass{

    width:100%;

    display:flex;

    position:relative;

    overflow:hidden;

    border-radius:24px;

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,.075),
            rgba(255,255,255,.025)
        );

    border:
        1px solid
        rgba(255,255,255,.09);

    box-shadow:

        0 35px 100px
        rgba(0,0,0,.42),

        inset 0 1px 0
        rgba(255,255,255,.06);

    backdrop-filter:
        blur(20px);

    transform-style:
        preserve-3d;

    animation:
        passFloat
        7s ease-in-out infinite;

}


@keyframes passFloat{

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
   PERFORATION
===================================================== */

.pass::before{

    content:"";

    position:absolute;

    top:0;

    bottom:0;

    left:66%;

    border-left:
        2px dashed
        rgba(245,239,227,.13);

    z-index:4;

}


/* =====================================================
   MAIN STUB
===================================================== */

.stub-main{

    width:66%;

    padding:
        38px 40px;

    color:var(--paper);

}


.boarding-label{

    display:inline-flex;

    align-items:center;

    padding:
        7px 10px;

    border-radius:7px;

    background:
        rgba(201,162,75,.07);

    border:
        1px solid
        rgba(201,162,75,.16);

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.15em;

    text-transform:uppercase;

    margin-bottom:25px;

}


/* =====================================================
   FORM FIELDS
===================================================== */

.field-label{

    display:block;

    margin:
        18px 0 8px;

    color:
        rgba(245,239,227,.52);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9.5px;

    letter-spacing:.08em;

    text-transform:uppercase;

}


.field-label:first-of-type{

    margin-top:0;

}


input,
textarea,
select{

    width:100%;

    padding:
        14px 15px;

    border:
        1px solid
        rgba(255,255,255,.10);

    border-radius:11px;

    background:
        rgba(255,255,255,.045);

    color:var(--paper);

    font-family:
        'DM Sans',
        sans-serif;

    font-size:14px;

    outline:none;

    transition:.25s ease;

}


input::placeholder,
textarea::placeholder{

    color:
        rgba(245,239,227,.25);

}


input:focus,
textarea:focus,
select:focus{

    border-color:
        rgba(201,162,75,.75);

    background:
        rgba(201,162,75,.06);

    box-shadow:
        0 0 0 3px
        rgba(201,162,75,.06);

}


textarea{

    height:100px;

    resize:none;

}


select{

    cursor:pointer;

}


select option{

    background:
        var(--ink);

    color:
        var(--paper);

}


/* =====================================================
   SIDE SUMMARY
===================================================== */

.stub-side{

    width:34%;

    padding:
        38px 30px;

    background:
        linear-gradient(
            145deg,
            rgba(18,59,63,.92),
            rgba(8,30,32,.96)
        );

    color:var(--paper);

    display:flex;

    flex-direction:column;

}


.stub-side h2{

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:17px;

    font-weight:700;

    color:var(--paper);

    margin-bottom:18px;

}


/* =====================================================
   ORDER ITEMS
===================================================== */

.order-item{

    display:grid;

    grid-template-columns:
        1fr auto auto;

    gap:9px;

    align-items:center;

    padding:
        11px 0;

    border-bottom:
        1px dashed
        rgba(245,239,227,.12);

    font-size:12px;

}


.order-item .name{

    min-width:0;

    color:
        rgba(245,239,227,.82);

    overflow:hidden;

    text-overflow:ellipsis;

    white-space:nowrap;

}


.order-item .qty{

    color:
        rgba(245,239,227,.38);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

}


.order-item .amt{

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    white-space:nowrap;

}


/* =====================================================
   TOTAL BOX
===================================================== */

.total-box{

    margin-top:auto;

    padding-top:22px;

}


.total-row{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:10px;

    color:
        rgba(245,239,227,.55);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

}


.final-total{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-top:16px;

    padding-top:16px;

    border-top:
        1px solid
        rgba(245,239,227,.16);

    color:var(--gold);

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:23px;

    font-weight:700;

}


/* =====================================================
   PLACE ORDER
===================================================== */

.place-btn{

    width:100%;

    margin-top:23px;

    padding:15px;

    border:none;

    border-radius:11px;

    color:var(--ink);

    background:
        linear-gradient(
            135deg,
            var(--gold-light),
            #A97B2B
        );

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:14px;

    font-weight:700;

    cursor:pointer;

    transition:.25s ease;

    box-shadow:
        0 12px 30px
        rgba(201,162,75,.10);

}


.place-btn:hover{

    transform:
        translateY(-3px);

    box-shadow:
        0 18px 35px
        rgba(201,162,75,.22);

}


/* =====================================================
   BACK BUTTON
===================================================== */

.back-btn{

    width:100%;

    margin-top:10px;

    padding:13px;

    border-radius:10px;

    background:
        rgba(255,255,255,.035);

    border:
        1px solid
        rgba(255,255,255,.10);

    color:
        rgba(245,239,227,.60);

    font-family:
        'DM Sans',
        sans-serif;

    font-size:12px;

    cursor:pointer;

    transition:.25s;

}


.back-btn:hover{

    border-color:
        rgba(201,162,75,.45);

    color:var(--gold);

    background:
        rgba(201,162,75,.06);

}


/* =====================================================
   MOBILE
===================================================== */

@media(max-width:820px){

    .navbar{

        padding:
            14px 18px;

    }


    .nav-links{

        display:none;

    }


    .page{

        width:
            calc(100% - 22px);

        padding:
            32px 0 50px;

    }


    .page-head{

        text-align:center;

        margin-bottom:25px;

    }


    h1{

        font-size:31px;

    }


    .pass{

        flex-direction:column;

        border-radius:20px;

    }


    .pass::before{

        display:none;

    }


    .stub-main,
    .stub-side{

        width:100%;

    }


    .stub-main{

        padding:
            27px 20px 30px;

    }


    .stub-side{

        padding:
            27px 20px 25px;

        border-top:
            1px dashed
            rgba(245,239,227,.15);

    }


    .boarding-label{

        margin-bottom:20px;

    }


    textarea{

        height:90px;

    }


    .stub-side h2{

        font-size:16px;

    }


    .final-total{

        font-size:21px;

    }

}


/* =====================================================
   SMALL PHONES
===================================================== */

@media(max-width:400px){

    .page{

        width:
            calc(100% - 14px);

    }


    .stub-main{

        padding:
            23px 16px 26px;

    }


    .stub-side{

        padding:
            23px 16px 22px;

    }


    h1{

        font-size:28px;

    }


    .subtitle{

        font-size:8px;

    }


    input,
    textarea,
    select{

        font-size:13px;

        padding:
            13px;

    }


    .order-item{

        font-size:11px;

    }


    .final-total{

        font-size:20px;

    }

}


/* =====================================================
   REDUCED MOTION
===================================================== */

@media(prefers-reduced-motion:reduce){

    .background-3d *,
    .pass{

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

        <div class="logo-mark">
            ZG
        </div>

        ZestGo

    </a>


    <div class="nav-links">

        <a href="callRestaurantServlet">
            Home
        </a>

        <a href="callRestaurantServlet">
            Restaurants
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
     PAGE
===================================================== -->

<div class="page">


    <div class="page-head">

        <span class="eyebrow">
            Secure Checkout
        </span>

        <h1>
            Checkout
        </h1>

        <span class="subtitle">
            Boarding Pass · Confirm Your Order
        </span>

    </div>



<form action="placeOrderServlet"
      method="post">


<div class="pass">


<!-- =====================================================
     DELIVERY DETAILS
===================================================== -->

<div class="stub-main">


    <div class="boarding-label">

        Delivery Details

    </div>



    <label class="field-label">

        Full Name

    </label>

    <input
        type="text"
        name="name"
        placeholder="Enter your full name"
        required>



    <label class="field-label">

        Mobile Number

    </label>

    <input
        type="text"
        name="mobile"
        placeholder="Enter your mobile number"
        required>



    <label class="field-label">

        Delivery Address

    </label>

    <textarea
        name="address"
        placeholder="Enter your complete delivery address"
        required></textarea>



    <label class="field-label">

        Payment Method

    </label>


    <select
        name="paymentMethod"
        required>

        <option value="">
            Select Payment Method
        </option>

        <option value="Cash On Delivery">
            Cash On Delivery
        </option>

        <option value="UPI">
            UPI
        </option>

        <option value="Credit Card">
            Credit Card
        </option>

        <option value="Debit Card">
            Debit Card
        </option>

    </select>


</div>



<!-- =====================================================
     ORDER SUMMARY
===================================================== -->

<div class="stub-side">


    <h2>
        Order Summary
    </h2>


<%

Cart cart =
    (Cart)session.getAttribute("cart");

double itemTotal = 0;


if(cart != null &&
   !cart.getItems().isEmpty())
{

    for(CartItem item :
        cart.getItems().values())
    {

        itemTotal +=
            item.getTotalPrice();

%>


    <div class="order-item">


        <div class="name">

            <%= item.getName() %>

        </div>


        <div class="qty">

            x<%= item.getQuantity() %>

        </div>


        <div class="amt">

            ₹<%= item.getTotalPrice() %>

        </div>


    </div>


<%

    }

}


double deliveryFee =
    itemTotal >= 199 ? 0 : 40;

double platformFee = 5;

double total =
    itemTotal
    + deliveryFee
    + platformFee;

%>


    <!-- TOTAL -->

    <div class="total-box">


        <div class="total-row">

            <div>
                Item Total
            </div>

            <div>
                ₹<%= itemTotal %>
            </div>

        </div>



        <div class="total-row">

            <div>
                Delivery Fee
            </div>

            <div>

<%

if(deliveryFee == 0){

%>

                FREE

<%

}else{

%>

                ₹<%= deliveryFee %>

<%

}

%>

            </div>

        </div>



        <div class="total-row">

            <div>
                Platform Fee
            </div>

            <div>
                ₹<%= platformFee %>
            </div>

        </div>



        <div class="final-total">

            <div>
                Total
            </div>

            <div>
                ₹<%= total %>
            </div>

        </div>



        <!-- PLACE ORDER -->

        <button
            class="place-btn"
            type="submit">

            Place Order →

        </button>



        <!-- BACK TO CART -->

        <button
            type="button"
            class="back-btn"
            onclick="location.href='cart.jsp'">

            ← Back To Cart

        </button>


    </div>


</div>


</div>

</form>

</div>


</body>
</html>