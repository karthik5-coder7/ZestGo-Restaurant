<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userName = (String) session.getAttribute("userName");
String orderId = "ZG-" + (100000 + (int)(Math.random() * 899999));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
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
    --green:#3FAE6C;
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
    width:420px;
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
    padding:32px 26px 30px;
    text-align:center;
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
    margin-bottom:24px;
    text-align:left;
}

.check-avatar{
    width:72px; height:72px;
    margin:0 auto 20px;
    border-radius:50%;
    background: conic-gradient(from 210deg, var(--green), var(--gold), var(--green));
    display:flex; align-items:center; justify-content:center;
    font-size:30px;
    color:var(--ink);
    box-shadow: 0 0 0 4px rgba(239,233,220,0.15);
}

.header .title{
    font-size:24px;
    font-weight:700;
}
.header .sub{
    font-family:'JetBrains Mono', monospace;
    font-size:11.5px;
    color: rgba(239,233,220,0.6);
    margin-top:8px;
}

/* Ticket details */
.stub{
    padding:26px 26px 10px;
    display:flex;
    flex-direction:column;
}

.detail-row{
    display:flex;
    align-items:center;
    gap:14px;
    padding:14px 4px;
    border-bottom: 1px dashed var(--line);
}
.detail-row:last-child{ border-bottom:none; }

.detail-row .badge{
    width:34px; height:34px;
    border-radius:8px;
    display:flex; align-items:center; justify-content:center;
    font-size:16px;
    flex-shrink:0;
    background: rgba(201,162,75,0.18);
}

.detail-row .info{ flex:1; }
.detail-row .info .label{
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    letter-spacing:0.06em;
    text-transform:uppercase;
    color: rgba(239,233,220,0.45);
}
.detail-row .info .value{
    font-size:15px;
    font-weight:500;
    margin-top:2px;
}

/* Actions */
.actions{
    padding:16px 26px 24px;
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
.option.primary .badge{ background: rgba(63,174,108,0.2); }
.option.primary{ font-weight:600; }
.option.secondary .badge{ background: rgba(239,233,220,0.1); }

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
    .header .title{ font-size:21px; }
    .option .label{ font-size:14px; }
}
</style>
</head>
<body>

<div class="card">

    <div class="header">
        <div class="eyebrow">
            <span>Order ticket</span>
            <span>Confirmed</span>
        </div>
        <div class="check-avatar">✅</div>
        <div class="title">Order Placed Successfully!</div>
        <div class="sub">Thank you for your order. Your delicious food is being prepared.</div>
    </div>

    <div class="perf"></div>

    <div class="stub">

        <div class="detail-row">
            <div class="badge">🧾</div>
            <div class="info">
                <div class="label">Order ID</div>
                <div class="value"><%= orderId %></div>
            </div>
        </div>

        <div class="detail-row">
            <div class="badge">⏱</div>
            <div class="info">
                <div class="label">Estimated Delivery</div>
                <div class="value">35 - 45 mins</div>
            </div>
        </div>

        <% if(userName != null){ %>
        <div class="detail-row">
            <div class="badge">📍</div>
            <div class="info">
                <div class="label">Delivering To</div>
                <div class="value"><%= userName %></div>
            </div>
        </div>
        <% } %>

    </div>

    <div class="perf"></div>

    <div class="actions">
        <a href="orderHistory" class="option primary">
            <div class="badge">📦</div>
            <div class="label">View My Orders</div>
            <div class="arrow">›</div>
        </a>

        <a href="callRestaurantServlet" class="option secondary">
            <div class="badge">🍽️</div>
            <div class="label">Order More</div>
            <div class="arrow">›</div>
        </a>
    </div>

    <div class="barcode">
        <div class="bars" id="bars"></div>
        <div class="member-id"><%= orderId %></div>
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