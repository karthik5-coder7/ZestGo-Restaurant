<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.List, com.Food.Model.User"%>
<%@page import="com.Food.DAOimpl.FavoriteDAOimpl"%>

<%
String userName = (String) session.getAttribute("userName");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZestGo - Premium Food Delivery</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

<style>
:root{
    --ink:#0F2A2E;
    --teal:#123B3F;
    --gold:#C9A24B;
    --coral:#E4572E;
    --paper:#EFE9DC;
    --accent-blue:#2E9CDB;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Space Grotesk', sans-serif;
}

html, body{
    width:100%;
    height:100%;
    overflow-x:hidden;
}

body{
    background: var(--paper);
    color:var(--ink);
}

#canvas3d{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100vh;
    z-index:-1;
    background: linear-gradient(135deg, #0a1f22 0%, #0f2a2e 50%, #1a4b50 100%);
}

.navbar{
    background: rgba(15,42,46,0.88);
    backdrop-filter: blur(20px);
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:16px 50px;
    position:sticky;
    top:0;
    z-index:1000;
    border-bottom:1px solid rgba(201,162,75,0.3);
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
}

.logo-wrap{
    display:flex;
    align-items:center;
    gap:14px;
    text-decoration:none;
}

.logo-img{
    width:60px;
    height:60px;
    border-radius:50%;
    object-fit:cover;
    background: linear-gradient(135deg, var(--gold), var(--coral));
    border:3px solid #ffffff;
    box-shadow:0 4px 20px rgba(201,162,75,0.4);
    animation: float 3s ease-in-out infinite;
}

@keyframes float{
    0%, 100%{ transform: translateY(0px); }
    50%{ transform: translateY(-8px); }
}

.logo-text{
    font-size:26px;
    font-weight:800;
    background: linear-gradient(135deg, var(--gold), var(--coral));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    letter-spacing:2px;
}

.nav-links{
    display:flex;
    align-items:center;
    gap:8px;
}

.nav-links a{
    text-decoration:none;
    color: rgba(239,233,220,0.7);
    padding:10px 16px;
    border-radius:8px;
    font-weight:600;
    font-size:14px;
    transition:0.3s;
}

.nav-links a:hover{
    color:var(--gold);
    background: rgba(201,162,75,0.1);
}

.avatar-wrap{
    position:relative;
    display:flex;
    align-items:center;
    gap:12px;
    padding:8px 12px;
    border-radius:12px;
    background: rgba(201,162,75,0.1);
    cursor:pointer;
    transition:0.3s;
}

.avatar-wrap:hover{
    background: rgba(201,162,75,0.15);
}

.profile-info{
    display:flex;
    flex-direction:column;
    align-items:flex-start;
}

.profile-name{
    font-size:13px;
    font-weight:700;
    color:var(--paper);
    letter-spacing:0.5px;
}

.profile-label{
    font-size:10px;
    color:var(--gold);
    font-family:'JetBrains Mono', monospace;
    letter-spacing:0.08em;
    text-transform:uppercase;
    font-weight:600;
}

.avatar-btn{
    width:44px;
    height:44px;
    border-radius:50%;
    border:2px solid var(--gold);
    cursor:pointer;
    background: conic-gradient(from 210deg, var(--coral), var(--gold), var(--accent-blue), var(--coral));
    color:var(--ink);
    display:flex;
    align-items:center;
    justify-content:center;
    box-shadow:0 0 20px rgba(201,162,75,0.4);
    transition:0.3s;
    font-weight:700;
    font-size:14px;
    flex-shrink:0;
}

.avatar-btn:hover{
    transform: scale(1.1);
    box-shadow:0 0 30px rgba(201,162,75,0.8);
}

.dropdown{
    position:absolute;
    top:60px;
    right:0;
    width:260px;
    background: rgba(15,42,46,0.95);
    backdrop-filter: blur(20px);
    border:1px solid rgba(201,162,75,0.4);
    border-radius:16px;
    box-shadow:0 20px 60px rgba(0,0,0,0.4);
    padding:12px;
    display:none;
    flex-direction:column;
    z-index:1100;
    animation: slideDown 0.4s ease;
}

.dropdown.show{
    display:flex;
}

@keyframes slideDown{
    from{
        opacity:0;
        transform:translateY(-10px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

.dropdown .mail{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    color: rgba(239,233,220,0.6);
    padding:12px 14px;
    border-bottom:1px solid rgba(201,162,75,0.2);
    margin-bottom:8px;
    word-break:break-all;
    font-weight:700;
}

.dropdown a{
    text-decoration:none;
    color: rgba(239,233,220,0.85);
    font-size:14px;
    font-weight:600;
    padding:12px 14px;
    border-radius:10px;
    transition:0.2s;
}

.dropdown a:hover{
    background: rgba(201,162,75,0.15);
    color:var(--gold);
    padding-left:18px;
}

.dropdown a.logout{
    color:var(--coral);
    margin-top:8px;
    border-top:1px solid rgba(228,87,46,0.2);
    padding-top:12px;
}

.dropdown a.logout:hover{
    background: rgba(228,87,46,0.15);
}

.hero{
    padding:120px 24px 90px;
    text-align:center;
    background: transparent;
    position:relative;
    z-index:10;
    min-height:60vh;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
}

.hero h1{
    font-size:56px;
    font-weight:800;
    background: linear-gradient(135deg, var(--paper), var(--gold), var(--coral));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom:12px;
    animation: fadeInUp 0.9s ease 0.2s both;
}

.hero .eyebrow{
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
    letter-spacing:0.2em;
    text-transform:uppercase;
    color:var(--gold);
    margin-bottom:16px;
    animation: fadeInUp 0.9s ease 0.05s both;
    font-weight:700;
}

@keyframes fadeInUp{
    from{
        opacity:0;
        transform:translateY(30px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

.search-box{
    margin-top:32px;
    width:560px;
    max-width:95%;
    padding:16px 24px;
    border-radius:14px;
    border:2px solid rgba(201,162,75,0.3);
    background: rgba(239,233,220,0.08);
    color:var(--paper);
    outline:none;
    font-size:15px;
    transition:0.4s;
    animation: fadeInUp 0.9s ease 0.5s both;
    box-shadow: 0 8px 32px rgba(0,0,0,0.15);
    font-weight:600;
}

.search-box::placeholder{
    color: rgba(239,233,220,0.45);
}

.search-box:focus{
    border-color:var(--gold);
    background: rgba(239,233,220,0.12);
    box-shadow: 0 8px 32px rgba(201,162,75,0.25);
}

.restaurant-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(300px,1fr));
    gap:32px;
    padding:60px 50px;
    position:relative;
    z-index:5;
}

.card{
    background:rgba(255,255,255,0.95);
    backdrop-filter: blur(12px);
    border-radius:20px;
    overflow:hidden;
    position:relative;
    box-shadow:0 15px 50px rgba(15,42,46,0.3);
    border:2px solid rgba(201,162,75,0.4);
    transition:0.5s ease;
    animation: slideUp 0.8s ease-out both;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.card:nth-child(1) { animation-delay: 0.1s; }
.card:nth-child(2) { animation-delay: 0.2s; }
.card:nth-child(3) { animation-delay: 0.3s; }
.card:nth-child(4) { animation-delay: 0.4s; }
.card:nth-child(5) { animation-delay: 0.5s; }
.card:nth-child(6) { animation-delay: 0.6s; }

.card:hover{
    transform:translateY(-12px);
    box-shadow:0 30px 80px rgba(15,42,46,0.4), 0 0 60px rgba(201,162,75,0.4);
    border-color: rgba(201,162,75,0.8);
}

.card img{
    width:100%;
    height:240px;
    object-fit:cover;
    display:block;
    transition:0.6s ease;
}

.card:hover img {
    transform: scale(1.08);
}

.offer{
    position:absolute;
    top:16px;
    left:16px;
    background: linear-gradient(135deg, var(--coral), var(--gold));
    color:#fff;
    padding:10px 16px;
    border-radius:10px;
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.1em;
    text-transform:uppercase;
    border:2px solid rgba(255,255,255,0.3);
    font-weight:800;
    box-shadow: 0 6px 20px rgba(201,162,75,0.35);
    z-index:3;
}

.favorite{
    position:absolute;
    top:16px;
    right:16px;
    width:48px;
    height:48px;
    border:2px solid rgba(228,87,46,0.4);
    border-radius:50%;
    background: rgba(255,255,255,0.96);
    color:var(--coral);
    cursor:pointer;
    font-size:22px;
    transition:0.3s ease;
    display:flex;
    align-items:center;
    justify-content:center;
    box-shadow:0 6px 20px rgba(0,0,0,0.12);
    z-index:3;
    font-weight:700;
    border:none;
}

.favorite:hover{
    transform:scale(1.15);
    background:var(--coral);
    color:#fff;
    box-shadow:0 8px 30px rgba(228,87,46,0.35);
}

.card-content{
    padding:22px 20px 20px;
    position:relative;
}

.card-content::before{
    content:"";
    position:absolute;
    top:0; left:0; right:0;
    height:2px;
    background: linear-gradient(90deg, transparent, rgba(201,162,75,0.3), transparent);
}

.title-rating{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;
    gap:12px;
    margin-top:8px;
}

.title-rating h3{
    font-size:18px;
    font-weight:800;
}

.rating{
    background: linear-gradient(135deg, var(--coral), var(--gold));
    color:#fff;
    padding:6px 12px;
    border-radius:10px;
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
    white-space:nowrap;
    font-weight:800;
}

.card-content p{
    color:#475569;
    font-size:13px;
    margin-top:10px;
    font-weight:600;
}

.card-content small{
    display:block;
    margin-top:12px;
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    color: var(--gold);
    font-weight:700;
}

.card-link{
    text-decoration:none;
    color:inherit;
    display:block;
}

footer{
    text-align:center;
    padding:32px;
    background: rgba(15,42,46,0.92);
    backdrop-filter: blur(20px);
    color: rgba(239,233,220,0.6);
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
    border-top:1px solid rgba(201,162,75,0.2);
    position:relative;
    z-index:5;
    font-weight:600;
}

@media(max-width:768px){
    .navbar{ padding:12px 16px; flex-wrap:wrap; }
    .nav-links{ flex-wrap:wrap; justify-content:center; }
    .avatar-wrap{ flex-direction:column; gap:8px; }
    .profile-info{ align-items:center; }
    .profile-name{ font-size:12px; }
    .avatar-btn{ width:40px; height:40px; font-size:12px; }
    .hero{ padding:60px 16px 50px; }
    .hero h1{ font-size:32px; }
    .search-box{ width:100%; }
    .restaurant-grid{ padding:30px 16px; gap:20px; }
}
</style>
</head>

<body>

<canvas id="canvas3d"></canvas>

<nav class="navbar">
    <a href="callRestaurantServlet" class="logo-wrap">
        <img src="Image/ZestGo.png" class="logo-img" alt="ZestGo Logo">
        <div class="logo-text">ZestGo</div>
    </a>

    <div class="nav-links">
        <a href="callRestaurantServlet">Home</a>

        <% if(userName == null){ %>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Sign Up</a>
        <% } else { %>
            <div class="avatar-wrap" id="avatarBtn">
                <div class="profile-info">
                    <div class="profile-label">User</div>
                    <div class="profile-name"><%= userName %></div>
                </div>
                <button type="button" class="avatar-btn">
                    <% 
                        String initials = "";
                        if(userName != null && userName.length() > 0) {
                            String[] names = userName.split(" ");
                            initials = names[0].substring(0, 1).toUpperCase();
                            if(names.length > 1) {
                                initials += names[names.length-1].substring(0, 1).toUpperCase();
                            }
                        }
                    %>
                    <%= initials %>
                </button>

                <div class="dropdown" id="avatarDropdown">
                    <div class="mail"><%= userName %></div>
                    <a href="profile.jsp">My Profile</a>
                    <a href="orderHistory">My Orders</a>
                    <a href="favorites">Favorites</a>
                    <a href="cart.jsp">Cart</a>
                    <a href="logout" class="logout">Logout</a>
                </div>
            </div>
        <% } %>
    </div>
</nav>

<section class="hero">
    <div>
        <span class="eyebrow">ZestGo Premium Delivery</span>
        <h1>Every Craving, One Destination.</h1>

        <form action="callRestaurantServlet" method="get">
            <input type="text" name="keyword" class="search-box" placeholder="Search restaurants, cuisines, or dishes...">
        </form>
    </div>
</section>

<div class="restaurant-grid">

<%
FavoriteDAOimpl favDao = new FavoriteDAOimpl();
List<User> allUsers = (List<User>) request.getAttribute("allUsers");

for(User user : allUsers){
    boolean favorite = false;
    if(userName != null){
        favorite = favDao.isFavorite(userName, user.getRestaurantID());
    }
%>

<div class="card">

    <% if(favorite){ %>
        <form action="removeFavorite" method="get" style="position:absolute; top:16px; right:16px; z-index:3; margin:0;">
            <input type="hidden" name="restaurantId" value="<%= user.getRestaurantID() %>">
            <button class="favorite" type="submit">Heart</button>
        </form>
    <% } else { %>
        <form action="addFavorite" method="get" style="position:absolute; top:16px; right:16px; z-index:3; margin:0;">
            <input type="hidden" name="restaurantId" value="<%= user.getRestaurantID() %>">
            <button class="favorite" type="submit">Like</button>
        </form>
    <% } %>

    <a class="card-link" href="menu?restaurantId=<%= user.getRestaurantID() %>&Name=<%= user.getName() %>&CuisineType=<%= user.getCuisineType() %>&Rating=<%= user.getRating() %>">

        <%
String[] offers = {
    "50% OFF",
    "40% OFF",
    "FREE DELIVERY",
    "125 OFF",
    "BUY 1 GET 1",
    "30% OFF",
    "100 CASHBACK",
    "20% OFF",
    "FREE DESSERT",
    "COMBO 199",
    "Flat 99 OFF",
    "Extra 15% OFF",
    "Free Coke",
    "Family Pack",
    "Free Cake"
};

String offer = offers[Math.abs(user.getRestaurantID()) % offers.length];
%>

        <span class="offer"><%= offer %></span>

        <img src="<%= user.getImagePath() %>" alt="<%= user.getName() %>">

        <div class="card-content">
            <div class="title-rating">
                <h3><%= user.getName() %></h3>
                <span class="rating"><%= user.getRating() %></span>
            </div>

            <p><%= user.getCuisineType() %></p>
            <p><%= user.getAddress() %></p>
            <small><%= user.getDeliveryTime() %></small>
        </div>

    </a>

</div>

<% } %>

</div>

<footer>
Copyright 2026 ZestGo - Premium Food Delivery
</footer>

<script>
let scene, camera, renderer;
let particles, torusKnot, spheres;
let time = 0;

function init3D() {
    try {
        const canvas = document.getElementById('canvas3d');
        if (!canvas) return;
        
        scene = new THREE.Scene();
        scene.background = new THREE.Color(0x0a1f22);
        scene.fog = new THREE.Fog(0x0a1f22, 150, 300);
        
        camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
        
        renderer = new THREE.WebGLRenderer({ canvas: canvas, alpha: false, antialias: true, powerPreference: 'high-performance' });
        renderer.setSize(window.innerWidth, window.innerHeight);
        renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
        renderer.setClearColor(0x0a1f22, 1);
        
        camera.position.z = 40;

        createParticles();
        createTorusKnot();
        createSpheres();
        setupLighting();
        
        animate();
        
        window.addEventListener('resize', onWindowResize);
    } catch (error) {
        console.error('3D Error:', error);
    }
}

function createParticles() {
    const geometry = new THREE.BufferGeometry();
    const particleCount = 150;
    const positions = new Float32Array(particleCount * 3);
    const velocities = new Float32Array(particleCount * 3);

    for (let i = 0; i < particleCount * 3; i += 3) {
        positions[i] = (Math.random() - 0.5) * 100;
        positions[i + 1] = (Math.random() - 0.5) * 100;
        positions[i + 2] = (Math.random() - 0.5) * 100;

        velocities[i] = (Math.random() - 0.5) * 0.15;
        velocities[i + 1] = (Math.random() - 0.5) * 0.15;
        velocities[i + 2] = (Math.random() - 0.5) * 0.15;
    }

    geometry.setAttribute('position', new THREE.BufferAttribute(positions, 3));
    geometry.userData.velocities = velocities;

    const canvas = document.createElement('canvas');
    canvas.width = 32;
    canvas.height = 32;
    const ctx = canvas.getContext('2d');
    
    const gradient = ctx.createRadialGradient(16, 16, 0, 16, 16, 16);
    gradient.addColorStop(0, 'rgba(255, 255, 255, 1)');
    gradient.addColorStop(1, 'rgba(201, 162, 75, 0)');
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, 32, 32);

    const texture = new THREE.CanvasTexture(canvas);
    const material = new THREE.PointsMaterial({
        map: texture,
        sizeAttenuation: true,
        transparent: true,
        opacity: 0.5,
        size: 1
    });

    particles = new THREE.Points(geometry, material);
    scene.add(particles);
}

function createTorusKnot() {
    const geometry = new THREE.TorusKnotGeometry(8, 2.5, 100, 20);
    const material = new THREE.MeshPhongMaterial({
        color: 0x2E9CDB,
        emissive: 0xC9A24B,
        emissiveIntensity: 0.2,
        shininess: 50
    });

    torusKnot = new THREE.Mesh(geometry, material);
    torusKnot.position.z = -10;
    scene.add(torusKnot);
}

function createSpheres() {
    spheres = [];
    const sphereGeometry = new THREE.IcosahedronGeometry(2, 3);
    const colors = [0xC9A24B, 0xE4572E, 0x2E9CDB];
    
    for (let i = 0; i < 3; i++) {
        const material = new THREE.MeshPhongMaterial({
            color: colors[i],
            emissive: colors[i],
            emissiveIntensity: 0.15,
            shininess: 50
        });
        
        const sphere = new THREE.Mesh(sphereGeometry, material);
        sphere.userData.angle = (Math.PI * 2 / 3) * i;
        sphere.userData.radius = 18;
        
        scene.add(sphere);
        spheres.push(sphere);
    }
}

function setupLighting() {
    const mainLight = new THREE.PointLight(0xC9A24B, 1, 120);
    mainLight.position.set(30, 30, 30);
    scene.add(mainLight);

    const secondLight = new THREE.PointLight(0xE4572E, 0.8, 120);
    secondLight.position.set(-30, -20, 20);
    scene.add(secondLight);

    const ambientLight = new THREE.AmbientLight(0xffffff, 0.4);
    scene.add(ambientLight);
}

function animate() {
    requestAnimationFrame(animate);
    time += 0.005;

    if (torusKnot) {
        torusKnot.rotation.x += 0.001;
        torusKnot.rotation.y += 0.002;
    }

    spheres.forEach((sphere, i) => {
        sphere.userData.angle += 0.005;
        sphere.position.x = Math.cos(sphere.userData.angle) * sphere.userData.radius;
        sphere.position.z = Math.sin(sphere.userData.angle) * sphere.userData.radius;
        sphere.position.y = Math.cos(time * 0.3 + i) * 2;
    });

    if (particles) {
        particles.rotation.y += 0.0001;
        
        const positions = particles.geometry.getAttribute('position').array;
        const velocities = particles.geometry.userData.velocities;

        for (let i = 0; i < positions.length; i += 3) {
            positions[i] += velocities[i];
            positions[i + 1] += velocities[i + 1];
            positions[i + 2] += velocities[i + 2];

            if (Math.abs(positions[i]) > 50) velocities[i] *= -1;
            if (Math.abs(positions[i + 1]) > 50) velocities[i + 1] *= -1;
            if (Math.abs(positions[i + 2]) > 50) velocities[i + 2] *= -1;
        }

        particles.geometry.getAttribute('position').needsUpdate = true;
    }

    renderer.render(scene, camera);
}

function onWindowResize() {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
}

const avatarBtn = document.getElementById('avatarBtn');
if (avatarBtn) {
    avatarBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        const dropdown = document.getElementById('avatarDropdown');
        if (dropdown) {
            dropdown.classList.toggle('show');
        }
    });
}

document.addEventListener('click', function(event) {
    const dropdown = document.getElementById('avatarDropdown');
    const avatarWrap = document.getElementById('avatarBtn');
    if (dropdown && !event.target.closest('.avatar-wrap') && avatarWrap) {
        dropdown.classList.remove('show');
    }
});

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function() {
        setTimeout(() => init3D(), 100);
    });
} else {
    setTimeout(() => init3D(), 100);
}
</script>

</body>
</html>