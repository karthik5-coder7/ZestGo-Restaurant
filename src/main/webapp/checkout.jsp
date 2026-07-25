<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.Food.Model.Cart,com.Food.Model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">

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
    --teal-light:#1a4b50;
    --gold:#C9A24B;
    --coral:#E4572E;
    --paper:#EFE9DC;
    --line: rgba(15,42,46,0.15);
}

body{
    min-height:100vh;
    padding:50px 24px;
    color:var(--ink);
    background: var(--paper);
}

/* HEADER */
.page-head{
    max-width:960px;
    margin:0 auto 34px;
}

h1{
    font-size:32px;
    font-weight:700;
    color:var(--ink);
    margin-bottom:6px;
}

.subtitle{
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
    letter-spacing:0.08em;
    text-transform:uppercase;
    color:var(--coral);
}

/* BOARDING PASS */
.pass{
    max-width:960px;
    margin:0 auto;
    display:flex;
    background: var(--ink);
    border-radius:20px;
    box-shadow: 0 30px 60px -20px rgba(15,42,46,0.35);
    overflow:hidden;
    position:relative;
}

/* perforated tear line between stub sections */
.pass::before{
    content:"";
    position:absolute;
    top:0;
    bottom:0;
    left:66%;
    width:0;
    border-left:2px dashed rgba(239,233,220,0.25);
}

.pass::after{
    content:"";
    position:absolute;
    top:0; bottom:0;
    left:calc(66% - 10px);
    width:20px;
    background:
        radial-gradient(circle 10px at 10px 0, transparent 98%, var(--ink)),
        radial-gradient(circle 10px at 10px 100%, transparent 98%, var(--ink));
}

/* MAIN STUB — delivery details */
.stub-main{
    width:66%;
    padding:38px 40px;
    color:var(--paper);
}

.boarding-label{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--gold);
    margin-bottom:24px;
}

.field-label{
    display:block;
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    letter-spacing:0.08em;
    text-transform:uppercase;
    color: rgba(239,233,220,0.5);
    margin:18px 0 8px;
}

.field-label:first-of-type{ margin-top:0; }

input,
textarea,
select{
    width:100%;
    padding:13px 15px;
    border-radius:10px;
    border:1px solid rgba(239,233,220,0.15);
    background: rgba(239,233,220,0.06);
    color:var(--paper);
    font-size:14.5px;
    font-family:'Space Grotesk', sans-serif;
    outline:none;
    transition:0.25s;
}

input::placeholder,
textarea::placeholder{
    color: rgba(239,233,220,0.35);
}

input:focus,
textarea:focus,
select:focus{
    border-color:var(--gold);
    background: rgba(239,233,220,0.1);
}

textarea{
    height:88px;
    resize:none;
}

select{
    color:var(--paper);
}

select option{
    background: var(--ink);
    color:var(--paper);
}

/* STUB — order summary */
.stub-side{
    width:34%;
    padding:38px 30px;
    background: var(--teal);
    color:var(--paper);
    display:flex;
    flex-direction:column;
}

.stub-side h2{
    font-size:15px;
    font-weight:700;
    color:var(--paper);
    margin-bottom:18px;
}

.order-item{
    display:flex;
    justify-content:space-between;
    gap:8px;
    padding:10px 0;
    border-bottom:1px dashed rgba(239,233,220,0.15);
    font-size:13px;
}

.order-item .name{
    flex:1;
}

.order-item .qty{
    font-family:'JetBrains Mono', monospace;
    color: rgba(239,233,220,0.5);
}

.order-item .amt{
    font-family:'JetBrains Mono', monospace;
    color:var(--gold);
    white-space:nowrap;
}

/* TOTAL */
.total-box{
    margin-top:auto;
    padding-top:18px;
}

.total-row{
    display:flex;
    justify-content:space-between;
    margin-bottom:10px;
    font-size:13px;
    color: rgba(239,233,220,0.65);
    font-family:'JetBrains Mono', monospace;
}

.final-total{
    display:flex;
    justify-content:space-between;
    margin-top:14px;
    padding-top:14px;
    border-top:1px solid rgba(239,233,220,0.2);
    font-size:22px;
    font-weight:700;
    color:var(--gold);
}

/* BUTTONS */
.place-btn{
    width:100%;
    margin-top:22px;
    padding:15px;
    border:none;
    border-radius:10px;
    font-size:15px;
    font-weight:700;
    cursor:pointer;
    color:var(--ink);
    background: linear-gradient(135deg, var(--gold), #e0b862);
    transition:0.2s;
}

.place-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 12px 25px -8px rgba(201,162,75,0.5);
}

.back-btn{
    width:100%;
    margin-top:10px;
    padding:13px;
    border-radius:10px;
    font-size:13.5px;
    font-weight:500;
    cursor:pointer;
    background: transparent;
    border:1px solid rgba(239,233,220,0.2);
    color: rgba(239,233,220,0.7);
    transition:0.2s;
}

.back-btn:hover{
    border-color:var(--gold);
    color:var(--gold);
}

/* RESPONSIVE */
@media(max-width:820px){

.pass{
    flex-direction:column;
}

.pass::before,
.pass::after{
    display:none;
}

.stub-main,
.stub-side{
    width:100%;
}

.stub-side{
    border-top:2px dashed rgba(239,233,220,0.15);
}

body{ padding:24px 16px; }
h1{ font-size:26px; }
}
</style>
</head>
<body>

<div class="page-head">
    <h1>Checkout</h1>
    <span class="subtitle">Boarding Pass · Confirm your order</span>
</div>

<form action="placeOrderServlet" method="post">

<div class="pass">

<!-- MAIN STUB -->
<div class="stub-main">

<div class="boarding-label">Delivery Details</div>

<label class="field-label">Full Name</label>
<input type="text"
       name="name"
       placeholder="Enter your full name"
       required>

<label class="field-label">Mobile Number</label>
<input type="text"
       name="mobile"
       placeholder="Enter your mobile number"
       required>

<label class="field-label">Delivery Address</label>
<textarea name="address"
          placeholder="Enter your complete delivery address"
          required></textarea>

<label class="field-label">Payment Method</label>

<select name="paymentMethod" required>

<option value="">Select Payment Method</option>
<option value="Cash On Delivery">Cash On Delivery</option>
<option value="UPI">UPI</option>
<option value="Credit Card">Credit Card</option>
<option value="Debit Card">Debit Card</option>

</select>

</div>

<!-- SIDE STUB -->
<div class="stub-side">

<h2>Order Summary</h2>

<%
Cart cart = (Cart)session.getAttribute("cart");

double itemTotal = 0;

if(cart != null && !cart.getItems().isEmpty())
{
    for(CartItem item : cart.getItems().values())
    {
        itemTotal += item.getTotalPrice();
%>

<div class="order-item">

    <div class="name">
        <%= item.getName() %>
    </div>

    <div class="qty">
        x<%= item.getQuantity() %>
    </div>

    <div class="amt">
        ₹<%= item.getTotalPrice() %>
    </div>

</div>

<%
    }
}

double deliveryFee = itemTotal >= 199 ? 0 : 40;
double platformFee = 5;
double total = itemTotal + deliveryFee + platformFee;
%>

<div class="total-box">

<div class="total-row">
    <div>Item Total</div>
    <div>₹<%= itemTotal %></div>
</div>

<div class="total-row">
    <div>Delivery Fee</div>
    <div><%if(deliveryFee == 0){
    %>
        FREE
    <%
    } else {
    %>
        ₹<%= deliveryFee %>
    <%
    }
    %>
    </div>
</div>

<div class="total-row">
    <div>Platform Fee</div>
    <div>₹<%= platformFee %></div>
</div>

<div class="final-total">
    <div>Total</div>
    <div>₹<%= total %></div>
</div>

<button class="place-btn" type="submit">
    Place Order
</button>

<button type="button"
        class="back-btn"
        onclick="location.href='cart.jsp'">
    Back To Cart
</button>

</div>

</div>

</div>

</form>

</body>
</html>