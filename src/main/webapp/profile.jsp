<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String userName =
(String)session.getAttribute("userName");

if(userName == null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo - My Profile</title>

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


/* =====================================================
   VARIABLES
===================================================== */

:root{

    --ink:#0F2A2E;
    --teal:#123B3F;
    --teal-light:#1a4b50;

    --gold:#C9A24B;
    --gold-light:#e0b862;

    --coral:#E4572E;
    --green:#3FAE6C;

    --paper:#EFE9DC;

    --line:rgba(239,233,220,0.16);
}


/* =====================================================
   BODY
===================================================== */

body{

    min-height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;

    padding:40px 16px;

    color:var(--paper);

    font-family:'Space Grotesk',sans-serif;

    background:
        radial-gradient(
            circle at 50% 40%,
            #1a4b50 0%,
            #123B3F 35%,
            #0F2A2E 68%,
            #081517 100%
        );

    overflow-x:hidden;

    position:relative;
}


/* =====================================================
   3D BACKGROUND
===================================================== */

.background-scene{

    position:fixed;

    inset:0;

    overflow:hidden;

    pointer-events:none;

    z-index:0;

    perspective:1200px;
}


/* =====================================================
   3D ORB
===================================================== */

.orb{

    position:absolute;

    width:260px;

    height:260px;

    right:7%;

    top:10%;

    border-radius:50%;

    background:
        radial-gradient(
            circle at 28% 22%,
            rgba(255,255,255,.75) 0%,
            rgba(255,255,255,.20) 7%,
            rgba(224,184,98,.95) 18%,
            rgba(201,162,75,.75) 42%,
            rgba(104,75,25,.55) 68%,
            rgba(8,13,14,.95) 100%
        );

    box-shadow:

        inset -45px -45px 70px
        rgba(0,0,0,.55),

        inset 20px 20px 35px
        rgba(255,255,255,.12),

        0 35px 90px
        rgba(0,0,0,.5),

        0 0 70px
        rgba(201,162,75,.12);

    transform-style:preserve-3d;

    animation:
        orbFloat 11s ease-in-out infinite;
}


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
            translate3d(-35px,30px,55px)
            rotateX(25deg)
            rotateY(50deg)
            scale(1.05);
    }

    50%{
        transform:
            translate3d(-10px,65px,20px)
            rotateX(55deg)
            rotateY(100deg)
            scale(.95);
    }

    75%{
        transform:
            translate3d(30px,25px,55px)
            rotateX(25deg)
            rotateY(150deg)
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
   3D CUBE
===================================================== */

.cube{

    position:absolute;

    width:145px;

    height:145px;

    left:7%;

    bottom:13%;

    border-radius:28px;

    background:
        linear-gradient(
            135deg,
            rgba(201,162,75,.75),
            rgba(228,87,46,.38),
            rgba(18,59,63,.6)
        );

    border:
        1px solid
        rgba(239,233,220,.22);

    box-shadow:

        inset 15px 15px 30px
        rgba(255,255,255,.12),

        inset -25px -25px 40px
        rgba(0,0,0,.5),

        0 35px 75px
        rgba(0,0,0,.45);

    transform-style:preserve-3d;

    animation:
        cubeFloat 13s ease-in-out infinite;
}


.cube::before{

    content:"";

    position:absolute;

    inset:18px;

    border-radius:18px;

    border:
        1px solid
        rgba(239,233,220,.20);

    background:
        linear-gradient(
            135deg,
            rgba(255,255,255,.10),
            transparent
        );

    box-shadow:
        inset 5px 5px 15px
        rgba(255,255,255,.08);
}


@keyframes cubeFloat{

    0%{
        transform:
            perspective(900px)
            translate3d(0,0,0)
            rotateX(15deg)
            rotateY(-20deg)
            rotateZ(0deg);
    }

    25%{
        transform:
            perspective(900px)
            translate3d(35px,-25px,50px)
            rotateX(55deg)
            rotateY(40deg)
            rotateZ(15deg);
    }

    50%{
        transform:
            perspective(900px)
            translate3d(10px,-60px,80px)
            rotateX(100deg)
            rotateY(90deg)
            rotateZ(35deg);
    }

    75%{
        transform:
            perspective(900px)
            translate3d(-35px,-20px,50px)
            rotateX(150deg)
            rotateY(140deg)
            rotateZ(15deg);
    }

    100%{
        transform:
            perspective(900px)
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
        rgba(201,162,75,.17);

    transform-style:preserve-3d;

    animation:
        ringRotate 20s linear infinite;
}


.ring-one{

    width:330px;

    height:330px;

    left:-160px;

    top:15%;
}


.ring-two{

    width:460px;

    height:460px;

    right:-230px;

    bottom:-200px;

    border-color:
        rgba(239,233,220,.07);

    animation-duration:28s;

    animation-direction:reverse;
}


@keyframes ringRotate{

    from{
        transform:
            rotateX(65deg)
            rotateZ(0deg);
    }

    to{
        transform:
            rotateX(65deg)
            rotateZ(360deg);
    }
}


/* =====================================================
   PARTICLES
===================================================== */

.particle{

    position:absolute;

    width:5px;

    height:5px;

    border-radius:50%;

    background:var(--gold);

    box-shadow:
        0 0 12px
        rgba(201,162,75,.8);

    animation:
        particleFloat 7s ease-in-out infinite;
}


.p1{
    top:22%;
    left:28%;
}

.p2{
    top:65%;
    right:28%;
    animation-delay:2s;
}

.p3{
    top:42%;
    left:12%;
    animation-delay:4s;
}

.p4{
    bottom:25%;
    right:15%;
    animation-delay:1s;
}


@keyframes particleFloat{

    0%,
    100%{
        transform:
            translate3d(0,0,0);
        opacity:.3;
    }

    50%{
        transform:
            translate3d(25px,-35px,70px);
        opacity:1;
    }
}


/* =====================================================
   PROFILE CARD
===================================================== */

.card{

    position:relative;

    z-index:2;

    width:430px;

    max-width:96%;

    border-radius:22px;

    overflow:hidden;

    background:
        linear-gradient(
            145deg,
            rgba(18,59,63,.98),
            rgba(15,42,46,.98)
        );

    border:
        1px solid
        rgba(201,162,75,.25);

    color:var(--paper);

    box-shadow:

        0 40px 90px
        rgba(0,0,0,.55),

        0 0 0 1px
        rgba(255,255,255,.02);

    transition:
        transform .3s ease,
        box-shadow .3s ease;
}


.card:hover{

    transform:
        translateY(-5px);

    box-shadow:

        0 50px 100px
        rgba(0,0,0,.65),

        0 0 40px
        rgba(201,162,75,.08);
}


.card::before{

    content:"";

    position:absolute;

    inset:11px;

    border:
        1px dashed
        rgba(201,162,75,.25);

    border-radius:14px;

    pointer-events:none;

    z-index:5;
}


.card::after{

    content:"";

    position:absolute;

    width:190px;

    height:190px;

    right:-100px;

    top:-100px;

    border-radius:50%;

    border:
        1px solid
        rgba(201,162,75,.15);

    box-shadow:

        0 0 0 25px
        rgba(201,162,75,.025),

        0 0 0 50px
        rgba(201,162,75,.015);

    pointer-events:none;

    animation:
        decorationFloat 12s ease-in-out infinite;
}


@keyframes decorationFloat{

    0%,
    100%{
        transform:
            rotate(0deg)
            translateY(0);
    }

    50%{
        transform:
            rotate(15deg)
            translateY(12px);
    }
}


/* =====================================================
   HEADER
===================================================== */

.header{

    position:relative;

    z-index:3;

    padding:
        32px 28px 28px;
}


.eyebrow{

    display:flex;

    justify-content:space-between;

    align-items:center;

    gap:12px;

    margin-bottom:22px;

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.15em;

    text-transform:uppercase;
}


/* =====================================================
   USER ROW
===================================================== */

.id-row{

    display:flex;

    align-items:center;

    gap:17px;
}


.avatar{

    width:66px;

    height:66px;

    flex-shrink:0;

    border-radius:50%;

    display:flex;

    align-items:center;

    justify-content:center;

    background:
        conic-gradient(
            from 210deg,
            var(--coral),
            var(--gold),
            var(--coral)
        );

    color:var(--ink);

    font-family:
        'JetBrains Mono',
        monospace;

    font-weight:700;

    font-size:20px;

    box-shadow:

        0 0 0 4px
        rgba(239,233,220,.08),

        0 15px 35px
        rgba(228,87,46,.15);

    animation:
        avatarFloat 4s ease-in-out infinite;
}


@keyframes avatarFloat{

    0%,
    100%{
        transform:
            translateY(0)
            rotate(0deg);
    }

    50%{
        transform:
            translateY(-6px)
            rotate(3deg);
    }
}


.id-text{

    min-width:0;

    flex:1;
}


.id-text .name{

    color:var(--paper);

    font-size:23px;

    font-weight:700;
}


.id-text .mail{

    margin-top:5px;

    color:
        rgba(239,233,220,.55);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10.5px;

    line-height:1.5;

    word-break:break-all;
}


/* =====================================================
   DIVIDER
===================================================== */

.perf{

    position:relative;

    height:18px;

    background:

        radial-gradient(
            circle 9px at 0 9px,
            transparent 98%,
            var(--teal)
        ),

        radial-gradient(
            circle 9px at 100% 9px,
            transparent 98%,
            var(--teal)
        );

    background-size:
        26px 18px;

    background-repeat:
        repeat-x;

    border-top:
        1px dashed
        rgba(201,162,75,.15);
}


/* =====================================================
   MENU
===================================================== */

.stub{

    position:relative;

    z-index:3;

    padding:
        18px 28px 22px;

    display:flex;

    flex-direction:column;
}


.option{

    display:flex;

    align-items:center;

    gap:14px;

    padding:
        16px 5px;

    border-bottom:
        1px dashed
        var(--line);

    text-decoration:none;

    color:var(--paper);

    transition:
        padding-left .2s ease,
        background .2s ease,
        transform .2s ease;
}


.option:last-child{

    border-bottom:none;
}


.option:hover{

    padding-left:12px;

    background:
        rgba(239,233,220,.045);

    transform:
        translateX(2px);
}


/* =====================================================
   ICON
===================================================== */

.option .badge{

    width:39px;

    height:39px;

    flex-shrink:0;

    border-radius:10px;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:17px;

    background:
        rgba(201,162,75,.16);

    border:
        1px solid
        rgba(201,162,75,.10);
}


.option.home .badge{

    background:
        rgba(63,174,108,.16);
}


.option.favorites .badge{

    background:
        rgba(228,87,46,.17);
}


.option.cart .badge{

    background:
        rgba(239,233,220,.08);
}


.option.logout .badge{

    background:
        rgba(228,87,46,.12);
}


.option.logout{

    color:var(--coral);

    font-weight:600;

    margin-top:6px;
}


.option .label{

    flex:1;

    color:var(--paper);

    font-size:15px;

    font-weight:500;
}


.option.logout .label{

    color:var(--coral);
}


/* =====================================================
   ARROW
===================================================== */

.option .arrow{

    color:
        rgba(239,233,220,.32);

    font-size:22px;

    transition:
        transform .2s ease,
        color .2s ease;
}


.option:hover .arrow{

    color:var(--gold);

    transform:
        translateX(4px);
}


/* =====================================================
   BARCODE
===================================================== */

.barcode{

    position:relative;

    z-index:3;

    padding:
        18px 28px 27px;

    border-top:
        1px solid
        rgba(239,233,220,.12);

    display:flex;

    align-items:center;

    justify-content:space-between;

    gap:20px;
}


.bars{

    display:flex;

    gap:2px;

    align-items:flex-end;

    height:27px;

    opacity:.65;
}


.bars span{

    display:block;

    width:2px;

    background:
        rgba(239,233,220,.55);

    border-radius:1px;
}


.member-id{

    color:
        rgba(239,233,220,.4);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9px;

    letter-spacing:.08em;

    white-space:nowrap;
}


/* =====================================================
   MOBILE
===================================================== */

@media(max-width:600px){

    body{

        padding:
            25px 10px;

        align-items:
            flex-start;
    }


    .card{

        width:96%;

        margin:
            20px auto;

        border-radius:19px;
    }


    .header{

        padding:
            28px 21px 25px;
    }


    .eyebrow{

        font-size:8px;

        margin-bottom:20px;
    }


    .id-row{

        gap:13px;
    }


    .avatar{

        width:57px;

        height:57px;

        font-size:17px;
    }


    .id-text .name{

        font-size:20px;
    }


    .id-text .mail{

        font-size:9px;
    }


    .stub{

        padding:
            15px 21px 19px;
    }


    .option{

        padding:
            14px 3px;
    }


    .option .badge{

        width:36px;

        height:36px;

        font-size:15px;
    }


    .option .label{

        font-size:14px;
    }


    .option .arrow{

        font-size:20px;
    }


    .barcode{

        padding:
            16px 21px 23px;
    }


    .member-id{

        font-size:7px;
    }


    .orb{

        width:150px;

        height:150px;

        right:-40px;

        top:12%;
    }


    .cube{

        width:90px;

        height:90px;

        left:-25px;

        bottom:10%;
    }


    .ring-one{

        width:190px;

        height:190px;

        left:-100px;
    }


    .ring-two{

        width:280px;

        height:280px;

        right:-150px;

        bottom:-100px;
    }
}


/* =====================================================
   VERY SMALL PHONES
===================================================== */

@media(max-width:380px){

    .card{

        width:98%;
    }


    .header{

        padding:
            25px 17px 22px;
    }


    .stub{

        padding-left:17px;

        padding-right:17px;
    }


    .barcode{

        padding-left:17px;

        padding-right:17px;
    }


    .id-text .name{

        font-size:18px;
    }


    .option .label{

        font-size:13.5px;
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
     PROFILE CARD
===================================================== -->

<div class="card">


    <!-- HEADER -->

    <div class="header">

        <div class="eyebrow">

            <span>
                Member Card
            </span>

            <span>
                Signed In
            </span>

        </div>


        <div class="id-row">

            <div class="avatar">

                <%= userName.length() >= 2
                    ? userName.substring(0,2).toUpperCase()
                    : userName.toUpperCase()
                %>

            </div>


            <div class="id-text">

                <div class="name">
                    My Profile
                </div>

                <div class="mail">
                    <%= userName %>
                </div>

            </div>

        </div>

    </div>


    <!-- DIVIDER -->

    <div class="perf"></div>


    <!-- MENU -->

    <div class="stub">


        <!-- HOME -->

        <a href="callRestaurantServlet"
           class="option home">

            <div class="badge">
                🏠
            </div>

            <div class="label">
                Home
            </div>

            <div class="arrow">
                ›
            </div>

        </a>


        <!-- FAVORITES -->

        <a href="favorites"
           class="option favorites">

            <div class="badge">
                ❤️
            </div>

            <div class="label">
                My Favorites
            </div>

            <div class="arrow">
                ›
            </div>

        </a>


        <!-- ORDERS -->

        <a href="orderHistory"
           class="option">

            <div class="badge">
                📦
            </div>

            <div class="label">
                My Orders
            </div>

            <div class="arrow">
                ›
            </div>

        </a>


        <!-- CART -->

        <a href="cart.jsp"
           class="option cart">

            <div class="badge">
                🛒
            </div>

            <div class="label">
                My Cart
            </div>

            <div class="arrow">
                ›
            </div>

        </a>


        <!-- CHANGE PASSWORD -->

        <a href="changePassword.jsp"
           class="option">

            <div class="badge">
                🔒
            </div>

            <div class="label">
                Change Password
            </div>

            <div class="arrow">
                ›
            </div>

        </a>


        <!-- LOGOUT -->

        <a href="logout"
           class="option logout">

            <div class="badge">
                🚪
            </div>

            <div class="label">
                Logout
            </div>

            <div class="arrow">
                ›
            </div>

        </a>


    </div>


    <!-- FOOTER -->

    <div class="barcode">

        <div class="bars"
             id="bars">
        </div>

        <div class="member-id">
            SESSION ACTIVE
        </div>

    </div>


</div>


<!-- =====================================================
     BARCODE SCRIPT
===================================================== -->

<script>

var bars =
    document.getElementById("bars");

for(var i = 0; i < 40; i++){

    var b =
        document.createElement("span");

    var h =
        10 + Math.random() * 17;

    b.style.height =
        h + "px";

    bars.appendChild(b);
}

</script>


</body>
</html>