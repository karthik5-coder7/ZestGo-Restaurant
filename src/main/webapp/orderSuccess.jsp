<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String userName = (String) session.getAttribute("userName");
String orderId = "ZG-" + (100000 + (int)(Math.random() * 899999));
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo - Order Success</title>

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
   COLORS
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

    --muted:#64748b;
}


/* =====================================================
   BODY
===================================================== */

body{

    min-height:100vh;

    font-family:
        'Space Grotesk',
        sans-serif;

    color:var(--paper);

    background:
        radial-gradient(
            circle at 50% 45%,
            #1a4b50 0%,
            #123B3F 35%,
            #0F2A2E 70%,
            #081517 100%
        );

    overflow-x:hidden;

    position:relative;
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

    perspective:1100px;
}


/* =====================================================
   3D GOLD ORB
===================================================== */

.orb{

    position:absolute;

    width:260px;
    height:260px;

    right:8%;
    top:12%;

    border-radius:50%;

    background:
        radial-gradient(
            circle at 28% 23%,

            rgba(255,255,255,.75) 0%,

            rgba(255,255,255,.22) 7%,

            rgba(224,184,98,.95) 18%,

            rgba(201,162,75,.75) 42%,

            rgba(122,91,29,.55) 68%,

            rgba(10,15,15,.90) 100%
        );

    box-shadow:

        inset -40px -40px 65px
        rgba(0,0,0,.55),

        inset 20px 20px 35px
        rgba(255,255,255,.12),

        0 35px 90px
        rgba(0,0,0,.45),

        0 0 70px
        rgba(201,162,75,.14);

    transform-style:preserve-3d;

    animation:
        orbAnimation 10s ease-in-out infinite;
}


/* =====================================================
   ORB ANIMATION
===================================================== */

@keyframes orbAnimation{

    0%{

        transform:
            translate3d(0,0,0)
            rotateX(0deg)
            rotateY(0deg)
            scale(1);

    }

    25%{

        transform:
            translate3d(-35px,30px,60px)
            rotateX(25deg)
            rotateY(45deg)
            scale(1.06);

    }

    50%{

        transform:
            translate3d(-15px,65px,25px)
            rotateX(55deg)
            rotateY(100deg)
            scale(.95);

    }

    75%{

        transform:
            translate3d(30px,30px,65px)
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
   3D CUBE
===================================================== */

.cube{

    position:absolute;

    width:145px;
    height:145px;

    left:7%;
    bottom:16%;

    border-radius:28px;

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
        cubeAnimation 12s ease-in-out infinite;
}


/* CUBE INNER PANEL */

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

@keyframes cubeAnimation{

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
            translate3d(35px,-30px,50px)
            rotateX(55deg)
            rotateY(35deg)
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
            translate3d(-35px,-25px,50px)
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
        rgba(201,162,75,.18);

    transform-style:preserve-3d;

    animation:
        ringAnimation 18s linear infinite;
}


.ring-one{

    width:300px;
    height:300px;

    left:-150px;
    top:20%;
}


.ring-two{

    width:450px;
    height:450px;

    right:-230px;
    bottom:-180px;

    border-color:
        rgba(239,233,220,.08);

    animation-duration:25s;

    animation-direction:reverse;
}


@keyframes ringAnimation{

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
   FLOATING PARTICLES
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
        particleAnimation 7s ease-in-out infinite;
}


.p1{
    top:22%;
    left:30%;
}

.p2{
    top:60%;
    right:28%;
    animation-delay:2s;
}

.p3{
    top:40%;
    left:13%;
    animation-delay:4s;
}

.p4{
    bottom:24%;
    right:15%;
    animation-delay:1s;
}


@keyframes particleAnimation{

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
   SUCCESS CARD
===================================================== */

.card{

    position:relative;

    z-index:2;

    width:460px;

    max-width:94%;

    margin:50px auto;

    overflow:hidden;

    border-radius:22px;

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

        0 35px 80px
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

        0 45px 90px
        rgba(0,0,0,.65),

        0 0 35px
        rgba(201,162,75,.08);
}


/* =====================================================
   INNER DASHED BORDER
===================================================== */

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


/* =====================================================
   DECORATIVE 3D CARD ORB
===================================================== */

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
        rgba(201,162,75,.16);

    box-shadow:

        0 0 0 25px
        rgba(201,162,75,.025),

        0 0 0 50px
        rgba(201,162,75,.015);

    pointer-events:none;

    animation:
        cardDecoration 12s ease-in-out infinite;
}


@keyframes cardDecoration{

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
        34px 30px 28px;

    text-align:center;
}


/* =====================================================
   EYEBROW
===================================================== */

.eyebrow{

    display:flex;

    justify-content:space-between;

    align-items:center;

    gap:15px;

    margin-bottom:25px;

    text-align:left;

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.15em;

    text-transform:uppercase;
}


/* =====================================================
   SUCCESS ICON
===================================================== */

.check-avatar{

    width:78px;
    height:78px;

    margin:
        0 auto 20px;

    border-radius:50%;

    background:
        conic-gradient(
            from 210deg,
            var(--green),
            var(--gold),
            var(--green)
        );

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:31px;

    color:var(--ink);

    box-shadow:

        0 0 0 5px
        rgba(239,233,220,.08),

        0 15px 35px
        rgba(63,174,108,.18);

    animation:
        successFloat 4s ease-in-out infinite;
}


@keyframes successFloat{

    0%,
    100%{

        transform:
            translateY(0)
            rotate(0deg);
    }

    50%{

        transform:
            translateY(-7px)
            rotate(3deg);
    }
}


/* =====================================================
   TITLE
===================================================== */

.header .title{

    color:var(--paper);

    font-size:25px;

    font-weight:700;

    line-height:1.25;
}


.header .sub{

    margin-top:9px;

    color:
        rgba(239,233,220,.58);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:11px;

    line-height:1.7;
}


/* =====================================================
   PERFORATED DIVIDER
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
   DETAILS
===================================================== */

.stub{

    position:relative;

    z-index:3;

    padding:
        22px 30px 10px;

    display:flex;

    flex-direction:column;
}


.detail-row{

    display:flex;

    align-items:center;

    gap:14px;

    padding:15px 4px;

    border-bottom:
        1px dashed
        rgba(239,233,220,.14);
}


.detail-row:last-child{

    border-bottom:none;
}


/* =====================================================
   DETAIL ICON
===================================================== */

.detail-row .badge{

    width:38px;
    height:38px;

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
        rgba(201,162,75,.12);
}


/* =====================================================
   DETAIL TEXT
===================================================== */

.detail-row .info{

    flex:1;

    min-width:0;
}


.detail-row .info .label{

    color:
        rgba(239,233,220,.42);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9.5px;

    letter-spacing:.08em;

    text-transform:uppercase;
}


.detail-row .info .value{

    margin-top:3px;

    color:var(--paper);

    font-size:15px;

    font-weight:500;

    overflow-wrap:anywhere;
}


/* =====================================================
   ACTIONS
===================================================== */

.actions{

    position:relative;

    z-index:3;

    padding:
        14px 30px 22px;

    display:flex;

    flex-direction:column;
}


.option{

    display:flex;

    align-items:center;

    gap:14px;

    padding:16px 5px;

    border-bottom:
        1px dashed
        rgba(239,233,220,.14);

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
   ACTION ICON
===================================================== */

.option .badge{

    width:38px;
    height:38px;

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


.option.primary .badge{

    background:
        rgba(63,174,108,.18);
}


.option.secondary .badge{

    background:
        rgba(239,233,220,.08);
}


.option.primary{

    font-weight:600;
}


/* =====================================================
   ACTION LABEL
===================================================== */

.option .label{

    flex:1;

    color:var(--paper);

    font-size:15px;

    font-weight:500;
}


.option .arrow{

    color:
        rgba(239,233,220,.35);

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
        18px 30px 27px;

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

    align-items:flex-end;

    gap:2px;

    height:28px;

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
        rgba(239,233,220,.40);

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

    .card{

        width:94%;

        margin:
            28px auto;

        border-radius:19px;
    }


    .header{

        padding:
            30px 22px 25px;
    }


    .eyebrow{

        font-size:8.5px;

        margin-bottom:21px;
    }


    .check-avatar{

        width:70px;
        height:70px;

        font-size:27px;
    }


    .header .title{

        font-size:21px;
    }


    .header .sub{

        font-size:10px;

        line-height:1.6;
    }


    .stub{

        padding:
            18px 22px 8px;
    }


    .detail-row{

        padding:
            13px 2px;
    }


    .detail-row .badge{

        width:35px;
        height:35px;

        font-size:15px;
    }


    .detail-row .info .label{

        font-size:8.5px;
    }


    .detail-row .info .value{

        font-size:14px;
    }


    .actions{

        padding:
            12px 22px 19px;
    }


    .option{

        padding:
            14px 3px;
    }


    .option .badge{

        width:35px;
        height:35px;

        font-size:15px;
    }


    .option .label{

        font-size:14px;
    }


    .barcode{

        padding:
            16px 22px 23px;
    }


    .member-id{

        font-size:8px;
    }


    /* smaller background objects */

    .orb{

        width:150px;
        height:150px;

        right:-40px;

        top:15%;
    }


    .cube{

        width:90px;
        height:90px;

        left:-25px;

        bottom:12%;
    }


    .ring-one{

        width:190px;
        height:190px;

        left:-100px;
    }


    .ring-two{

        width:270px;
        height:270px;

        right:-150px;

        bottom:-90px;
    }

}


/* =====================================================
   SMALL PHONES
===================================================== */

@media(max-width:380px){

    .card{

        width:96%;
    }


    .header{

        padding:
            27px 18px 23px;
    }


    .header .title{

        font-size:19px;
    }


    .stub{

        padding-left:18px;
        padding-right:18px;
    }


    .actions{

        padding-left:18px;
        padding-right:18px;
    }


    .barcode{

        padding-left:18px;
        padding-right:18px;
    }


    .detail-row .info .value{

        font-size:13px;
    }


    .member-id{

        font-size:7px;
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
     SUCCESS CARD
===================================================== -->

<div class="card">


    <!-- HEADER -->

    <div class="header">

        <div class="eyebrow">

            <span>
                Order Ticket
            </span>

            <span>
                Confirmed
            </span>

        </div>


        <div class="check-avatar">
            ✅
        </div>


        <div class="title">

            Order Placed Successfully!

        </div>


        <div class="sub">

            Thank you for your order.
            Your delicious food is being prepared.

        </div>

    </div>


    <!-- DIVIDER -->

    <div class="perf"></div>


    <!-- DETAILS -->

    <div class="stub">


        <!-- ORDER ID -->

        <div class="detail-row">

            <div class="badge">
                🧾
            </div>

            <div class="info">

                <div class="label">
                    Order ID
                </div>

                <div class="value">
                    <%= orderId %>
                </div>

            </div>

        </div>


        <!-- DELIVERY -->

        <div class="detail-row">

            <div class="badge">
                ⏱
            </div>

            <div class="info">

                <div class="label">
                    Estimated Delivery
                </div>

                <div class="value">
                    35 - 45 mins
                </div>

            </div>

        </div>


        <!-- USER -->

        <% if(userName != null){ %>

        <div class="detail-row">

            <div class="badge">
                📍
            </div>

            <div class="info">

                <div class="label">
                    Delivering To
                </div>

                <div class="value">
                    <%= userName %>
                </div>

            </div>

        </div>

        <% } %>


    </div>


    <!-- DIVIDER -->

    <div class="perf"></div>


    <!-- ACTIONS -->

    <div class="actions">


        <a href="orderHistory"
           class="option primary">

            <div class="badge">
                📦
            </div>

            <div class="label">
                View My Orders
            </div>

            <div class="arrow">
                ›
            </div>

        </a>


        <a href="callRestaurantServlet"
           class="option secondary">

            <div class="badge">
                🍽️
            </div>

            <div class="label">
                Order More
            </div>

            <div class="arrow">
                ›
            </div>

        </a>


    </div>


    <!-- BARCODE -->

    <div class="barcode">

        <div class="bars"
             id="bars">
        </div>

        <div class="member-id">
            <%= orderId %>
        </div>

    </div>


</div>


<script>

/* =====================================================
   BARCODE
===================================================== */

var bars =
    document.getElementById("bars");

for(var i = 0; i < 40; i++){

    var b =
        document.createElement("span");

    var h =
        10 + Math.random() * 18;

    b.style.height =
        h + "px";

    bars.appendChild(b);
}

</script>


</body>
</html>