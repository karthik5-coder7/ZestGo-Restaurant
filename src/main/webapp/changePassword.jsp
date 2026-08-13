<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ZestGo | Change Password</title>

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

    --muted:rgba(245,239,227,.45);

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
   FLOATING ORBS
===================================================== */

.orb{

    position:absolute;

    border-radius:50%;

    transform-style:preserve-3d;

    pointer-events:none;

}


/* GOLD ORB */

.orb-1{

    width:190px;

    height:190px;

    left:-35px;

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


/* TEAL ORB */

.orb-2{

    width:270px;

    height:270px;

    right:-90px;

    top:12%;

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


/* CORAL ORB */

.orb-3{

    width:150px;

    height:150px;

    right:22%;

    bottom:-40px;

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


/* =====================================================
   ORB ANIMATIONS
===================================================== */

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

    pointer-events:none;

}


.ring-1{

    width:400px;

    height:400px;

    left:-160px;

    bottom:-180px;

    animation:
        rotateRing1
        18s linear infinite;

}


.ring-2{

    width:300px;

    height:300px;

    right:-110px;

    top:28%;

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

    top:4%;

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
    left:12%;
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
   MAIN CARD
===================================================== */

.container{

    position:relative;

    z-index:5;

    width:420px;

    max-width:
        calc(100% - 28px);

    margin:
        55px auto;

    padding:
        42px 38px 32px;

    border-radius:24px;

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,.085),
            rgba(255,255,255,.025)
        );

    border:
        1px solid
        rgba(255,255,255,.10);

    backdrop-filter:
        blur(20px);

    box-shadow:

        0 35px 100px
        rgba(0,0,0,.48),

        inset 0 1px 0
        rgba(255,255,255,.07);

    transform-style:preserve-3d;

    animation:
        cardFloat
        7s ease-in-out infinite;

}


/* =====================================================
   CARD GOLD BORDER
===================================================== */

.container::before{

    content:"";

    position:absolute;

    inset:10px;

    border:
        1px dashed
        rgba(201,162,75,.22);

    border-radius:17px;

    pointer-events:none;

}


/* =====================================================
   CARD GLOW
===================================================== */

.container::after{

    content:"";

    position:absolute;

    width:150px;

    height:150px;

    top:-70px;

    right:-60px;

    border-radius:50%;

    background:
        rgba(201,162,75,.07);

    filter:blur(30px);

    pointer-events:none;

}


@keyframes cardFloat{

    0%,
    100%{

        transform:
            translateY(0)
            rotateX(0deg);

    }

    50%{

        transform:
            translateY(-5px)
            rotateX(.5deg);

    }

}


/* =====================================================
   SECURITY ICON
===================================================== */

.seal{

    position:relative;

    width:68px;

    height:68px;

    margin:
        0 auto 19px;

    display:flex;

    align-items:center;

    justify-content:center;

    border-radius:50%;

    background:
        conic-gradient(
            from 210deg,
            var(--coral),
            var(--gold),
            var(--coral)
        );

    color:var(--ink);

    font-size:26px;

    box-shadow:

        0 0 0 5px
        rgba(245,239,227,.05),

        0 15px 35px
        rgba(228,87,46,.18);

    animation:
        sealPulse
        4s ease-in-out infinite;

}


@keyframes sealPulse{

    0%,
    100%{

        transform:
            scale(1);

    }

    50%{

        transform:
            scale(1.045);

    }

}


/* =====================================================
   TEXT
===================================================== */

.eyebrow{

    display:block;

    text-align:center;

    color:var(--gold);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    letter-spacing:.20em;

    text-transform:uppercase;

    margin-bottom:8px;

}


h2{

    text-align:center;

    color:var(--paper);

    font-family:
        'Space Grotesk',
        sans-serif;

    font-size:28px;

    font-weight:700;

    letter-spacing:-.03em;

    margin-bottom:8px;

}


.subtext{

    text-align:center;

    color:
        rgba(245,239,227,.43);

    font-size:13px;

    line-height:1.6;

    margin-bottom:30px;

}


/* =====================================================
   FORM
===================================================== */

.form-group{

    margin-bottom:20px;

}


label{

    display:block;

    margin-bottom:8px;

    color:
        rgba(245,239,227,.68);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:10px;

    font-weight:500;

    letter-spacing:.08em;

    text-transform:uppercase;

}


input{

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

    transition:
        .25s ease;

}


input::placeholder{

    color:
        rgba(245,239,227,.25);

}


input:focus{

    border-color:
        rgba(201,162,75,.75);

    background:
        rgba(201,162,75,.06);

    box-shadow:
        0 0 0 3px
        rgba(201,162,75,.07);

}


/* =====================================================
   AUTOFILL
===================================================== */

input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus{

    -webkit-text-fill-color:
        var(--paper);

    transition:
        background-color 5000s ease-in-out 0s;

}


/* =====================================================
   PASSWORD STRENGTH
===================================================== */

.strength{

    display:flex;

    gap:4px;

    height:4px;

    margin-top:10px;

}


.strength span{

    flex:1;

    border-radius:5px;

    background:
        rgba(245,239,227,.10);

    transition:
        background .25s ease;

}


.strength-label{

    margin-top:7px;

    color:
        rgba(245,239,227,.30);

    font-family:
        'JetBrains Mono',
        monospace;

    font-size:9px;

    letter-spacing:.06em;

    text-transform:uppercase;

}


/* =====================================================
   BUTTON
===================================================== */

button{

    width:100%;

    margin-top:5px;

    padding:15px;

    border:none;

    border-radius:11px;

    cursor:pointer;

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

    transition:
        .25s ease;

    box-shadow:
        0 12px 30px
        rgba(201,162,75,.10);

}


button:hover{

    transform:
        translateY(-3px);

    box-shadow:
        0 18px 35px
        rgba(201,162,75,.22);

}


button:active{

    transform:
        translateY(0);

}


/* =====================================================
   BACK LINK
===================================================== */

.back{

    margin-top:23px;

    text-align:center;

    color:
        rgba(245,239,227,.38);

    font-size:12.5px;

}


.back a{

    color:var(--gold);

    text-decoration:none;

    font-weight:600;

    transition:.2s;

}


.back a:hover{

    color:var(--paper);

}


/* =====================================================
   MOBILE
===================================================== */

@media(max-width:600px){

    body{

        padding:
            15px 0;

    }


    .container{

        width:
            calc(100% - 22px);

        max-width:none;

        margin:
            25px auto;

        padding:
            35px 23px 28px;

        border-radius:20px;

    }


    .container::before{

        inset:8px;

        border-radius:14px;

    }


    .seal{

        width:60px;

        height:60px;

        font-size:23px;

    }


    h2{

        font-size:24px;

    }


    .subtext{

        font-size:12px;

        margin-bottom:25px;

    }


    input{

        padding:
            13px 14px;

        font-size:14px;

    }


    button{

        padding:14px;

    }


    .orb-1{

        width:120px;

        height:120px;

        left:-50px;

    }


    .orb-2{

        width:170px;

        height:170px;

        right:-70px;

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

}


/* =====================================================
   SMALL PHONES
===================================================== */

@media(max-width:380px){

    .container{

        width:
            calc(100% - 16px);

        padding:
            30px 19px 25px;

    }


    h2{

        font-size:22px;

    }


    .eyebrow{

        font-size:9px;

    }


    label{

        font-size:9px;

    }

}


/* =====================================================
   REDUCED MOTION
===================================================== */

@media(prefers-reduced-motion:reduce){

    .background-3d *,
    .container,
    .seal{

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
     CHANGE PASSWORD CARD
===================================================== -->

<div class="container">


    <div class="seal">
        🔒
    </div>


    <span class="eyebrow">
        Security Verification
    </span>


    <h2>
        Change Password
    </h2>


    <p class="subtext">
        Confirm your identity to update your credentials
    </p>



    <form action="changePassword"
          method="post"
          id="pwForm">


        <!-- CURRENT PASSWORD -->

        <div class="form-group">

            <label>
                Current Password
            </label>

            <input
                type="password"
                name="oldPassword"
                placeholder="Enter current password"
                required>

        </div>



        <!-- NEW PASSWORD -->

        <div class="form-group">

            <label>
                New Password
            </label>

            <input
                type="password"
                name="newPassword"
                id="newPassword"
                placeholder="Create new password"
                required>


            <div
                class="strength"
                id="strengthBars">

                <span></span>
                <span></span>
                <span></span>
                <span></span>

            </div>


            <div
                class="strength-label"
                id="strengthLabel">

                Enter a new password

            </div>

        </div>



        <!-- CONFIRM PASSWORD -->

        <div class="form-group">

            <label>
                Confirm Password
            </label>

            <input
                type="password"
                name="confirmPassword"
                placeholder="Confirm new password"
                required>

        </div>



        <!-- SUBMIT -->

        <button type="submit">

            Update Password

        </button>


    </form>



    <!-- BACK -->

    <div class="back">

        <a href="profile.jsp">

            ← Back to Profile

        </a>

    </div>


</div>



<!-- =====================================================
     PASSWORD STRENGTH SCRIPT
===================================================== -->

<script>

var newPwInput =
    document.getElementById('newPassword');

var bars =
    document.querySelectorAll(
        '#strengthBars span'
    );

var label =
    document.getElementById(
        'strengthLabel'
    );


var colors = [

    '#E4572E',

    '#E4572E',

    '#C9A24B',

    '#3FAE6A'

];


var labels = [

    'Weak',

    'Weak',

    'Getting there',

    'Strong'

];


newPwInput.addEventListener(
    'input',
    function(){

        var val =
            newPwInput.value;

        var score = 0;


        if(val.length >= 6)
            score++;


        if(val.length >= 10)
            score++;


        if(
            /[A-Z]/.test(val)
            &&
            /[0-9]/.test(val)
        )
            score++;


        if(
            /[^A-Za-z0-9]/.test(val)
        )
            score++;


        if(val.length === 0)
            score = 0;


        bars.forEach(
            function(bar,i){

                bar.style.background =
                    i < score
                    ?
                    colors[
                        Math.max(
                            score - 1,
                            0
                        )
                    ]
                    :
                    'rgba(245,239,227,.10)';

            }
        );


        label.textContent =
            val.length === 0
            ?
            'Enter a new password'
            :
            labels[
                Math.max(
                    score - 1,
                    0
                )
            ];

    }
);

</script>


</body>
</html>