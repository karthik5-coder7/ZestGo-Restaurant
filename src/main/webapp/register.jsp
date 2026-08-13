<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo - Create Account</title>

<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap"
      rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

<style>

/* ================= RESET ================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Space Grotesk',sans-serif;
}

/* ================= COLORS ================= */

:root{
    --ink:#0F2A2E;
    --teal:#123B3F;
    --teal-light:#1a4b50;
    --gold:#C9A24B;
    --gold-light:#e0b862;
    --coral:#E4572E;
    --green:#3FAE6C;
    --paper:#EFE9DC;
    --line:rgba(239,233,220,0.18);
}

/* ================= BODY ================= */

html,
body{
    width:100%;
    min-height:100%;
    margin:0;
    padding:0;
}

body{
    min-height:100vh;

    background:
        linear-gradient(
            135deg,
            #081719 0%,
            #0F2A2E 50%,
            #1a4b50 100%
        );

    color:var(--paper);

    overflow-x:hidden;
}

/* ================= 3D BACKGROUND ================= */

#canvas3d{
    position:fixed;
    top:0;
    left:0;

    width:100%;
    height:100vh;

    z-index:0;

    pointer-events:none;
}

.background-overlay{
    position:fixed;
    inset:0;

    background:
        radial-gradient(
            circle at 50% 40%,
            rgba(201,162,75,0.07),
            transparent 45%
        );

    pointer-events:none;

    z-index:1;
}

/* ================= NAVBAR ================= */

.navbar{
    width:100%;

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:18px 70px;

    background:
        rgba(15,42,46,0.80);

    backdrop-filter:blur(18px);
    -webkit-backdrop-filter:blur(18px);

    border-bottom:
        1px solid rgba(201,162,75,0.28);

    position:relative;

    z-index:100;
}

.logo{
    font-size:32px;
    font-weight:800;

    text-decoration:none;

    background:
        linear-gradient(
            135deg,
            var(--gold),
            var(--coral)
        );

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;

    background-clip:text;

    letter-spacing:-0.02em;
}

.nav-links{
    display:flex;
    gap:10px;
    align-items:center;
}

.nav-links a{
    text-decoration:none;

    color:
        rgba(239,233,220,0.75);

    font-size:14px;
    font-weight:600;

    padding:9px 14px;

    border-radius:8px;

    transition:
        0.25s ease;
}

.nav-links a:hover{
    color:var(--gold);

    background:
        rgba(201,162,75,0.10);

    transform:
        translateY(-2px);
}

/* ================= REGISTER SECTION ================= */

.register-section{

    min-height:
        calc(100vh - 80px);

    display:flex;

    justify-content:center;
    align-items:center;

    padding:45px 20px;

    position:relative;

    z-index:5;
}

/* ================= CARD ================= */

.register-card{

    position:relative;

    width:470px;
    max-width:100%;

    border-radius:24px;

    background:
        rgba(18,59,63,0.94);

    backdrop-filter:blur(22px);
    -webkit-backdrop-filter:blur(22px);

    border:
        2px solid rgba(201,162,75,0.30);

    box-shadow:

        0 30px 80px
        rgba(0,0,0,0.55),

        0 0 50px
        rgba(201,162,75,0.08);

    overflow:hidden;

    color:var(--paper);

    animation:
        cardIn .8s ease-out;

    transition:
        transform .4s ease,
        box-shadow .4s ease;
}

.register-card:hover{

    transform:
        translateY(-5px);

    box-shadow:

        0 45px 100px
        rgba(0,0,0,0.65),

        0 0 60px
        rgba(201,162,75,0.15);
}

/* ================= INNER BORDER ================= */

.register-card::before{

    content:"";

    position:absolute;

    inset:11px;

    border:
        1px dashed
        rgba(201,162,75,0.28);

    border-radius:15px;

    pointer-events:none;

    z-index:10;
}

/* ================= CARD ANIMATION ================= */

@keyframes cardIn{

    from{
        opacity:0;

        transform:
            translateY(50px)
            scale(.95);
    }

    to{
        opacity:1;

        transform:
            translateY(0)
            scale(1);
    }
}

/* ================= HEADER ================= */

.register-header{

    position:relative;

    z-index:5;

    padding:
        34px 38px 28px;

    text-align:center;

    background:
        linear-gradient(
            180deg,
            rgba(255,255,255,.035),
            rgba(0,0,0,.15)
        );

    border-bottom:
        1px solid
        rgba(201,162,75,.18);
}

/* ================= SEAL ================= */

.register-seal{

    width:68px;
    height:68px;

    margin:
        0 auto 18px;

    border-radius:50%;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:27px;

    color:var(--ink);

    background:
        conic-gradient(
            from 210deg,
            var(--coral),
            var(--gold),
            var(--coral)
        );

    box-shadow:

        0 0 0 4px
        rgba(239,233,220,.08),

        0 15px 35px
        rgba(228,87,46,.25);

    animation:
        sealFloat 4s ease-in-out infinite;
}

@keyframes sealFloat{

    0%,100%{
        transform:
            translateY(0)
            rotate(0deg);
    }

    50%{
        transform:
            translateY(-6px)
            rotate(4deg);
    }
}

/* ================= TEXT ================= */

.eyebrow{

    display:block;

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    font-weight:700;

    letter-spacing:.16em;

    text-transform:uppercase;

    color:var(--gold);

    margin-bottom:7px;
}

.register-header h1{

    font-size:27px;

    font-weight:800;

    color:var(--paper);

    margin-bottom:7px;
}

.subtitle{

    color:
        rgba(239,233,220,.55);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10.5px;

    line-height:1.5;
}

/* ================= FORM ================= */

.register-form{

    position:relative;

    z-index:5;

    padding:
        25px 38px 28px;
}

.form-group{

    margin-bottom:17px;
}

.form-group label{

    display:block;

    margin-bottom:7px;

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    font-weight:700;

    letter-spacing:.08em;

    text-transform:uppercase;

    color:
        rgba(239,233,220,.65);
}

/* ================= INPUTS ================= */

.form-group input{

    width:100%;

    padding:13px 15px;

    border-radius:10px;

    border:
        1px solid
        rgba(239,233,220,.14);

    background:
        rgba(239,233,220,.055);

    color:var(--paper);

    font-size:14px;

    outline:none;

    transition:
        border .25s ease,
        background .25s ease,
        box-shadow .25s ease,
        transform .25s ease;
}

.form-group input::placeholder{

    color:
        rgba(239,233,220,.30);
}

.form-group input:focus{

    border-color:
        var(--gold);

    background:
        rgba(239,233,220,.09);

    box-shadow:
        0 0 0 3px
        rgba(201,162,75,.08);

    transform:
        translateY(-1px);
}

/* ================= TEXTAREA ================= */

.form-group textarea{

    width:100%;

    min-height:85px;

    resize:vertical;

    padding:13px 15px;

    border-radius:10px;

    border:
        1px solid
        rgba(239,233,220,.14);

    background:
        rgba(239,233,220,.055);

    color:var(--paper);

    font-size:14px;

    outline:none;

    transition:.25s;
}

.form-group textarea::placeholder{

    color:
        rgba(239,233,220,.30);
}

.form-group textarea:focus{

    border-color:
        var(--gold);

    background:
        rgba(239,233,220,.09);

    box-shadow:
        0 0 0 3px
        rgba(201,162,75,.08);
}

/* ================= AUTOFILL ================= */

.form-group input:-webkit-autofill,
.form-group input:-webkit-autofill:hover,
.form-group input:-webkit-autofill:focus{

    -webkit-text-fill-color:
        var(--paper);

    transition:
        background-color
        5000s ease-in-out 0s;
}

/* ================= PASSWORD STRENGTH ================= */

.strength{

    display:flex;

    gap:4px;

    margin-top:8px;

    height:4px;
}

.strength span{

    flex:1;

    border-radius:3px;

    background:
        rgba(239,233,220,.10);

    transition:
        background .25s ease;
}

.strength-label{

    margin-top:5px;

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9px;

    color:
        rgba(239,233,220,.35);

    text-transform:uppercase;

    letter-spacing:.05em;
}

/* ================= ERROR MESSAGE ================= */

.message{

    margin-bottom:18px;

    padding:12px 14px;

    border-radius:10px;

    background:
        rgba(228,87,46,.12);

    border:
        1px solid
        rgba(228,87,46,.35);

    color:
        #ff9b7f;

    font-size:13px;

    text-align:center;
}

/* ================= REGISTER BUTTON ================= */

.register-btn{

    width:100%;

    margin-top:5px;

    padding:14px;

    border:none;

    border-radius:10px;

    cursor:pointer;

    font-size:15px;

    font-weight:700;

    color:var(--ink);

    background:
        linear-gradient(
            135deg,
            var(--gold),
            var(--gold-light)
        );

    transition:
        transform .25s ease,
        box-shadow .25s ease;
}

.register-btn:hover{

    transform:
        translateY(-2px);

    box-shadow:
        0 14px 30px
        rgba(201,162,75,.35);
}

.register-btn:active{

    transform:
        translateY(0);
}

/* ================= LOGIN LINK ================= */

.login-link{

    text-align:center;

    margin-top:20px;

    font-size:13px;

    color:
        rgba(239,233,220,.45);
}

.login-link a{

    color:var(--gold);

    text-decoration:none;

    font-weight:700;

    margin-left:4px;

    transition:.2s;
}

.login-link a:hover{

    color:var(--paper);
}

/* ================= BARCODE ================= */

.barcode{

    position:relative;

    z-index:5;

    padding:
        18px 38px 25px;

    display:flex;

    justify-content:space-between;

    align-items:center;

    gap:20px;

    border-top:
        1px solid
        rgba(201,162,75,.15);

    background:
        rgba(15,42,46,.35);
}

.bars{

    height:26px;

    display:flex;

    align-items:flex-end;

    gap:2px;

    opacity:.6;
}

.bars span{

    display:block;

    width:2px;

    background:
        rgba(239,233,220,.6);
}

.member-id{

    color:
        rgba(239,233,220,.35);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:8px;

    letter-spacing:.08em;

    white-space:nowrap;
}

/* ================= MOBILE ================= */

@media(max-width:768px){

    .navbar{

        padding:
            15px 20px;

        flex-direction:column;

        gap:12px;
    }

    .logo{

        font-size:27px;
    }

    .nav-links{

        gap:7px;

        flex-wrap:wrap;

        justify-content:center;
    }

    .nav-links a{

        font-size:12px;

        padding:
            6px 8px;
    }

    .register-section{

        min-height:
            calc(100vh - 115px);

        padding:
            25px 12px;
    }

    .register-card{

        width:100%;

        max-width:470px;

        border-radius:20px;
    }

    .register-header{

        padding:
            28px 24px 24px;
    }

    .register-form{

        padding:
            22px 24px 25px;
    }

    .register-header h1{

        font-size:23px;
    }

    .register-seal{

        width:60px;
        height:60px;

        font-size:24px;
    }

    .barcode{

        padding:
            16px 24px 22px;
    }
}

/* ================= SMALL PHONES ================= */

@media(max-width:390px){

    .navbar{

        padding:
            12px 10px;
    }

    .logo{

        font-size:24px;
    }

    .nav-links{

        gap:5px;
    }

    .nav-links a{

        font-size:11px;
    }

    .register-section{

        padding:
            18px 8px;
    }

    .register-header{

        padding:
            25px 18px 22px;
    }

    .register-form{

        padding:
            20px 18px 22px;
    }

    .form-group input,
    .form-group textarea{

        padding:
            12px 13px;

        font-size:13px;
    }

    .register-btn{

        padding:13px;
    }

    .member-id{

        font-size:7px;
    }
}

/* ================= REDUCED MOTION ================= */

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

<!-- ================= 3D BACKGROUND ================= -->

<canvas id="canvas3d"></canvas>

<div class="background-overlay"></div>


<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <a href="callRestaurantServlet"
       class="logo">
        ZestGo
    </a>

    <div class="nav-links">

        <a href="callRestaurantServlet">
            Home
        </a>

        <a href="callRestaurantServlet">
            Restaurants
        </a>

        <a href="login.jsp">
            Login
        </a>

    </div>

</nav>


<!-- ================= REGISTER ================= -->

<section class="register-section">

<div class="register-card">

    <!-- HEADER -->

    <div class="register-header">

        <div class="register-seal">
            ✦
        </div>

        <span class="eyebrow">
            New Member
        </span>

        <h1>
            Create Your Account
        </h1>

        <p class="subtitle">
            Join ZestGo and discover your next favorite meal
        </p>

    </div>


    <!-- FORM -->

    <form class="register-form"
          action="register"
          method="post"
          autocomplete="off">

        <%
        String msg =
            (String)request.getAttribute("msg");

        if(msg != null){
        %>

        <div class="message">
            <%= msg %>
        </div>

        <%
        }
        %>


        <!-- NAME -->

        <div class="form-group">

            <label for="name">
                Full Name
            </label>

            <input
                type="text"
                id="name"
                name="name"
                placeholder="Enter your full name"
                autocomplete="name"
                required>

        </div>


        <!-- EMAIL -->

        <div class="form-group">

            <label for="email">
                Email
            </label>

            <input
                type="email"
                id="email"
                name="email"
                placeholder="Enter your email"
                autocomplete="email"
                required>

        </div>


        <!-- ADDRESS -->

        <div class="form-group">

            <label for="address">
                Address
            </label>

            <textarea
                id="address"
                name="address"
                placeholder="Enter your complete address"
                required></textarea>

        </div>


        <!-- PASSWORD -->

        <div class="form-group">

            <label for="password">
                Password
            </label>

            <input
                type="password"
                id="password"
                name="password"
                placeholder="Create a password"
                autocomplete="new-password"
                required>

            <div class="strength"
                 id="strengthBars">

                <span></span>
                <span></span>
                <span></span>
                <span></span>

            </div>

            <div class="strength-label"
                 id="strengthLabel">

                Enter a password

            </div>

        </div>


        <!-- CONFIRM PASSWORD -->

        <div class="form-group">

            <label for="confirmPassword">
                Confirm Password
            </label>

            <input
                type="password"
                id="confirmPassword"
                name="confirmPassword"
                placeholder="Confirm your password"
                autocomplete="new-password"
                required>

        </div>


        <!-- ROLE -->

        <input type="hidden"
               name="role"
               value="user">


        <!-- CREATE ACCOUNT -->

        <button
            type="submit"
            class="register-btn">

            Create Account

        </button>


        <!-- LOGIN -->

        <div class="login-link">

            Already have an account?

            <a href="login.jsp">
                Login
            </a>

        </div>

    </form>


    <!-- BARCODE -->

    <div class="barcode">

        <div class="bars"
             id="bars">
        </div>

        <div class="member-id">
            ZESTGO · NEW MEMBER
        </div>

    </div>

</div>

</section>


<script>

/* =====================================================
   PASSWORD STRENGTH
===================================================== */

var password =
    document.getElementById("password");

var bars =
    document.querySelectorAll(
        "#strengthBars span"
    );

var strengthLabel =
    document.getElementById(
        "strengthLabel"
    );

var colors = [
    "#E4572E",
    "#E4572E",
    "#C9A24B",
    "#3FAE6C"
];

var labels = [
    "Weak",
    "Weak",
    "Getting Better",
    "Strong"
];

password.addEventListener(
    "input",
    function(){

        var value =
            password.value;

        var score = 0;

        if(value.length >= 6)
            score++;

        if(value.length >= 10)
            score++;

        if(
            /[A-Z]/.test(value) &&
            /[0-9]/.test(value)
        )
            score++;

        if(
            /[^A-Za-z0-9]/.test(value)
        )
            score++;

        bars.forEach(
            function(bar,index){

                bar.style.background =
                    index < score
                    ? colors[score - 1]
                    : "rgba(239,233,220,.10)";
            }
        );

        if(value.length === 0){

            strengthLabel.textContent =
                "Enter a password";

        }
        else{

            strengthLabel.textContent =
                labels[score - 1] ||
                "Weak";
        }

    }
);


/* =====================================================
   PASSWORD MATCH
===================================================== */

var confirmPassword =
    document.getElementById(
        "confirmPassword"
    );

confirmPassword.addEventListener(
    "input",
    function(){

        if(
            confirmPassword.value !==
            password.value
        ){

            confirmPassword.style.borderColor =
                "#E4572E";

        }
        else{

            confirmPassword.style.borderColor =
                "#3FAE6C";
        }

    }
);


/* =====================================================
   BARCODE
===================================================== */

var barsContainer =
    document.getElementById("bars");

for(
    var i = 0;
    i < 40;
    i++
){

    var bar =
        document.createElement("span");

    var height =
        8 + Math.random() * 19;

    bar.style.height =
        height + "px";

    barsContainer.appendChild(bar);
}


/* =====================================================
   THREE.JS 3D BACKGROUND
===================================================== */

var scene;
var camera;
var renderer;

var particles;
var torus;

var floatingObjects = [];

var mouseX = 0;
var mouseY = 0;

var clock = 0;


/* INITIALIZE */

function init3D(){

    var canvas =
        document.getElementById(
            "canvas3d"
        );

    if(
        !canvas ||
        typeof THREE === "undefined"
    ){

        return;
    }

    try{

        scene =
            new THREE.Scene();

        scene.fog =
            new THREE.Fog(
                0x081719,
                35,
                130
            );


        camera =
            new THREE.PerspectiveCamera(
                60,
                window.innerWidth /
                window.innerHeight,
                0.1,
                200
            );

        camera.position.z =
            42;


        renderer =
            new THREE.WebGLRenderer({

                canvas:canvas,

                alpha:true,

                antialias:true,

                powerPreference:
                    "high-performance"

            });


        renderer.setSize(
            window.innerWidth,
            window.innerHeight
        );

        renderer.setPixelRatio(
            Math.min(
                window.devicePixelRatio,
                1.5
            )
        );


        createParticles();

        createTorus();

        createFloatingObjects();

        createLights();

        animate();


        window.addEventListener(
            "resize",
            resize3D
        );

        document.addEventListener(
            "mousemove",
            mouseMove
        );

    }
    catch(error){

        console.log(
            "3D error:",
            error
        );
    }
}


/* PARTICLES */

function createParticles(){

    var geometry =
        new THREE.BufferGeometry();

    var count = 120;

    var positions =
        new Float32Array(
            count * 3
        );

    for(
        var i = 0;
        i < count * 3;
        i += 3
    ){

        positions[i] =
            (Math.random()-.5)*100;

        positions[i+1] =
            (Math.random()-.5)*70;

        positions[i+2] =
            (Math.random()-.5)*100;
    }


    geometry.setAttribute(
        "position",
        new THREE.BufferAttribute(
            positions,
            3
        )
    );


    var material =
        new THREE.PointsMaterial({

            color:0xC9A24B,

            size:0.7,

            transparent:true,

            opacity:0.55

        });


    particles =
        new THREE.Points(
            geometry,
            material
        );

    scene.add(
        particles
    );
}


/* TORUS KNOT */

function createTorus(){

    var geometry =
        new THREE.TorusKnotGeometry(
            8,
            2,
            64,
            16
        );


    var material =
        new THREE.MeshPhongMaterial({

            color:0x123B3F,

            emissive:0xC9A24B,

            emissiveIntensity:0.16,

            shininess:80,

            transparent:true,

            opacity:0.55

        });


    torus =
        new THREE.Mesh(
            geometry,
            material
        );


    torus.position.set(
        16,
        5,
        -20
    );


    scene.add(
        torus
    );
}


/* FLOATING OBJECTS */

function createFloatingObjects(){

    var geometry =
        new THREE.IcosahedronGeometry(
            1.5,
            1
        );

    var colors = [
        0xC9A24B,
        0xE4572E,
        0x3FAE6C
    ];


    for(
        var i=0;
        i<5;
        i++
    ){

        var material =
            new THREE.MeshPhongMaterial({

                color:
                    colors[
                        i % colors.length
                    ],

                emissive:
                    colors[
                        i % colors.length
                    ],

                emissiveIntensity:
                    0.15,

                shininess:70

            });


        var object =
            new THREE.Mesh(
                geometry,
                material
            );


        object.position.set(

            (Math.random()-.5)*55,

            (Math.random()-.5)*35,

            (Math.random()-.5)*40

        );


        object.userData.speed =
            0.003 +
            Math.random()*0.004;


        object.userData.angle =
            Math.random() *
            Math.PI * 2;


        scene.add(
            object
        );

        floatingObjects.push(
            object
        );
    }
}


/* LIGHTS */

function createLights(){

    var ambient =
        new THREE.AmbientLight(
            0xffffff,
            0.45
        );

    scene.add(
        ambient
    );


    var goldLight =
        new THREE.PointLight(
            0xC9A24B,
            1.2,
            100
        );

    goldLight.position.set(
        25,
        25,
        25
    );

    scene.add(
        goldLight
    );


    var coralLight =
        new THREE.PointLight(
            0xE4572E,
            0.7,
            100
        );

    coralLight.position.set(
        -25,
        -10,
        15
    );

    scene.add(
        coralLight
    );
}


/* ANIMATION */

function animate(){

    requestAnimationFrame(
        animate
    );

    clock += 0.005;


    if(torus){

        torus.rotation.x +=
            0.001;

        torus.rotation.y +=
            0.002;

        torus.position.y =
            5 +
            Math.sin(clock)*2;
    }


    if(particles){

        particles.rotation.y +=
            0.00025;

        particles.rotation.x +=
            0.00008;
    }


    floatingObjects.forEach(
        function(object,index){

            object.rotation.x +=
                0.002;

            object.rotation.y +=
                0.003;

            object.position.y +=
                Math.sin(
                    clock + index
                ) * 0.003;

        }
    );


    if(camera){

        camera.position.x +=
            (
                mouseX * 2 -
                camera.position.x
            ) * 0.015;

        camera.position.y +=
            (
                mouseY * 1.5 -
                camera.position.y
            ) * 0.015;

        camera.lookAt(
            scene.position
        );
    }


    renderer.render(
        scene,
        camera
    );
}


/* RESIZE */

function resize3D(){

    if(!camera || !renderer)
        return;


    camera.aspect =
        window.innerWidth /
        window.innerHeight;

    camera.updateProjectionMatrix();


    renderer.setSize(
        window.innerWidth,
        window.innerHeight
    );


    renderer.setPixelRatio(
        Math.min(
            window.devicePixelRatio,
            1.5
        )
    );
}


/* MOUSE */

function mouseMove(event){

    mouseX =
        (
            event.clientX /
            window.innerWidth -
            .5
        ) * 2;


    mouseY =
        -(
            event.clientY /
            window.innerHeight -
            .5
        ) * 2;
}


/* START */

if(
    document.readyState ===
    "loading"
){

    document.addEventListener(
        "DOMContentLoaded",
        function(){

            setTimeout(
                init3D,
                100
            );

        }
    );

}
else{

    setTimeout(
        init3D,
        100
    );
}

</script>

</body>
</html>