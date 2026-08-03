<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - ZestGo 3D</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Space Grotesk',sans-serif;
}

:root{
    --ink:#0F2A2E;
    --teal:#123B3F;
    --teal-light:#1a4b50;
    --gold:#C9A24B;
    --coral:#E4572E;
    --paper:#EFE9DC;
    --line: rgba(239,233,220,0.18);
}

html {
    scroll-behavior: smooth;
}

body{
    min-height:100vh;
    background: linear-gradient(135deg, #0a1f22 0%, #0f2a2e 50%, #1a4b50 100%);
    color:var(--ink);
    overflow-x:hidden;
    perspective: 1200px;
    position:relative;
}

/* Animated background */
body::before {
    content: '';
    position: fixed;
    inset: 0;
    background: linear-gradient(-45deg, #0F2A2E, #123B3F, #1a4b50, #0F2A2E);
    background-size: 400% 400%;
    animation: gradientShift 15s ease infinite;
    z-index: -2;
}

@keyframes gradientShift {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Floating particles */
.particles {
    position: fixed;
    inset: 0;
    z-index: -1;
}

.particle {
    position: absolute;
    width: 4px;
    height: 4px;
    background: rgba(201, 162, 75, 0.3);
    border-radius: 50%;
    animation: float 6s infinite ease-in-out;
}

@keyframes float {
    0%, 100% {
        transform: translateY(0) translateX(0) scale(1);
        opacity: 0;
    }
    10% {
        opacity: 1;
    }
    90% {
        opacity: 1;
    }
    100% {
        transform: translateY(-100vh) translateX(100px) scale(0);
        opacity: 0;
    }
}

/* Navbar */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 70px;
    background: rgba(15, 42, 46, 0.8);
    backdrop-filter: blur(20px);
    border-bottom:1px solid rgba(201,162,75,0.25);
    position:sticky;
    top:0;
    z-index: 100;
    box-shadow: 0 8px 32px rgba(0,0,0,0.3);
    animation: slideDownIn 0.8s cubic-bezier(0.34, 1.56, 0.64, 1);
}

@keyframes slideDownIn {
    from {
        opacity: 0;
        transform: translateY(-100%) rotateX(90deg);
    }
    to {
        opacity: 1;
        transform: translateY(0) rotateX(0);
    }
}

.logo{
    font-size:22px;
    font-weight:700;
    color:var(--paper);
    text-decoration:none;
    letter-spacing:0.02em;
    background: linear-gradient(135deg, var(--gold), var(--coral));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    transition: all 0.3s ease;
}

.logo:hover {
    transform: scale(1.05) rotateZ(2deg);
    text-shadow: 0 0 20px rgba(201, 162, 75, 0.5);
}

.nav-links{
    display:flex;
    gap:6px;
}

.nav-links a{
    text-decoration:none;
    color: rgba(239,233,220,0.7);
    font-weight:500;
    font-size:14px;
    padding:9px 14px;
    border-radius:8px;
    transition: all 0.3s;
    position: relative;
}

.nav-links a::before {
    content: '';
    position: absolute;
    inset: 0;
    background: rgba(201, 162, 75, 0.1);
    border-radius: 8px;
    opacity: 0;
    transition: opacity 0.3s;
    z-index: -1;
}

.nav-links a:hover::before {
    opacity: 1;
}

.nav-links a:hover{
    color:var(--gold);
    transform: translateY(-3px) translateZ(20px);
}

/* Center */
.container{
    min-height:85vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:40px 16px;
    perspective: 1200px;
}

/* PASSPORT CARD - 3D VERSION */
.login-container{
    position:relative;
    width:430px;
    max-width:100%;
    padding:42px 40px 34px;
    background: rgba(15, 42, 46, 0.9);
    backdrop-filter: blur(20px);
    border-radius:18px;
    color:var(--paper);
    box-shadow:
        0 30px 60px -20px rgba(0,0,0,0.6),
        0 0 0 1px rgba(201,162,75,0.25),
        inset 0 0 20px rgba(201, 162, 75, 0.1);
    animation: cardFadeIn 1s cubic-bezier(0.34, 1.56, 0.64, 1);
    transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
    transform-style: preserve-3d;
    will-change: transform;
}

@keyframes cardFadeIn {
    from {
        opacity: 0;
        transform: translateY(40px) rotateX(90deg) scale(0.8);
    }
    to {
        opacity: 1;
        transform: translateY(0) rotateX(0) scale(1);
    }
}

.login-container:hover {
    transform: translateY(-12px) rotateX(5deg) rotateY(-2deg) translateZ(30px);
    box-shadow:
        0 50px 100px -20px rgba(0,0,0,0.8),
        0 0 40px rgba(201,162,75,0.3),
        inset 0 0 30px rgba(201, 162, 75, 0.15);
}

/* dashed inset border */
.login-container::before{
    content:"";
    position:absolute;
    inset:12px;
    border:1px dashed rgba(201,162,75,0.3);
    border-radius:12px;
    pointer-events:none;
}

.login-content {
    position: relative;
    z-index: 1;
}

.emblem{
    width:56px;
    height:56px;
    margin:0 auto 16px;
    border-radius:50%;
    background: conic-gradient(from 210deg, var(--coral), var(--gold), var(--coral));
    display:flex;
    align-items:center;
    justify-content:center;
    font-family:'JetBrains Mono', monospace;
    font-weight:700;
    font-size:15px;
    color:var(--ink);
    box-shadow: 0 12px 30px rgba(201, 162, 75, 0.4);
    animation: emblemFloat 3s ease-in-out infinite;
    transform-style: preserve-3d;
}

@keyframes emblemFloat {
    0%, 100% {
        transform: translateY(0) rotateZ(0) translateZ(20px);
    }
    50% {
        transform: translateY(-15px) rotateZ(10deg) translateZ(30px);
    }
}

.eyebrow{
    text-align:center;
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--gold);
    margin-bottom:6px;
    animation: slideInDown 0.8s 0.2s cubic-bezier(0.34, 1.56, 0.64, 1) both;
}

@keyframes slideInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.login-container h2{
    text-align:center;
    color:var(--paper);
    font-size:24px;
    margin-bottom:8px;
    font-weight:700;
    animation: slideInDown 0.8s 0.3s cubic-bezier(0.34, 1.56, 0.64, 1) both;
}

.subtext{
    text-align:center;
    font-size:13px;
    color: rgba(239,233,220,0.55);
    margin-bottom:28px;
    animation: slideInDown 0.8s 0.4s cubic-bezier(0.34, 1.56, 0.64, 1) both;
}

/* Inputs */

.input-group{
    margin-bottom:20px;
    animation: slideInLeft 0.8s cubic-bezier(0.34, 1.56, 0.64, 1) both;
}

@keyframes slideInLeft {
    from {
        opacity: 0;
        transform: translateX(-30px) rotateY(25deg);
    }
    to {
        opacity: 1;
        transform: translateX(0) rotateY(0);
    }
}

.input-group:nth-child(3) { animation-delay: 0.3s; }
.input-group:nth-child(4) { animation-delay: 0.4s; }

.input-group label{
    display:block;
    margin-bottom:8px;
    color: rgba(239,233,220,0.75);
    font-size:13px;
    font-weight:500;
    font-family:'JetBrains Mono', monospace;
    letter-spacing:0.04em;
    text-transform:uppercase;
}

.input-group input{
    width:100%;
    padding:14px 16px;
    border:1px solid rgba(239,233,220,0.15);
    border-radius:10px;
    background: rgba(239,233,220,0.06);
    color:var(--paper);
    font-size:15px;
    outline:none;
    transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
    transform-style: preserve-3d;
}

.input-group input::placeholder{
    color: rgba(239,233,220,0.35);
}

.input-group input:focus{
    border-color:var(--gold);
    background: rgba(239,233,220,0.12);
    box-shadow: 0 0 0 4px rgba(201,162,75,0.2), inset 0 0 20px rgba(201,162,75,0.05);
    transform: translateY(-4px) translateZ(10px) rotateX(2deg);
}

/* Button */

button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:10px;
    font-size:15px;
    font-weight:700;
    cursor:pointer;
    color:var(--ink);
    background: linear-gradient(135deg, var(--gold), #e0b862);
    transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
    position: relative;
    overflow: hidden;
    box-shadow: 0 12px 25px -8px rgba(201,162,75,0.5);
    animation: buttonSlideIn 0.8s 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) both;
    transform-style: preserve-3d;
}

@keyframes buttonSlideIn {
    from {
        opacity: 0;
        transform: translateY(30px) rotateX(-90deg);
    }
    to {
        opacity: 1;
        transform: translateY(0) rotateX(0);
    }
}

button::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(255,255,255,0.4), rgba(255,255,255,0));
    opacity: 0;
    transition: opacity 0.3s;
    transform-style: preserve-3d;
}

button:hover::before {
    opacity: 1;
}

button:hover{
    transform: translateY(-6px) translateZ(20px) rotateX(3deg) rotateY(-1deg);
    box-shadow: 0 20px 40px -8px rgba(201,162,75,0.6);
}

button:active {
    transform: translateY(-2px) translateZ(5px);
}

/* Register */

.register-link{
    margin-top:22px;
    text-align:center;
    font-size:13.5px;
    color: rgba(239,233,220,0.55);
    animation: slideInUp 0.8s 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) both;
}

@keyframes slideInUp {
    from {
        opacity: 0;
        transform: translateY(20px) rotateX(90deg);
    }
    to {
        opacity: 1;
        transform: translateY(0) rotateX(0);
    }
}

.register-link a{
    text-decoration:none;
    color:var(--gold);
    font-weight:600;
    transition: all 0.3s;
}

.register-link a:hover{
    color:var(--paper);
    transform: translateY(-2px) translateZ(10px);
}

/* MRZ */
.mrz{
    margin-top:30px;
    padding-top:18px;
    border-top:1px dashed rgba(239,233,220,0.15);
    font-family:'JetBrains Mono', monospace;
    font-size:11.5px;
    letter-spacing:0.06em;
    color: rgba(239,233,220,0.3);
    line-height:1.7;
    text-align:center;
    word-break:break-all;
}

/* Responsive */

@media(max-width:768px){

.navbar{
    flex-direction:column;
    gap:14px;
    padding:18px 20px;
}

.nav-links{
    flex-wrap:wrap;
    justify-content:center;
}

.login-container{
    padding:34px 26px 28px;
}

.logo{
    font-size:19px;
}

.login-container:hover {
    transform: translateY(-6px) rotateX(3deg) rotateY(-1deg) translateZ(15px);
}

}

@media (prefers-reduced-motion: reduce) {
    * {
        animation-duration: 0.01ms !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0.01ms !important;
    }
}

</style>

</head>
<body>

<!-- Particles -->
<div class="particles" id="particles"></div>

<!-- Navbar -->
<nav class="navbar">
    <a href="/FoodApp/callRestaurantServlet" class="logo">
    ZestGo
</a>

    <div class="nav-links">
    <a href="callRestaurantServlet">Home</a>
    <a href="callRestaurantServlet">Restaurants</a>
    <a href="register.jsp">Register</a>
</div>
</nav>

<div class="container">
<div class="login-container">
    <div class="login-content">
        <div class="emblem">ZG</div>
        <span class="eyebrow">Passport Control</span>
        <h2>Login</h2>
        <p class="subtext">Verify your credentials to continue</p>

        <form action="callLoginServlet" method="post">

            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit">Login</button>

        </form>

        <div class="register-link">
            <p>Don't have an account? 
            <a href="register.jsp">Register</a></p>
        </div>

        <div class="mrz">
            ZESTGO &middot; SECURE LOGIN &middot; 3D EDITION
        </div>
    </div>

</div>
</div>

<script>
// Create floating particles
function createParticles() {
    const container = document.getElementById('particles');
    for (let i = 0; i < 50; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        particle.style.width = Math.random() * 4 + 2 + 'px';
        particle.style.height = particle.style.width;
        particle.style.left = Math.random() * 100 + '%';
        particle.style.top = Math.random() * 100 + '%';
        particle.style.animation = `float ${Math.random() * 3 + 5}s linear infinite`;
        particle.style.animationDelay = Math.random() * 2 + 's';
        container.appendChild(particle);
    }
}

// Mouse follow 3D effect
document.addEventListener('mousemove', (e) => {
    const card = document.querySelector('.login-container');
    if (!card) return;
    
    const rect = card.getBoundingClientRect();
    const x = (e.clientX - (rect.left + rect.width / 2)) / rect.width;
    const y = (e.clientY - (rect.top + rect.height / 2)) / rect.height;
    
    card.style.transform = `
        translateY(-12px) 
        rotateX(${y * 5}deg) 
        rotateY(${x * 5}deg) 
        translateZ(30px)
    `;
});

// Reset on mouse leave
document.addEventListener('mouseleave', () => {
    const card = document.querySelector('.login-container');
    if (card) {
        card.style.transform = 'translateY(-12px) rotateX(0) rotateY(0) translateZ(0)';
    }
});

// Initialize particles
createParticles();
</script>

</body>
</html>