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
<html>
<head>
<title>My Profile</title>
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
    display:flex;
    justify-content:center;
    align-items:center;
    background: radial-gradient(circle at 20% 10%, #1a4b50 0%, #0c2124 60%, #081517 100%);
    padding:32px 16px;
}

/* Card */
.card{
    position:relative;
    width:400px;
    max-width:100%;
    background: linear-gradient(180deg, var(--teal) 0%, var(--ink) 100%);
    border-radius:20px;
    color:var(--paper);
    box-shadow: 0 30px 60px -20px rgba(0,0,0,0.6), 0 0 0 1px rgba(201,162,75,0.25);
    overflow:hidden;
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

.header{
    padding:28px 26px 30px;
}

.eyebrow{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--gold);
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:18px;
}

.id-row{
    display:flex;
    align-items:center;
    gap:16px;
}

.avatar{
    width:56px; height:56px;
    border-radius:50%;
    background: conic-gradient(from 210deg, var(--coral), var(--gold), var(--coral));
    display:flex; align-items:center; justify-content:center;
    font-family:'JetBrains Mono', monospace;
    font-weight:700;
    font-size:20px;
    color:var(--ink);
    flex-shrink:0;
    box-shadow: 0 0 0 3px rgba(239,233,220,0.15);
}

.id-text .name{
    font-size:22px;
    font-weight:700;
}
.id-text .mail{
    font-family:'JetBrains Mono', monospace;
    font-size:11.5px;
    color: rgba(239,233,220,0.6);
    margin-top:4px;
    word-break:break-all;
}

/* Menu */
.stub{
    padding:26px 26px 24px;
    display:flex;
    flex-direction:column;
}

.option{
    display:flex;
    align-items:center;
    gap:14px;
    padding:16px 4px;
    border-bottom: 1px dashed var(--line);
    text-decoration:none;
    color:var(--paper);
    transition: padding-left 0.18s ease, background 0.18s ease;
}
.option:last-child{ border-bottom:none; }

.option:hover{
    padding-left:10px;
    background: rgba(239,233,220,0.05);
}

.option .badge{
    width:34px; height:34px;
    border-radius:8px;
    display:flex; align-items:center; justify-content:center;
    font-size:16px;
    flex-shrink:0;
    background: rgba(201,162,75,0.18);
}
.option.favorites .badge{ background: rgba(228,87,46,0.18); }
.option.cart .badge{ background: rgba(239,233,220,0.1); }
.option.logout .badge{ background: rgba(228,87,46,0.12); }
.option.logout{ color: var(--coral); font-weight:600; margin-top:6px; }

.option .label{
    font-size:15px;
    font-weight:500;
    flex:1;
}

.option .arrow{
    color: rgba(239,233,220,0.35);
    font-size:14px;
}

/* Footer */
.barcode{
    padding:18px 26px 26px;
    border-top: 1px solid var(--line);
    display:flex;
    align-items:center;
    justify-content:space-between;
}
.bars{
    display:flex;
    gap:2px;
    align-items:flex-end;
    height:26px;
}
.bars span{
    display:block;
    width:2px;
    background: rgba(239,233,220,0.45);
}
.member-id{
    font-family:'JetBrains Mono', monospace;
    font-size:10px;
    color: rgba(239,233,220,0.4);
    letter-spacing:0.08em;
}

/* Mobile */
@media(max-width:480px){
    .card{ width:100%; }
    .id-text .name{ font-size:19px; }
    .option .label{ font-size:14px; }
}
</style>
</head>
<body>

<div class="card">

    <div class="header">
        <div class="eyebrow">
            <span>Member card</span>
            <span>Signed in</span>
        </div>
        <div class="id-row">
            <div class="avatar"><%= userName.length() >= 2 ? userName.substring(0,2).toUpperCase() : userName.toUpperCase() %></div>
            <div class="id-text">
                <div class="name">My Profile</div>
                <div class="mail"><%= userName %></div>
            </div>
        </div>
    </div>

    <div class="perf"></div>

    <div class="stub">
        <a href="favorites" class="option favorites">
            <div class="badge">❤️</div>
            <div class="label">My Favorites</div>
            <div class="arrow">›</div>
        </a>

        <a href="orderHistory" class="option">
            <div class="badge">📦</div>
            <div class="label">My Orders</div>
            <div class="arrow">›</div>
        </a>

        <a href="cart.jsp" class="option cart">
            <div class="badge">🛒</div>
            <div class="label">My Cart</div>
            <div class="arrow">›</div>
        </a>

        <a href="changePassword.jsp" class="option">
            <div class="badge">🔒</div>
            <div class="label">Change Password</div>
            <div class="arrow">›</div>
        </a>

        <a href="logout" class="option logout">
            <div class="badge">🚪</div>
            <div class="label">Logout</div>
            <div class="arrow">›</div>
        </a>
    </div>

    <div class="barcode">
        <div class="bars" id="bars"></div>
        <div class="member-id">SESSION ACTIVE</div>
    </div>

</div>

<script>
    var bars = document.getElementById('bars');
    for(var i=0;i<40;i++){
        var b = document.createElement('span');
        var h = 10 + Math.random()*16;
        b.style.height = h+'px';
        bars.appendChild(b);
    }
</script>

</body>
</html>