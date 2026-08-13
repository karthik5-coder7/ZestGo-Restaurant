<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo | Login</title>

<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap"
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


/* =========================================================
   MAIN PAGE
========================================================= */

.page{
    min-height:100vh;
    width:100%;

    display:grid;
    grid-template-columns:50% 50%;

    position:relative;
    overflow:hidden;
}


/* =========================================================
   LEFT VISUAL SIDE
========================================================= */

.visual-side{
    position:relative;
    min-height:100vh;
    overflow:hidden;

    background:
        radial-gradient(
            circle at 50% 45%,
            rgba(201,162,75,0.16),
            transparent 28%
        ),
        radial-gradient(
            circle at 20% 20%,
            rgba(228,87,46,0.13),
            transparent 30%
        ),
        linear-gradient(
            145deg,
            #061214 0%,
            #0b2225 45%,
            #071416 100%
        );
}


/* Ambient glow */

.visual-side::before{
    content:"";

    position:absolute;

    width:500px;
    height:500px;

    left:50%;
    top:45%;

    transform:translate(-50%,-50%);

    background:
        radial-gradient(
            circle,
            rgba(201,162,75,0.18),
            rgba(201,162,75,0.05) 35%,
            transparent 70%
        );

    filter:blur(20px);

    animation:ambientPulse 5s ease-in-out infinite;

    pointer-events:none;
}

@keyframes ambientPulse{

    0%,
    100%{
        transform:
            translate(-50%,-50%)
            scale(.9);

        opacity:.6;
    }

    50%{
        transform:
            translate(-50%,-50%)
            scale(1.12);

        opacity:1;
    }
}


/* =========================================================
   BRAND
========================================================= */

.brand{
    position:absolute;

    top:42px;
    left:48px;

    display:flex;
    align-items:center;

    gap:12px;

    z-index:20;
}

.brand-mark{
    width:42px;
    height:42px;

    border-radius:12px;

    display:flex;
    align-items:center;
    justify-content:center;

    background:
        linear-gradient(
            135deg,
            #d9b45c,
            #a67d2f
        );

    color:#081719;

    font-family:'Space Grotesk',sans-serif;

    font-weight:800;
    font-size:14px;

    box-shadow:
        0 8px 30px rgba(201,162,75,.2);
}

.brand-name{
    font-family:'Space Grotesk',sans-serif;

    font-size:20px;
    font-weight:700;

    letter-spacing:.04em;
}


/* =========================================================
   LEFT TEXT
========================================================= */

.visual-copy{
    position:absolute;

    left:48px;
    bottom:50px;

    z-index:15;

    max-width:430px;
}

.visual-copy .mini{
    color:#c9a24b;

    font-family:'Space Grotesk',sans-serif;

    font-size:11px;
    font-weight:600;

    letter-spacing:.22em;

    text-transform:uppercase;

    margin-bottom:14px;
}

.visual-copy h1{
    font-family:'Space Grotesk',sans-serif;

    font-size:clamp(34px,4vw,58px);

    line-height:1.02;

    letter-spacing:-.045em;

    font-weight:700;

    color:#f5efe3;
}

.visual-copy h1 span{
    color:#c9a24b;
}

.visual-copy p{
    margin-top:16px;

    max-width:370px;

    color:rgba(245,239,227,.52);

    font-size:14px;

    line-height:1.7;
}


/* =========================================================
   3D STAGE
========================================================= */

.stage{
    position:absolute;

    width:430px;
    height:430px;

    left:50%;
    top:48%;

    transform:
        translate(-50%,-50%)
        perspective(1000px);

    transform-style:preserve-3d;
}


/* =========================================================
   ORBIT RINGS
========================================================= */

.orbit{
    position:absolute;

    left:50%;
    top:50%;

    border:1px solid rgba(201,162,75,.28);

    border-radius:50%;

    transform-style:preserve-3d;

    pointer-events:none;
}

.orbit.one{
    width:360px;
    height:145px;

    transform:
        translate(-50%,-50%)
        rotateX(65deg)
        rotateZ(-12deg);

    animation:orbitSpin 12s linear infinite;
}

.orbit.two{
    width:300px;
    height:120px;

    transform:
        translate(-50%,-50%)
        rotateX(68deg)
        rotateZ(45deg);

    border-color:rgba(228,87,46,.22);

    animation:orbitSpinReverse 16s linear infinite;
}

.orbit.three{
    width:230px;
    height:92px;

    transform:
        translate(-50%,-50%)
        rotateX(72deg)
        rotateZ(-30deg);

    border-color:rgba(245,239,227,.12);

    animation:orbitSpin 20s linear infinite;
}

@keyframes orbitSpin{

    from{
        transform:
            translate(-50%,-50%)
            rotateX(65deg)
            rotateZ(0deg);
    }

    to{
        transform:
            translate(-50%,-50%)
            rotateX(65deg)
            rotateZ(360deg);
    }
}

@keyframes orbitSpinReverse{

    from{
        transform:
            translate(-50%,-50%)
            rotateX(68deg)
            rotateZ(360deg);
    }

    to{
        transform:
            translate(-50%,-50%)
            rotateX(68deg)
            rotateZ(0deg);
    }
}


/* =========================================================
   CENTRAL PLATE
========================================================= */

.plate{
    position:absolute;

    left:50%;
    top:55%;

    width:220px;
    height:220px;

    transform:
        translate(-50%,-50%)
        rotateX(62deg)
        rotateZ(-8deg);

    border-radius:50%;

    background:
        radial-gradient(
            circle at 35% 30%,
            #f2d99b,
            #c49b46 38%,
            #6c4b1e 70%,
            #251a0b 100%
        );

    box-shadow:
        0 35px 60px rgba(0,0,0,.55),
        0 0 40px rgba(201,162,75,.12);

    animation:plateFloat 4s ease-in-out infinite;
}

@keyframes plateFloat{

    0%,
    100%{
        transform:
            translate(-50%,-50%)
            rotateX(62deg)
            rotateZ(-8deg)
            translateZ(0);
    }

    50%{
        transform:
            translate(-50%,-50%)
            rotateX(62deg)
            rotateZ(-8deg)
            translateZ(18px);
    }
}

.plate::before{
    content:"";

    position:absolute;

    width:178px;
    height:178px;

    left:21px;
    top:21px;

    border-radius:50%;

    background:
        radial-gradient(
            circle at 40% 30%,
            #fff4d4,
            #e4d3aa 55%,
            #b99b65 100%
        );

    box-shadow:
        inset 0 0 20px rgba(0,0,0,.18);
}


/* =========================================================
   BURGER
========================================================= */

.food{
    position:absolute;

    left:50%;
    top:49%;

    width:105px;
    height:75px;

    transform:
        translate(-50%,-50%)
        translateZ(45px);

    z-index:5;

    animation:foodFloat 3.8s ease-in-out infinite;
}

@keyframes foodFloat{

    0%,
    100%{
        transform:
            translate(-50%,-50%)
            translateZ(45px)
            rotateZ(-2deg);
    }

    50%{
        transform:
            translate(-50%,-50%)
            translateZ(75px)
            rotateZ(3deg);
    }
}

.bun-top{
    position:absolute;

    left:5px;
    top:0;

    width:95px;
    height:42px;

    border-radius:
        55px 55px 20px 20px;

    background:
        linear-gradient(
            145deg,
            #f0c56b,
            #c27b29
        );

    box-shadow:
        inset 0 -8px 0 rgba(94,48,12,.2),
        0 12px 18px rgba(0,0,0,.3);
}

.bun-top::before{
    content:"•  •   •  •   •";

    position:absolute;

    width:100%;

    top:10px;
    left:0;

    text-align:center;

    color:#ffe6a7;

    font-size:14px;

    letter-spacing:5px;
}

.food::before{
    content:"";

    position:absolute;

    left:3px;
    top:43px;

    width:100px;
    height:16px;

    border-radius:5px;

    background:
        linear-gradient(
            180deg,
            #6d2415,
            #35130e
        );

    box-shadow:
        0 5px 0 #d9a23e;
}

.food::after{
    content:"";

    position:absolute;

    left:8px;
    top:36px;

    width:90px;
    height:12px;

    border-radius:50%;

    background:#527c42;

    z-index:3;
}


/* =========================================================
   FLOATING FOOD CARDS
========================================================= */

.food-card{
    position:absolute;

    width:92px;
    height:92px;

    border-radius:24px;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:42px;

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,.12),
            rgba(255,255,255,.025)
        );

    border:1px solid rgba(255,255,255,.13);

    box-shadow:
        0 25px 50px rgba(0,0,0,.35),
        inset 0 1px 0 rgba(255,255,255,.12);

    backdrop-filter:blur(14px);

    z-index:10;
}

.food-card.one{
    left:7%;
    top:26%;

    animation:cardOne 5s ease-in-out infinite;
}

.food-card.two{
    right:6%;
    top:23%;

    animation:cardTwo 6s ease-in-out infinite;
}

.food-card.three{
    right:9%;
    bottom:24%;

    animation:cardThree 5.5s ease-in-out infinite;
}

@keyframes cardOne{

    0%,
    100%{
        transform:
            translateY(0)
            rotate(-8deg)
            translateZ(20px);
    }

    50%{
        transform:
            translateY(-20px)
            rotate(5deg)
            translateZ(60px);
    }
}

@keyframes cardTwo{

    0%,
    100%{
        transform:
            translateY(0)
            rotate(8deg);
    }

    50%{
        transform:
            translateY(-26px)
            rotate(-5deg);
    }
}

@keyframes cardThree{

    0%,
    100%{
        transform:
            translateY(0)
            rotate(6deg);
    }

    50%{
        transform:
            translateY(-18px)
            rotate(-7deg);
    }
}


/* =========================================================
   PARTICLES
========================================================= */

.particle{
    position:absolute;

    width:5px;
    height:5px;

    border-radius:50%;

    background:#c9a24b;

    box-shadow:
        0 0 15px rgba(201,162,75,.8);

    animation:
        particleFloat 5s ease-in-out infinite;
}

.p1{
    left:18%;
    top:45%;
}

.p2{
    left:75%;
    top:40%;
    animation-delay:1s;
}

.p3{
    left:35%;
    top:27%;
    animation-delay:2s;
}

.p4{
    left:68%;
    top:67%;
    animation-delay:3s;
}

.p5{
    left:50%;
    top:18%;
    animation-delay:1.5s;
}

@keyframes particleFloat{

    0%,
    100%{
        transform:translateY(0);
        opacity:.3;
    }

    50%{
        transform:translateY(-25px);
        opacity:1;
    }
}


/* =========================================================
   RIGHT LOGIN SIDE
========================================================= */

.login-side{
    min-height:100vh;

    display:flex;
    align-items:center;
    justify-content:center;

    position:relative;

    background:
        radial-gradient(
            circle at 80% 20%,
            rgba(201,162,75,.07),
            transparent 30%
        ),
        linear-gradient(
            145deg,
            #0b1d20,
            #081416
        );

    padding:40px;
}


/* Divider */

.login-side::before{
    content:"";

    position:absolute;

    left:0;
    top:10%;

    width:1px;
    height:80%;

    background:
        linear-gradient(
            transparent,
            rgba(201,162,75,.45),
            transparent
        );
}


/* =========================================================
   LOGIN CARD
========================================================= */

.login-container{
    position:relative;

    width:440px;
    max-width:100%;

    padding:48px 44px 38px;

    border-radius:28px;

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,.075),
            rgba(255,255,255,.025)
        );

    border:1px solid rgba(255,255,255,.10);

    box-shadow:
        0 40px 100px rgba(0,0,0,.55),
        inset 0 1px 0 rgba(255,255,255,.08);

    backdrop-filter:blur(25px);

    animation:loginAppear .8s ease both;
}

@keyframes loginAppear{

    from{
        opacity:0;

        transform:
            translateY(25px)
            scale(.97);
    }

    to{
        opacity:1;

        transform:
            translateY(0)
            scale(1);
    }
}


/* Gold top line */

.login-container::before{
    content:"";

    position:absolute;

    top:-1px;
    right:45px;

    width:90px;
    height:2px;

    background:
        linear-gradient(
            90deg,
            transparent,
            #c9a24b,
            transparent
        );

    box-shadow:
        0 0 20px rgba(201,162,75,.5);
}


/* =========================================================
   LOGIN HEADER
========================================================= */

.login-header{
    text-align:center;

    margin-bottom:34px;
}

.emblem{
    width:62px;
    height:62px;

    margin:0 auto 20px;

    border-radius:19px;

    display:flex;
    align-items:center;
    justify-content:center;

    font-family:'Space Grotesk',sans-serif;

    font-weight:800;
    font-size:17px;

    color:#091618;

    background:
        linear-gradient(
            135deg,
            #e1c16d,
            #a87c2c
        );

    box-shadow:
        0 15px 35px rgba(201,162,75,.22);

    transform:rotate(-3deg);

    transition:.4s;
}

.login-container:hover .emblem{
    transform:
        rotate(0deg)
        scale(1.05);
}

.eyebrow{
    display:block;

    font-family:'Space Grotesk',sans-serif;

    color:#c9a24b;

    font-size:10px;
    font-weight:600;

    letter-spacing:.22em;

    text-transform:uppercase;

    margin-bottom:9px;
}

.login-container h2{
    color:#f7f1e5;

    font-family:'Space Grotesk',sans-serif;

    font-size:32px;

    letter-spacing:-.04em;

    margin-bottom:8px;
}

.subtext{
    color:rgba(245,239,227,.45);

    font-size:13px;

    line-height:1.6;
}


/* =========================================================
   INPUTS
========================================================= */

.input-group{
    margin-bottom:21px;
}

.input-group label{
    display:block;

    margin-bottom:9px;

    color:rgba(245,239,227,.68);

    font-size:11px;
    font-weight:600;

    letter-spacing:.12em;

    text-transform:uppercase;
}

.input-group input{
    width:100%;

    padding:16px 17px;

    border-radius:13px;

    border:1px solid rgba(255,255,255,.09);

    background:
        rgba(255,255,255,.045);

    color:#f5efe3;

    font-family:'DM Sans',sans-serif;

    font-size:15px;

    outline:none;

    transition:
        border-color .3s,
        background .3s,
        box-shadow .3s,
        transform .3s;
}

.input-group input::placeholder{
    color:rgba(245,239,227,.25);
}

.input-group input:hover{
    background:
        rgba(255,255,255,.06);
}

.input-group input:focus{
    border-color:
        rgba(201,162,75,.75);

    background:
        rgba(201,162,75,.055);

    box-shadow:
        0 0 0 4px rgba(201,162,75,.07),
        0 10px 30px rgba(0,0,0,.15);

    transform:
        translateY(-1px);
}


/* Prevent Chrome autofill */

.input-group input:-webkit-autofill,
.input-group input:-webkit-autofill:hover,
.input-group input:-webkit-autofill:focus,
.input-group input:-webkit-autofill:active{

    -webkit-text-fill-color:#f5efe3 !important;

    -webkit-box-shadow:
        0 0 0 1000px #102326 inset !important;

    box-shadow:
        0 0 0 1000px #102326 inset !important;

    transition:
        background-color 9999s ease-in-out 0s;
}


/* =========================================================
   BUTTON
========================================================= */

button{
    width:100%;

    padding:16px;

    border:none;

    border-radius:13px;

    cursor:pointer;

    color:#0a1718;

    font-family:'Space Grotesk',sans-serif;

    font-size:14px;
    font-weight:700;

    letter-spacing:.04em;

    background:
        linear-gradient(
            135deg,
            #e0bd67,
            #b98b36
        );

    box-shadow:
        0 15px 35px rgba(201,162,75,.16);

    transition:
        transform .25s,
        box-shadow .25s,
        filter .25s;
}

button:hover{
    transform:
        translateY(-3px);

    box-shadow:
        0 20px 40px rgba(201,162,75,.28);

    filter:
        brightness(1.06);
}

button:active{
    transform:
        translateY(-1px);
}


/* =========================================================
   REGISTER
========================================================= */

.register-link{
    margin-top:24px;

    text-align:center;

    color:rgba(245,239,227,.38);

    font-size:13px;
}

.register-link a{
    color:#c9a24b;

    text-decoration:none;

    font-weight:600;

    margin-left:3px;

    transition:.2s;
}

.register-link a:hover{
    color:#f5efe3;
}


/* =========================================================
   FOOTER
========================================================= */

.mrz{
    margin-top:28px;

    padding-top:18px;

    border-top:
        1px solid rgba(255,255,255,.07);

    text-align:center;

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9px;

    letter-spacing:.16em;

    color:
        rgba(245,239,227,.19);
}


/* =========================================================
   MOBILE
========================================================= */

@media(max-width:900px){

    .page{
        grid-template-columns:1fr;
    }

    .visual-side{
        min-height:480px;
        height:480px;
    }

    .login-side{
        min-height:auto;

        padding:
            45px 20px 60px;
    }

    .login-side::before{
        display:none;
    }

    .stage{
        width:350px;
        height:350px;

        top:50%;
    }

    .plate{
        width:180px;
        height:180px;
    }

    .plate::before{
        width:145px;
        height:145px;

        left:17px;
        top:17px;
    }

    .food-card{
        width:70px;
        height:70px;

        font-size:31px;

        border-radius:18px;
    }

    .visual-copy{
        left:25px;
        bottom:25px;

        max-width:330px;
    }

    .visual-copy h1{
        font-size:35px;
    }

    .visual-copy p{
        display:none;
    }

    .brand{
        top:22px;
        left:25px;
    }

    .login-container{
        width:440px;
    }
}


@media(max-width:500px){

    .visual-side{
        min-height:420px;
        height:420px;
    }

    .stage{
        transform:
            translate(-50%,-50%)
            scale(.78);
    }

    .login-side{
        padding:
            30px 15px 45px;
    }

    .login-container{
        padding:
            38px 25px 30px;

        border-radius:22px;
    }

    .login-container h2{
        font-size:28px;
    }

    .brand-name{
        font-size:18px;
    }

    .visual-copy h1{
        font-size:31px;
    }
}

</style>

</head>

<body>

<div class="page">


<!-- =====================================================
     LEFT 3D RESTAURANT SIDE
====================================================== -->

<section class="visual-side">


    <!-- BRAND -->

    <div class="brand">

        <div class="brand-mark">
            ZG
        </div>

        <div class="brand-name">
            ZestGo
        </div>

    </div>


    <!-- PARTICLES -->

    <div class="particle p1"></div>
    <div class="particle p2"></div>
    <div class="particle p3"></div>
    <div class="particle p4"></div>
    <div class="particle p5"></div>


    <!-- 3D STAGE -->

    <div class="stage">

        <div class="orbit one"></div>

        <div class="orbit two"></div>

        <div class="orbit three"></div>


        <!-- PLATE -->

        <div class="plate"></div>


        <!-- BURGER -->

        <div class="food">

            <div class="bun-top"></div>

        </div>


        <!-- FLOATING FOOD -->

        <div class="food-card one">
            🍕
        </div>

        <div class="food-card two">
            🍜
        </div>

        <div class="food-card three">
            🥤
        </div>

    </div>


    <!-- LEFT TEXT -->

    <div class="visual-copy">

        <div class="mini">
            Your table awaits
        </div>

        <h1>
            Taste the
            <br>
            <span>extraordinary.</span>
        </h1>

        <p>
            Discover restaurants, explore delicious dishes
            and enjoy every moment with ZestGo.
        </p>

    </div>

</section>



<!-- =====================================================
     RIGHT LOGIN SIDE
====================================================== -->

<section class="login-side">


    <div class="login-container">


        <!-- LOGIN HEADER -->

        <div class="login-header">

            <div class="emblem">
                ZG
            </div>

            <span class="eyebrow">
                Passport Control
            </span>

            <h2>
                Welcome back
            </h2>

            <p class="subtext">
                Sign in to continue your ZestGo journey.
            </p>

        </div>


        <!-- LOGIN FORM -->

        <form
            action="callLoginServlet"
            method="post"
            autocomplete="off"
            id="loginForm"
            novalidate>


            <!-- EMAIL -->

            <div class="input-group">

                <label for="loginEmail">
                    Email
                </label>

                <input
                    type="email"
                    id="loginEmail"
                    name="email"
                    placeholder="Enter your email"
                    value=""
                    autocomplete="off"
                    readonly
                    required>

            </div>


            <!-- PASSWORD -->

            <div class="input-group">

                <label for="loginPassword">
                    Password
                </label>

                <input
                    type="password"
                    id="loginPassword"
                    name="password"
                    placeholder="Enter your password"
                    value=""
                    autocomplete="new-password"
                    readonly
                    required>

            </div>


            <!-- LOGIN BUTTON -->

            <button type="submit">
                Enter ZestGo
            </button>

        </form>


        <!-- REGISTER -->

        <div class="register-link">

            <p>

                Don't have an account?

                <!-- FIXED REGISTER LINK -->

                <a href="${pageContext.request.contextPath}/register.jsp">
                    Create one
                </a>

            </p>

        </div>


        <!-- FOOTER -->

        <div class="mrz">
            ZESTGO · SECURE DINING EXPERIENCE
        </div>


    </div>

</section>

</div>



<!-- =====================================================
     LOGIN FIELD PROTECTION
====================================================== -->

<script>

(function(){

    const email =
        document.getElementById("loginEmail");

    const password =
        document.getElementById("loginPassword");

    const form =
        document.getElementById("loginForm");


    /*
     * Clear both fields
     */

    function clearLoginFields(){

        if(email){
            email.value = "";
        }

        if(password){
            password.value = "";
        }

    }


    /*
     * Page opens completely empty
     */

    clearLoginFields();


    /*
     * Prevent browser autofill initially
     */

    if(email){
        email.readOnly = true;
    }

    if(password){
        password.readOnly = true;
    }


    /*
     * Allow typing when user clicks Email
     */

    if(email){

        email.addEventListener(
            "focus",
            function(){

                this.readOnly = false;

            }
        );

    }


    /*
     * Allow typing when user clicks Password
     */

    if(password){

        password.addEventListener(
            "focus",
            function(){

                this.readOnly = false;

            }
        );

    }


    /*
     * Handle browser Back/Forward cache
     */

    window.addEventListener(
        "pageshow",
        function(){

            clearLoginFields();

            if(email){
                email.readOnly = true;
            }

            if(password){
                password.readOnly = true;
            }

        }
    );


    /*
     * Chrome may autofill shortly after page load.
     * Clear fields again.
     */

    document.addEventListener(
        "DOMContentLoaded",
        function(){

            clearLoginFields();

            setTimeout(
                clearLoginFields,
                100
            );

            setTimeout(
                clearLoginFields,
                500
            );

            setTimeout(
                clearLoginFields,
                1500
            );

        }
    );


    /*
     * Before submitting, allow actual values
     * to be sent normally.
     */

    if(form){

        form.addEventListener(
            "submit",
            function(){

                if(email){
                    email.readOnly = false;
                }

                if(password){
                    password.readOnly = false;
                }

            }
        );

    }

})();

</script>

</body>
</html>