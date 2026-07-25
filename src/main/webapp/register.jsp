<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Food Gallery - Registration</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Space Grotesk', sans-serif;
}

:root{
    --ink:#0F2A2E;
    --teal:#123B3F;
    --gold:#C9A24B;
    --coral:#E4572E;
    --paper:#EFE9DC;
    --line: rgba(239,233,220,0.18);
}

body{
    min-height:100vh;
    background: radial-gradient(circle at 20% 10%, #1a4b50 0%, #0c2124 60%, #081517 100%);
    color:var(--paper);
}

/* Navbar */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 70px;
    background:rgba(15,42,46,.55);
    backdrop-filter:blur(12px);
    border-bottom:1px solid var(--line);
}

.logo{
    font-size:34px;
    font-weight:700;
    text-decoration:none;
    color:var(--gold);
}

.nav-links{
    display:flex;
    gap:35px;
}

.nav-links a{
    text-decoration:none;
    color: rgba(239,233,220,0.75);
    font-size:16px;
    font-weight:600;
    transition:.3s;
    position:relative;
}

.nav-links a::after{
    content:"";
    position:absolute;
    left:0;
    bottom:-6px;
    width:0;
    height:2px;
    background:var(--gold);
    transition:.3s;
}

.nav-links a:hover{
    color:var(--gold);
}

.nav-links a:hover::after{
    width:100%;
}

/* Registration Section */

.registration-section{
    min-height:88vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:50px 20px;
}

/* Ticket Card */

.register-card{
    width:520px;
    padding:0 0 40px;
    border-radius:20px;
    background: linear-gradient(180deg, var(--teal) 0%, var(--ink) 100%);
    box-shadow: 0 30px 60px -20px rgba(0,0,0,0.6), 0 0 0 1px rgba(201,162,75,0.25);
    overflow:hidden;
}

.card-top{
    padding:34px 40px 28px;
}

.eyebrow{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--gold);
    margin-bottom:16px;
}

/* Heading */

.register-card h2{
    text-align:left;
    color:var(--paper);
    font-size:30px;
    font-weight:700;
}

/* perforated ticket edge */
.perf{
    position:relative;
    height:16px;
    background:
        radial-gradient(circle 8px at 0 8px, transparent 98%, var(--teal)),
        radial-gradient(circle 8px at 100% 8px, transparent 98%, var(--teal));
    background-size: 24px 16px;
    background-repeat: repeat-x;
}

/* Form */

form{
    padding:26px 40px 0;
}

.form-group{
    margin-bottom:22px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-family:'JetBrains Mono', monospace;
    color: rgba(239,233,220,0.55);
    font-size:11px;
    letter-spacing:0.08em;
    text-transform:uppercase;
    font-weight:500;
}

.form-group input,
.form-group select{
    width:100%;
    padding:15px 16px;
    border-radius:10px;
    border:1px solid var(--line);
    background:rgba(239,233,220,.05);
    color:var(--paper);
    font-size:15px;
    font-family:'Space Grotesk', sans-serif;
    transition:.3s;
    outline:none;
}

.form-group input::placeholder{
    color: rgba(239,233,220,0.35);
}

.form-group select{
    cursor:pointer;
}

.form-group select option{
    background:var(--ink);
    color:var(--paper);
}

.form-group input:focus,
.form-group select:focus{
    border-color:var(--gold);
    box-shadow:0 0 0 3px rgba(201,162,75,.18);
    background:rgba(239,233,220,.08);
}

/* Button */

.register-btn{
    width:100%;
    padding:16px;
    margin-top:6px;
    border:none;
    border-radius:12px;
    background: linear-gradient(135deg, var(--gold), #b3893f);
    color:var(--ink);
    font-size:17px;
    font-weight:700;
    cursor:pointer;
    transition:.3s;
}

.register-btn:hover{
    transform:translateY(-3px);
    box-shadow:0 12px 25px rgba(201,162,75,.30);
}

/* Login Link */

.login-link{
    text-align:center;
    margin-top:24px;
    color: rgba(239,233,220,0.55);
    font-size:14.5px;
}

.login-link a{
    color:var(--gold);
    text-decoration:none;
    font-weight:700;
}

.login-link a:hover{
    text-decoration:underline;
}

/* Error message */

.error-msg{
    font-family:'JetBrains Mono', monospace;
    color:var(--coral);
    text-align:center;
    font-size:13px;
    padding:14px 40px 0;
    letter-spacing:0.02em;
}

/* Footer */

footer{
    text-align:center;
    padding:22px;
    color: rgba(239,233,220,0.4);
    background:rgba(15,42,46,.55);
    backdrop-filter:blur(12px);
    border-top:1px solid var(--line);
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
    letter-spacing:0.04em;
}

/* Responsive */

@media(max-width:768px){

    .navbar{
        flex-direction:column;
        gap:18px;
        padding:20px;
    }

    .nav-links{
        flex-wrap:wrap;
        justify-content:center;
    }

    .register-card{
        width:100%;
    }

    .card-top, form{
        padding-left:24px;
        padding-right:24px;
    }

    .register-card h2{
        font-size:25px;
    }

    .logo{
        font-size:30px;
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
    <a href="${pageContext.request.contextPath}/callRestaurantServlet">Home</a>
    <a href="${pageContext.request.contextPath}/callRestaurantServlet">Restaurants</a>
    <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
</div>
</nav>

<!-- Registration Form -->
<section class="registration-section">

<div class="register-card">

<%
String msg = (String) request.getAttribute("msg");
if(msg != null){
%>
<div class="error-msg"><%= msg %></div>
<%
}
%>

<div class="card-top">
    <div class="eyebrow">Food Gallery · Sign up</div>
    <h2>Create Account</h2>
</div>

<div class="perf"></div>

<form action="register" method="post">

<div class="form-group">
<label>Full Name</label>
<input type="text" name="name" placeholder="Enter your name" required>
</div>

<div class="form-group">
<label>Email Address</label>
<input type="email" name="email" placeholder="Enter your email" required>
</div>

<div class="form-group">
<label>Address</label>
<input type="text" name="address" placeholder="Enter your address" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" name="password" placeholder="Enter password" required>
</div>

<div class="form-group">
<label>Role</label>
<select name="role" required>
    <option value="">Select Role</option>
    <option value="Customer">Customer</option>
    <option value="Restaurant Owner">Restaurant Owner</option>
    <option value="Admin">Admin</option>
</select>
</div>

<button type="submit" class="register-btn">
Register
</button>

<div class="login-link">
Already have an account?
<a href="login.jsp">Login</a>
</div>

</form>

</div>

</section>

<!-- Footer -->
<footer>
© 2026 Food Gallery | Designed by Karthik
</footer>

</body>
</html>