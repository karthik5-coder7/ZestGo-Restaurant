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

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo | My Favorites</title>


<!-- =====================================================
     GOOGLE FONTS
====================================================== -->

<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap"
      rel="stylesheet">


<style>

/* =====================================================
   RESET
====================================================== */

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

    color:#f5efe3;

    overflow-x:hidden;

}


/* =====================================================
   ROOT COLORS
====================================================== */

:root{

    --ink:#071416;
    --ink-light:#0F2A2E;

    --teal:#123B3F;

    --gold:#C9A24B;
    --gold-light:#E0BD67;

    --coral:#E4572E;

    --paper:#F5EFE3;

}


/* =====================================================
   3D ANIMATED BACKGROUND
====================================================== */

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
            rgba(18,59,63,.30),
            transparent 58%
        );

}


/* =====================================================
   BACKGROUND ORBS
====================================================== */

.orb{

    position:absolute;

    border-radius:50%;

    transform-style:preserve-3d;

    filter:blur(.3px);

    opacity:.45;

}


/* GOLD ORB */

.orb-1{

    width:180px;
    height:180px;

    left:8%;
    top:20%;

    background:
        radial-gradient(
            circle at 30% 25%,
            rgba(255,225,140,.8),
            rgba(201,162,75,.18) 35%,
            transparent 70%
        );

    box-shadow:
        0 0 80px
        rgba(201,162,75,.12);

    animation:
        orbOne 12s ease-in-out infinite;

}


/* TEAL ORB */

.orb-2{

    width:260px;
    height:260px;

    right:5%;
    top:15%;

    background:
        radial-gradient(
            circle at 35% 30%,
            rgba(80,180,175,.35),
            rgba(18,59,63,.08) 45%,
            transparent 72%
        );

    animation:
        orbTwo 16s ease-in-out infinite;

}


/* CORAL ORB */

.orb-3{

    width:140px;
    height:140px;

    right:24%;
    bottom:8%;

    background:
        radial-gradient(
            circle at 35% 30%,
            rgba(228,87,46,.35),
            rgba(228,87,46,.04) 50%,
            transparent 75%
        );

    animation:
        orbThree 11s ease-in-out infinite;

}


/* =====================================================
   ORB ANIMATIONS
====================================================== */

@keyframes orbOne{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            rotateX(0deg)
            rotateY(0deg)
            scale(1);

    }

    25%{

        transform:
            translate3d(80px,-45px,80px)
            rotateX(25deg)
            rotateY(40deg)
            scale(1.08);

    }

    50%{

        transform:
            translate3d(30px,70px,120px)
            rotateX(50deg)
            rotateY(80deg)
            scale(.92);

    }

    75%{

        transform:
            translate3d(-60px,20px,60px)
            rotateX(25deg)
            rotateY(120deg)
            scale(1.05);

    }

}


@keyframes orbTwo{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            rotateX(0deg)
            rotateY(0deg);

    }

    30%{

        transform:
            translate3d(-100px,50px,100px)
            rotateX(45deg)
            rotateY(80deg);

    }

    60%{

        transform:
            translate3d(-30px,-70px,150px)
            rotateX(80deg)
            rotateY(150deg);

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
            translate3d(-80px,-100px,100px)
            scale(1.25);

    }

}


/* =====================================================
   3D RINGS
====================================================== */

.ring{

    position:absolute;

    border-radius:50%;

    border:
        1px solid
        rgba(201,162,75,.20);

    transform-style:preserve-3d;

    box-shadow:
        0 0 30px
        rgba(201,162,75,.04);

}


/* RING 1 */

.ring-1{

    width:380px;
    height:380px;

    left:-100px;
    bottom:-120px;

    animation:
        ringOne 18s linear infinite;

}


/* RING 2 */

.ring-2{

    width:280px;
    height:280px;

    right:-80px;
    top:30%;

    border-color:
        rgba(80,180,175,.14);

    animation:
        ringTwo 14s linear infinite;

}


/* RING 3 */

.ring-3{

    width:180px;
    height:180px;

    left:48%;
    top:8%;

    border-color:
        rgba(228,87,46,.12);

    animation:
        ringThree 11s linear infinite;

}


/* =====================================================
   RING ANIMATIONS
====================================================== */

@keyframes ringOne{

    from{

        transform:
            rotateX(65deg)
            rotateZ(0deg)
            translateZ(0);

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
   FLOATING PARTICLES
====================================================== */

.particle{

    position:absolute;

    width:4px;
    height:4px;

    border-radius:50%;

    background:#C9A24B;

    box-shadow:
        0 0 12px
        rgba(201,162,75,.8);

    opacity:.5;

}


/* PARTICLE POSITIONS */

.particle-1{
    left:15%;
    top:75%;
    animation:
        particleFloat 7s ease-in-out infinite;
}

.particle-2{
    left:28%;
    top:25%;
    animation:
        particleFloat 9s ease-in-out infinite 1s;
}

.particle-3{
    left:45%;
    top:78%;
    animation:
        particleFloat 8s ease-in-out infinite 2s;
}

.particle-4{
    left:65%;
    top:20%;
    animation:
        particleFloat 10s ease-in-out infinite 1.5s;
}

.particle-5{
    left:80%;
    top:65%;
    animation:
        particleFloat 7s ease-in-out infinite 3s;
}

.particle-6{
    left:90%;
    top:35%;
    animation:
        particleFloat 11s ease-in-out infinite 2s;
}

.particle-7{
    left:52%;
    top:45%;
    animation:
        particleFloat 8s ease-in-out infinite 4s;
}

.particle-8{
    left:10%;
    top:45%;
    animation:
        particleFloat 9s ease-in-out infinite 2.5s;
}


/* PARTICLE ANIMATION */

@keyframes particleFloat{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            scale(1);

        opacity:.25;

    }

    50%{

        transform:
            translate3d(30px,-80px,100px)
            scale(1.8);

        opacity:.8;

    }

}


/* =====================================================
   NAVBAR
====================================================== */

.navbar{

    width:100%;

    padding:18px 5%;

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


/* =====================================================
   BRAND
====================================================== */

.brand{

    display:flex;

    align-items:center;

    gap:11px;

    text-decoration:none;

}


.brand-mark{

    width:42px;
    height:42px;

    display:flex;

    align-items:center;

    justify-content:center;

    border-radius:12px;

    color:#071416;

    background:
        linear-gradient(
            135deg,
            #E2C473,
            #A97B2B
        );

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:14px;

    font-weight:800;

    box-shadow:
        0 10px 30px
        rgba(201,162,75,.20);

}


.brand-name{

    color:var(--paper);

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:20px;

    font-weight:700;

    letter-spacing:.04em;

}


/* =====================================================
   BACK LINK
====================================================== */

.back-link{

    display:inline-flex;

    align-items:center;

    gap:8px;

    padding:10px 16px;

    border-radius:10px;

    text-decoration:none;

    color:
        rgba(245,239,227,.70);

    border:
        1px solid
        rgba(255,255,255,.08);

    background:
        rgba(255,255,255,.035);

    font-size:13px;

    font-weight:600;

    transition:.25s ease;

}


.back-link:hover{

    color:var(--gold);

    border-color:
        rgba(201,162,75,.35);

    background:
        rgba(201,162,75,.07);

    transform:
        translateY(-2px);

}


/* =====================================================
   MAIN CONTAINER
====================================================== */

.container{

    width:92%;

    max-width:1250px;

    margin:
        0 auto;

    padding:
        55px 0 80px;

    position:relative;

    z-index:5;

}


/* =====================================================
   HEADER
====================================================== */

.heading-area{

    text-align:center;

    margin-bottom:48px;

}


.eyebrow{

    display:inline-block;

    margin-bottom:12px;

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    font-weight:700;

    letter-spacing:.20em;

    text-transform:uppercase;

}


.heading{

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:
        clamp(30px,4vw,46px);

    font-weight:700;

    letter-spacing:-.045em;

    line-height:1.1;

    color:var(--paper);

}


.heading span{

    color:var(--gold);

}


.heading-subtext{

    max-width:520px;

    margin:
        15px auto 0;

    color:
        rgba(245,239,227,.43);

    font-size:14px;

    line-height:1.7;

}


/* =====================================================
   FAVORITES GRID
====================================================== */

.favorite-grid{

    display:grid;

    grid-template-columns:
        repeat(3,minmax(0,1fr));

    gap:27px;

}


/* =====================================================
   CARD
====================================================== */

.card{

    position:relative;

    overflow:hidden;

    border-radius:22px;

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

        0 25px 70px
        rgba(0,0,0,.32),

        inset 0 1px 0
        rgba(255,255,255,.06);

    backdrop-filter:
        blur(16px);

    transform-style:
        preserve-3d;

    perspective:
        1000px;

    will-change:
        transform;

    animation:
        cardFloat
        6s ease-in-out infinite;

    transition:
        transform .35s ease,
        border-color .35s ease,
        box-shadow .35s ease;

}


/* =====================================================
   DIFFERENT CARD TIMINGS
====================================================== */

.card:nth-child(2){
    animation-delay:-1.2s;
}

.card:nth-child(3){
    animation-delay:-2.4s;
}

.card:nth-child(4){
    animation-delay:-3.2s;
}

.card:nth-child(5){
    animation-delay:-4.2s;
}

.card:nth-child(6){
    animation-delay:-2s;
}


/* =====================================================
   CARD FLOAT
====================================================== */

@keyframes cardFloat{

    0%,
    100%{

        transform:
            translate3d(0,0,0)
            rotateX(0deg)
            rotateY(0deg);

    }

    50%{

        transform:
            translate3d(0,-5px,0)
            rotateX(.5deg)
            rotateY(-.5deg);

    }

}


/* =====================================================
   CARD REFLECTION
====================================================== */

.card::after{

    content:"";

    position:absolute;

    top:-120%;

    left:-110%;

    width:70%;

    height:300%;

    background:
        linear-gradient(
            90deg,
            transparent,
            rgba(255,255,255,.055),
            transparent
        );

    transform:
        rotate(25deg);

    pointer-events:none;

    opacity:.5;

    animation:
        cardReflection
        8s ease-in-out infinite;

}


@keyframes cardReflection{

    0%{
        left:-110%;
    }

    45%,
    100%{
        left:150%;
    }

}


/* =====================================================
   CARD HOVER
====================================================== */

.card:hover{

    animation-play-state:
        paused;

    transform:
        translateY(-12px)
        rotateX(2deg)
        rotateY(-2deg)
        scale(1.015);

    border-color:
        rgba(201,162,75,.34);

    box-shadow:

        0 35px 85px
        rgba(0,0,0,.45),

        0 18px 40px
        rgba(201,162,75,.08);

}


/* =====================================================
   IMAGE
====================================================== */

.image-wrapper{

    width:100%;

    height:220px;

    position:relative;

    overflow:hidden;

    transform:
        translateZ(12px);

    transform-style:
        preserve-3d;

    background:#102326;

}


.card img{

    width:100%;

    height:100%;

    display:block;

    object-fit:cover;

    transform:
        translateZ(15px)
        scale(1.01);

    transition:
        transform .6s
        cubic-bezier(.2,.8,.2,1),

        filter .6s ease;

}


.card:hover img{

    transform:
        translateZ(25px)
        scale(1.08);

    filter:
        brightness(.88)
        saturate(1.12);

}


/* =====================================================
   IMAGE OVERLAY
====================================================== */

.image-wrapper::after{

    content:"";

    position:absolute;

    left:0;

    right:0;

    bottom:0;

    height:100px;

    background:
        linear-gradient(
            transparent,
            rgba(7,20,22,.82)
        );

    pointer-events:none;

}


/* =====================================================
   SAVED BADGE
====================================================== */

.saved-badge{

    position:absolute;

    top:15px;

    right:15px;

    z-index:5;

    padding:
        7px 11px;

    border-radius:30px;

    color:#081516;

    background:
        linear-gradient(
            135deg,
            #E2C473,
            #B98B36
        );

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9px;

    font-weight:700;

    letter-spacing:.05em;

    box-shadow:
        0 10px 25px
        rgba(0,0,0,.25);

    transform:
        translateZ(30px);

    animation:
        badgeFloat
        3.5s ease-in-out infinite;

}


@keyframes badgeFloat{

    0%,
    100%{

        transform:
            translateZ(30px)
            rotate(-2deg);

    }

    50%{

        transform:
            translateZ(38px)
            rotate(2deg);

    }

}


/* =====================================================
   CONTENT
====================================================== */

.content{

    padding:22px;

    transform:
        translateZ(18px);

    transform-style:
        preserve-3d;

}


.content h2{

    color:var(--paper);

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:20px;

    font-weight:700;

    letter-spacing:-.02em;

    margin-bottom:8px;

}


.cuisine{

    color:var(--gold);

    font-size:12px;

    font-weight:600;

    letter-spacing:.05em;

    text-transform:uppercase;

    margin-bottom:8px;

}


.address{

    color:
        rgba(245,239,227,.45);

    font-size:13px;

    line-height:1.55;

    min-height:40px;

}


/* =====================================================
   RATING
====================================================== */

.rating{

    display:inline-flex;

    align-items:center;

    gap:5px;

    margin-top:14px;

    padding:
        7px 11px;

    border-radius:8px;

    background:
        rgba(201,162,75,.08);

    border:
        1px solid
        rgba(201,162,75,.20);

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:11px;

    font-weight:700;

    transform:
        translateZ(22px);

}


/* =====================================================
   BUTTON ROW
====================================================== */

.button-row{

    display:flex;

    gap:10px;

    margin-top:20px;

}


/* =====================================================
   BUTTONS
====================================================== */

.open-btn,
.remove-btn{

    flex:1;

    display:flex;

    align-items:center;

    justify-content:center;

    min-height:44px;

    border-radius:11px;

    text-decoration:none;

    font-size:12.5px;

    font-weight:700;

    transform:
        translateZ(25px);

    transition:
        transform .25s ease,
        box-shadow .25s ease,
        background .25s ease,
        border-color .25s ease;

}


/* VIEW MENU */

.open-btn{

    color:#071416;

    background:
        linear-gradient(
            135deg,
            #E0BD67,
            #B98B36
        );

    box-shadow:
        0 10px 25px
        rgba(201,162,75,.10);

}


.open-btn:hover{

    transform:
        translateZ(35px)
        translateY(-3px);

    box-shadow:
        0 15px 30px
        rgba(201,162,75,.20);

}


/* REMOVE */

.remove-btn{

    color:var(--coral);

    background:
        rgba(228,87,46,.055);

    border:
        1px solid
        rgba(228,87,46,.20);

}


.remove-btn:hover{

    color:#fff;

    background:var(--coral);

    border-color:var(--coral);

    transform:
        translateZ(35px)
        translateY(-3px);

}


/* =====================================================
   EMPTY STATE
====================================================== */

.empty{

    max-width:600px;

    margin:
        80px auto 20px;

    padding:
        55px 35px;

    text-align:center;

    border-radius:25px;

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,.07),
            rgba(255,255,255,.025)
        );

    border:
        1px solid
        rgba(255,255,255,.09);

    box-shadow:
        0 30px 80px
        rgba(0,0,0,.3);

    backdrop-filter:
        blur(15px);

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

    font-size:30px;

    background:
        rgba(201,162,75,.08);

    border:
        1px solid
        rgba(201,162,75,.2);

    animation:
        emptyFloat
        4s ease-in-out infinite;

}


@keyframes emptyFloat{

    0%,
    100%{

        transform:
            translateY(0)
            rotate(0deg);

    }

    50%{

        transform:
            translateY(-7px)
            rotate(2deg);

    }

}


.empty h2{

    color:var(--paper);

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:26px;

    margin-bottom:10px;

}


.empty p{

    color:
        rgba(245,239,227,.42);

    font-size:14px;

    line-height:1.7;

    margin-bottom:25px;

}


.empty .open-btn{

    display:inline-flex;

    width:auto;

    padding:
        12px 22px;

}


/* =====================================================
   TABLET
====================================================== */

@media(max-width:1050px){

    .favorite-grid{

        grid-template-columns:
            repeat(2,minmax(0,1fr));

    }

}


/* =====================================================
   MOBILE
====================================================== */

@media(max-width:700px){

    .navbar{

        padding:
            15px 18px;

    }


    .brand-name{

        font-size:18px;

    }


    .brand-mark{

        width:38px;

        height:38px;

        border-radius:11px;

    }


    .back-link{

        padding:
            9px 12px;

        font-size:12px;

    }


    .container{

        width:
            calc(100% - 28px);

        padding:
            38px 0 55px;

    }


    .heading-area{

        margin-bottom:32px;

    }


    .heading{

        font-size:31px;

    }


    .heading-subtext{

        padding:
            0 8px;

        font-size:13px;

    }


    .favorite-grid{

        grid-template-columns:1fr;

        gap:20px;

    }


    /* Mobile background */

    .orb-1{

        width:120px;
        height:120px;

        left:-30px;

    }


    .orb-2{

        width:170px;
        height:170px;

        right:-60px;

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


    /* Mobile card */

    .card{

        border-radius:20px;

        animation:
            cardFloatMobile
            7s ease-in-out infinite;

    }


    @keyframes cardFloatMobile{

        0%,
        100%{

            transform:
                translateY(0);

        }

        50%{

            transform:
                translateY(-3px);

        }

    }


    .card:hover{

        animation-play-state:
            paused;

        transform:
            translateY(-5px)
            scale(1.005);

    }


    .image-wrapper{

        height:210px;

        transform:none;

    }


    .card .content{

        transform:none;

    }


    .saved-badge{

        animation:
            badgeFloatMobile
            4s ease-in-out infinite;

    }


    @keyframes badgeFloatMobile{

        0%,
        100%{

            transform:
                translateY(0);

        }

        50%{

            transform:
                translateY(-3px);

        }

    }


    .content{

        padding:19px;

    }


    .content h2{

        font-size:19px;

    }


    .button-row{

        gap:9px;

    }


    .open-btn,
    .remove-btn{

        min-height:46px;

        font-size:12px;

        transform:none;

    }


    .open-btn:hover,
    .remove-btn:hover{

        transform:
            translateY(-2px);

    }

}


/* =====================================================
   SMALL PHONES
====================================================== */

@media(max-width:420px){

    .navbar{

        padding:
            13px 14px;

    }


    .brand{

        gap:8px;

    }


    .brand-name{

        font-size:17px;

    }


    .brand-mark{

        width:36px;

        height:36px;

    }


    .back-link{

        padding:
            8px 10px;

        font-size:11px;

    }


    .container{

        width:
            calc(100% - 22px);

        padding-top:30px;

    }


    .eyebrow{

        font-size:9px;

    }


    .heading{

        font-size:28px;

    }


    .heading-subtext{

        font-size:12px;

    }


    .image-wrapper{

        height:195px;

    }


    .content{

        padding:17px;

    }


    .button-row{

        flex-direction:column;

    }


    .open-btn,
    .remove-btn{

        width:100%;

    }


    .empty{

        margin-top:45px;

        padding:
            40px 20px;

    }


    .empty h2{

        font-size:23px;

    }

}


/* =====================================================
   REDUCE MOTION
====================================================== */

@media(prefers-reduced-motion:reduce){

    .background-3d *,
    .card,
    .card::after,
    .saved-badge,
    .empty-icon{

        animation:none !important;

    }


    .card,
    .card:hover{

        transform:none !important;

    }

}

</style>

</head>


<body>


<!-- =====================================================
     3D BACKGROUND
====================================================== -->

<div class="background-3d">


    <!-- ORBS -->

    <div class="orb orb-1"></div>

    <div class="orb orb-2"></div>

    <div class="orb orb-3"></div>


    <!-- 3D RINGS -->

    <div class="ring ring-1"></div>

    <div class="ring ring-2"></div>

    <div class="ring ring-3"></div>


    <!-- PARTICLES -->

    <div class="particle particle-1"></div>

    <div class="particle particle-2"></div>

    <div class="particle particle-3"></div>

    <div class="particle particle-4"></div>

    <div class="particle particle-5"></div>

    <div class="particle particle-6"></div>

    <div class="particle particle-7"></div>

    <div class="particle particle-8"></div>


</div>



<!-- =====================================================
     NAVBAR
====================================================== -->

<nav class="navbar">


    <a href="callRestaurantServlet"
       class="brand">


        <div class="brand-mark">

            ZG

        </div>


        <div class="brand-name">

            ZestGo

        </div>


    </a>



    <a href="callRestaurantServlet"
       class="back-link">

        ← Browse Restaurants

    </a>


</nav>



<!-- =====================================================
     MAIN
====================================================== -->

<div class="container">


    <!-- =================================================
         HEADER
    ================================================== -->

    <div class="heading-area">


        <span class="eyebrow">

            Your Collection

        </span>


        <h1 class="heading">

            My <span>Favorites</span>

        </h1>


        <p class="heading-subtext">

            Your favorite restaurants, all in one place.
            Discover their menus whenever you're ready.

        </p>


    </div>



<%
if(favorites != null && !favorites.isEmpty()){
%>


    <!-- =================================================
         FAVORITES GRID
    ================================================== -->

    <div class="favorite-grid">


<%
for(User user : favorites){
%>


        <!-- =================================================
             RESTAURANT CARD
        ================================================== -->

        <div class="card">


            <!-- IMAGE -->

            <div class="image-wrapper">


                <img
                    src="<%= user.getImagePath() %>"
                    alt="<%= user.getName() %>">


                <div class="saved-badge">

                    ♥ SAVED

                </div>


            </div>



            <!-- CONTENT -->

            <div class="content">


                <h2>

                    <%= user.getName() %>

                </h2>


                <p class="cuisine">

                    <%= user.getCuisineType() %>

                </p>


                <p class="address">

                    📍 <%= user.getAddress() %>

                </p>


                <span class="rating">

                    ⭐ <%= user.getRating() %>

                </span>



                <!-- BUTTONS -->

                <div class="button-row">


                    <!-- VIEW MENU -->

                    <a
                        class="open-btn"
                        href="menu?restaurantId=<%= user.getRestaurantID() %>">

                        View Menu

                    </a>



                    <!-- REMOVE FAVORITE -->

                    <a
                        class="remove-btn"
                        href="removeFavorite?restaurantId=<%= user.getRestaurantID() %>">

                        ✕ Remove

                    </a>


                </div>


            </div>


        </div>


<%
}
%>


    </div>


<%
}else{
%>


    <!-- =================================================
         EMPTY STATE
    ================================================== -->

    <div class="empty">


        <div class="empty-icon">

            ❤️

        </div>


        <h2>

            No Favorites Yet

        </h2>


        <p>

            You haven't saved any restaurants yet.
            Explore ZestGo and add your favorite places here.

        </p>


        <a
            class="open-btn"
            href="callRestaurantServlet">

            Browse Restaurants

        </a>


    </div>


<%
}
%>


</div>


</body>

</html>