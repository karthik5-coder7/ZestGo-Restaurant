<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
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

body{
    min-height:100vh;
    background: var(--paper);
    color:var(--ink);
}

/* Navbar */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 70px;
    background: var(--ink);
    border-bottom:1px solid rgba(201,162,75,0.25);
    position:sticky;
    top:0;
}

.logo{
    font-size:22px;
    font-weight:700;
    color:var(--paper);
    text-decoration:none;
    letter-spacing:0.02em;
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
    transition:0.2s;
}

.nav-links a:hover{
    background: rgba(201,162,75,0.15);
    color:var(--gold);
}

/* Center */
.container{
    min-height:85vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:40px 16px;
}

/* PASSPORT CARD */
.login-container{
    position:relative;
    width:430px;
    max-width:100%;
    padding:42px 40px 34px;
    background: var(--ink);
    border-radius:18px;
    color:var(--paper);
    box-shadow:
        0 30px 60px -20px rgba(0,0,0,0.6),
        0 0 0 1px rgba(201,162,75,0.25);
}

/* dashed inset border, passport bio-page feel */
.login-container::before{
    content:"";
    position:absolute;
    inset:12px;
    border:1px dashed rgba(201,162,75,0.3);
    border-radius:12px;
    pointer-events:none;
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
}

.eyebrow{
    text-align:center;
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--gold);
    margin-bottom:6px;
}

.login-container h2{
    text-align:center;
    color:var(--paper);
    font-size:24px;
    margin-bottom:8px;
    font-weight:700;
}

.subtext{
    text-align:center;
    font-size:13px;
    color: rgba(239,233,220,0.55);
    margin-bottom:28px;
}

/* Inputs */

.input-group{
    margin-bottom:20px;
}

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
    transition:0.25s;
}

.input-group input::placeholder{
    color: rgba(239,233,220,0.35);
}

.input-group input:focus{
    border-color:var(--gold);
    background: rgba(239,233,220,0.1);
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
    transition:0.25s;
}

button:hover{
    transform:translateY(-2px);
    box-shadow:0 12px 25px -8px rgba(201,162,75,0.5);
}

/* Register */

.register-link{
    margin-top:22px;
    text-align:center;
    font-size:13.5px;
    color: rgba(239,233,220,0.55);
}

.register-link a{
    text-decoration:none;
    color:var(--gold);
    font-weight:600;
}

.register-link a:hover{
    color:var(--paper);
}

/* MRZ — machine readable zone, signature element */
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

}
</style>

</head>
<body>

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
        ZESTGO &middot; SECURE LOGIN
    </div>

</div>
</div>
</body>
</html>