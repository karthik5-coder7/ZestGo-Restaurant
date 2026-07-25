<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
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
    --line: rgba(239,233,220,0.18);
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background: radial-gradient(circle at 20% 10%, var(--teal-light) 0%, var(--ink) 60%, #081517 100%);
    padding:32px 16px;
}

/* DOCUMENT CARD */
.container{
    position:relative;
    width:420px;
    max-width:100%;
    padding:44px 38px 36px;
    background: var(--ink);
    border-radius:18px;
    color:var(--paper);
    box-shadow:
        0 30px 60px -20px rgba(0,0,0,0.6),
        0 0 0 1px rgba(201,162,75,0.25);
}

/* certificate-style dashed inset border */
.container::before{
    content:"";
    position:absolute;
    inset:12px;
    border:1px dashed rgba(201,162,75,0.3);
    border-radius:12px;
    pointer-events:none;
}

/* WAX SEAL */
.seal{
    width:64px;
    height:64px;
    margin:0 auto 18px;
    border-radius:50%;
    background: conic-gradient(from 210deg, var(--coral), var(--gold), var(--coral));
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:26px;
    box-shadow:
        0 0 0 4px rgba(239,233,220,0.08),
        0 10px 25px -8px rgba(228,87,46,0.5);
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

/* Heading */
h2{
    text-align:center;
    color:var(--paper);
    font-size:24px;
    font-weight:700;
    margin-bottom:8px;
}

.subtext{
    text-align:center;
    font-size:13px;
    color: rgba(239,233,220,0.55);
    margin-bottom:30px;
}

/* Form */
.form-group{
    margin-bottom:20px;
}

label{
    display:block;
    margin-bottom:8px;
    color: rgba(239,233,220,0.75);
    font-size:13px;
    font-weight:500;
    font-family:'JetBrains Mono', monospace;
    letter-spacing:0.04em;
    text-transform:uppercase;
}

input{
    width:100%;
    padding:14px 16px;
    border-radius:10px;
    border:1px solid rgba(239,233,220,0.15);
    background: rgba(239,233,220,0.06);
    color:var(--paper);
    font-size:15px;
    font-family:'Space Grotesk', sans-serif;
    outline:none;
    transition:0.25s;
}

input::placeholder{
    color: rgba(239,233,220,0.35);
}

input:focus{
    border-color:var(--gold);
    background: rgba(239,233,220,0.1);
}

/* PASSWORD STRENGTH METER — signature element */
.strength{
    display:flex;
    gap:4px;
    margin-top:10px;
    height:5px;
}

.strength span{
    flex:1;
    border-radius:3px;
    background: rgba(239,233,220,0.12);
    transition: background 0.25s ease;
}

.strength-label{
    margin-top:6px;
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    letter-spacing:0.05em;
    color: rgba(239,233,220,0.4);
    text-transform:uppercase;
}

/* Button */
button{
    width:100%;
    margin-top:8px;
    padding:15px;
    border:none;
    border-radius:10px;
    cursor:pointer;
    font-size:15px;
    font-weight:700;
    color:var(--ink);
    background: linear-gradient(135deg, var(--gold), #e0b862);
    transition:0.25s;
}

button:hover{
    transform:translateY(-2px);
    box-shadow:0 12px 25px -8px rgba(201,162,75,0.5);
}

/* Footer */
.back{
    margin-top:24px;
    text-align:center;
    font-size:13.5px;
    color: rgba(239,233,220,0.5);
}

.back a{
    color:var(--gold);
    text-decoration:none;
    font-weight:600;
}

.back a:hover{
    color:var(--paper);
}

/* Responsive */
@media(max-width:500px){
    .container{
        width:100%;
        padding:36px 26px 30px;
    }
    h2{ font-size:21px; }
}

</style>

</head>
<body>

<div class="container">

<div class="seal">🔒</div>

<span class="eyebrow">Security Verification</span>
<h2>Change Password</h2>
<p class="subtext">Confirm your identity to update your credentials</p>

<form action="changePassword" method="post" id="pwForm">

<div class="form-group">
<label>Current Password</label>
<input type="password"
       name="oldPassword"
       required>
</div>

<div class="form-group">
<label>New Password</label>
<input type="password"
       name="newPassword"
       id="newPassword"
       required>

<div class="strength" id="strengthBars">
    <span></span><span></span><span></span><span></span>
</div>
<div class="strength-label" id="strengthLabel">Enter a new password</div>

</div>

<div class="form-group">
<label>Confirm Password</label>
<input type="password"
       name="confirmPassword"
       required>
</div>

<button type="submit">
Update Password
</button>

</form>

<div class="back">
<a href="profile.jsp">← Back to Profile</a>
</div>

</div>

<script>
var newPwInput = document.getElementById('newPassword');
var bars = document.querySelectorAll('#strengthBars span');
var label = document.getElementById('strengthLabel');

var colors = ['#E4572E', '#E4572E', '#C9A24B', '#3fae6a'];
var labels = ['Weak', 'Weak', 'Getting there', 'Strong'];

newPwInput.addEventListener('input', function(){
    var val = newPwInput.value;
    var score = 0;

    if(val.length >= 6) score++;
    if(val.length >= 10) score++;
    if(/[A-Z]/.test(val) && /[0-9]/.test(val)) score++;
    if(/[^A-Za-z0-9]/.test(val)) score++;

    if(val.length === 0) score = 0;

    bars.forEach(function(bar, i){
        bar.style.background = i < score
            ? colors[Math.max(score - 1, 0)]
            : 'rgba(239,233,220,0.12)';
    });

    label.textContent = val.length === 0
        ? 'Enter a new password'
        : labels[Math.max(score - 1, 0)];
});
</script>

</body>
</html>