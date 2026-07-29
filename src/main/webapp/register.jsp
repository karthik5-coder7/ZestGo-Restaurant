<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZestGo - Registration</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

<style>
* { margin:0; padding:0; box-sizing:border-box; font-family:'Space Grotesk', sans-serif; }

:root{
    --ink:#0F2A2E;
    --teal:#123B3F;
    --gold:#C9A24B;
    --coral:#E4572E;
    --paper:#EFE9DC;
}

html, body { width:100%; height:100%; margin:0; padding:0; }

body{
    min-height:100vh;
    background: linear-gradient(135deg, #0a1f22 0%, #0f2a2e 50%, #1a4b50 100%);
    color:var(--paper);
    overflow-x:hidden;
}

#canvas3d{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100vh;
    z-index:-1;
}

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 70px;
    background:rgba(15,42,46,0.85);
    backdrop-filter:blur(20px);
    border-bottom:1px solid rgba(201,162,75,0.3);
    position:relative;
    z-index:100;
}

.logo{
    font-size:34px;
    font-weight:800;
    text-decoration:none;
    background: linear-gradient(135deg, var(--gold), var(--coral));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
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
}

.nav-links a:hover{
    color:var(--gold);
}

.registration-section{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:50px 20px;
    position:relative;
    z-index:5;
}

.register-card{
    width:520px;
    padding:0 0 40px;
    border-radius:24px;
    background: rgba(18,59,63,0.95);
    backdrop-filter: blur(20px);
    box-shadow: 0 30px 80px rgba(0,0,0,0.5);
    overflow:hidden;
    border:2px solid rgba(201,162,75,0.3);
    transition:0.6s ease;
    animation: cardIn 0.8s ease-out;
}

@keyframes cardIn {
    from { opacity:0; transform: translateY(60px) scale(0.95); }
    to { opacity:1; transform: translateY(0) scale(1); }
}

.register-card:hover{
    transform: translateY(-8px);
    box-shadow: 0 40px 100px rgba(0,0,0,0.6), 0 0 50px rgba(201,162,75,0.3);
    border-color: rgba(201,162,75,0.6);
}

.card-top{
    padding:40px 40px 32px;
    background: linear-gradient(180deg, rgba(255,255,255,0.03) 0%, rgba(0,0,0,0.2) 100%);
    border-bottom:1px solid rgba(201,162,75,0.2);
}

.eyebrow{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.18em;
    text-transform:uppercase;
    color:var(--gold);
    margin-bottom:16px;
    font-weight:700;
}

.register-card h2{
    color:var(--paper);
    font-size:32px;
    font-weight:800;
}

.perf{
    height:16px;
    background:
        radial-gradient(circle 8px at 0 8px, transparent 98%, var(--teal)),
        radial-gradient(circle 8px at 100% 8px, transparent 98%, var(--teal));
    background-size: 24px 16px;
    background-repeat: repeat-x;
}

form{
    padding:32px 40px 0;
}

.form-group{
    margin-bottom:24px;
    animation: slideIn 0.6s ease both;
}

.form-group:nth-child(1) { animation-delay: 0.25s; }
.form-group:nth-child(2) { animation-delay: 0.3s; }
.form-group:nth-child(3) { animation-delay: 0.35s; }
.form-group:nth-child(4) { animation-delay: 0.4s; }
.form-group:nth-child(5) { animation-delay: 0.45s; }

@keyframes slideIn {
    from { opacity:0; transform: translateX(-20px); }
    to { opacity:1; transform: translateX(0); }
}

.form-group label{
    display:block;
    margin-bottom:10px;
    font-family:'JetBrains Mono', monospace;
    color: var(--gold);
    font-size:11px;
    letter-spacing:0.15em;
    text-transform:uppercase;
    font-weight:700;
}

.form-group input,
.form-group select{
    width:100%;
    padding:15px 16px;
    border-radius:12px;
    border:2px solid rgba(201,162,75,0.3);
    background:rgba(239,233,220,0.08);
    color:var(--paper);
    font-size:15px;
    outline:none;
    font-weight:500;
    transition:0.4s ease;
}

.form-group input::placeholder{
    color: rgba(239,233,220,0.45);
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
    box-shadow:0 0 0 3px rgba(201,162,75,0.25);
    background:rgba(239,233,220,0.1);
}

.register-btn{
    width:100%;
    padding:16px;
    margin-top:12px;
    border:none;
    border-radius:12px;
    background: linear-gradient(135deg, var(--gold), var(--coral));
    color:var(--ink);
    font-size:16px;
    font-weight:800;
    cursor:pointer;
    transition:0.4s ease;
    box-shadow: 0 8px 25px rgba(201,162,75,0.3);
    animation: slideIn 0.6s ease 0.5s both;
}

.register-btn:hover{
    transform:translateY(-4px);
    box-shadow:0 16px 40px rgba(201,162,75,0.5);
}

.login-link{
    text-align:center;
    margin-top:24px;
    color: rgba(239,233,220,0.65);
    font-size:14px;
    animation: slideIn 0.6s ease 0.55s both;
}

.login-link a{
    color:var(--gold);
    text-decoration:none;
    font-weight:800;
}

.login-link a:hover{
    color:var(--coral);
}

.error-msg{
    font-family:'JetBrains Mono', monospace;
    color:var(--coral);
    text-align:center;
    font-size:13px;
    padding:16px 40px 0;
    font-weight:700;
}

footer{
    text-align:center;
    padding:26px;
    color: rgba(239,233,220,0.5);
    background:rgba(15,42,46,0.85);
    backdrop-filter:blur(20px);
    border-top:1px solid rgba(201,162,75,0.2);
    font-family:'JetBrains Mono', monospace;
    font-size:12px;
    position:relative;
    z-index:100;
}

@media(max-width:768px){
    .navbar{ flex-direction:column; gap:18px; padding:16px; }
    .nav-links{ gap:20px; }
    .register-card{ width:100%; }
    .register-card h2{ font-size:26px; }
}
</style>
</head>
<body>

<canvas id="canvas3d"></canvas>

<nav class="navbar">
    <a href="/FoodApp/callRestaurantServlet" class="logo">ZestGo</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/callRestaurantServlet">Home</a>
        <a href="${pageContext.request.contextPath}/callRestaurantServlet">Restaurants</a>
        <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
    </div>
</nav>

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
    <div class="eyebrow">ZestGo - Create Account</div>
    <h2>Join ZestGo</h2>
</div>

<div class="perf"></div>

<form action="register" method="post">

<div class="form-group">
<label>Full Name</label>
<input type="text" name="name" placeholder="Enter your full name" required>
</div>

<div class="form-group">
<label>Email Address</label>
<input type="email" name="email" placeholder="your@email.com" required>
</div>

<div class="form-group">
<label>Address</label>
<input type="text" name="address" placeholder="Enter your delivery address" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" name="password" placeholder="Create a secure password" required>
</div>

<div class="form-group">
<label>Select Your Role</label>
<select name="role" required>
    <option value="">Choose Role</option>
    <option value="Customer">Customer</option>
    <option value="Restaurant Owner">Restaurant Owner</option>
    <option value="Admin">Admin</option>
</select>
</div>

<button type="submit" class="register-btn">Create Account</button>

<div class="login-link">
Already have an account? <a href="login.jsp">Sign In</a>
</div>

</form>

</div>
</section>

<footer>
Copyright 2026 ZestGo - Premium Food Delivery Experience
</footer>

<script>
let scene, camera, renderer;
let particles, torusKnot, spheres, waves;
let time = 0;
let mouseX = 0, mouseY = 0;

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
        renderer.shadowMap.enabled = true;
        
        camera.position.z = 40;

        createAdvancedParticles();
        createTorusKnot();
        createOrbitingSpheres();
        createWavePlane();
        setupLighting();
        
        animate();
        
        window.addEventListener('resize', onWindowResize);
        document.addEventListener('mousemove', onMouseMove);
    } catch (error) {
        console.error('3D Error:', error);
    }
}

function createAdvancedParticles() {
    const geometry = new THREE.BufferGeometry();
    const particleCount = 200;
    const positions = new Float32Array(particleCount * 3);
    const velocities = new Float32Array(particleCount * 3);
    const colors = new Float32Array(particleCount * 3);

    for (let i = 0; i < particleCount * 3; i += 3) {
        positions[i] = (Math.random() - 0.5) * 100;
        positions[i + 1] = (Math.random() - 0.5) * 100;
        positions[i + 2] = (Math.random() - 0.5) * 100;

        velocities[i] = (Math.random() - 0.5) * 0.15;
        velocities[i + 1] = (Math.random() - 0.5) * 0.15;
        velocities[i + 2] = (Math.random() - 0.5) * 0.15;

        const colorChoice = Math.random();
        if (colorChoice < 0.5) {
            colors[i] = 0.79; colors[i+1] = 0.64; colors[i+2] = 0.29;
        } else if (colorChoice < 0.75) {
            colors[i] = 0.89; colors[i+1] = 0.34; colors[i+2] = 0.18;
        } else {
            colors[i] = 0.18; colors[i+1] = 0.61; colors[i+2] = 0.86;
        }
    }

    geometry.setAttribute('position', new THREE.BufferAttribute(positions, 3));
    geometry.setAttribute('color', new THREE.BufferAttribute(colors, 3));
    geometry.userData.velocities = velocities;

    const canvas = document.createElement('canvas');
    canvas.width = 64;
    canvas.height = 64;
    const ctx = canvas.getContext('2d');
    
    const gradient = ctx.createRadialGradient(32, 32, 0, 32, 32, 32);
    gradient.addColorStop(0, 'rgba(255, 255, 255, 1)');
    gradient.addColorStop(0.4, 'rgba(201, 162, 75, 0.8)');
    gradient.addColorStop(1, 'rgba(201, 162, 75, 0)');
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, 64, 64);

    const texture = new THREE.CanvasTexture(canvas);
    const material = new THREE.PointsMaterial({
        map: texture,
        sizeAttenuation: true,
        transparent: true,
        opacity: 0.7,
        size: 1.5,
        vertexColors: true
    });

    particles = new THREE.Points(geometry, material);
    scene.add(particles);
}

function createTorusKnot() {
    const geometry = new THREE.TorusKnotGeometry(8, 2.5, 128, 32);
    const material = new THREE.MeshPhongMaterial({
        color: 0x2E9CDB,
        emissive: 0xC9A24B,
        emissiveIntensity: 0.3,
        shininess: 100
    });

    torusKnot = new THREE.Mesh(geometry, material);
    torusKnot.castShadow = true;
    torusKnot.receiveShadow = true;
    torusKnot.position.z = -10;
    scene.add(torusKnot);
}

function createOrbitingSpheres() {
    spheres = [];
    const sphereGeometry = new THREE.IcosahedronGeometry(2, 4);
    const colors = [0xC9A24B, 0xE4572E, 0x2E9CDB, 0x9B4DCA];
    
    for (let i = 0; i < 4; i++) {
        const material = new THREE.MeshPhongMaterial({
            color: colors[i],
            emissive: colors[i],
            emissiveIntensity: 0.2,
            shininess: 50
        });
        
        const sphere = new THREE.Mesh(sphereGeometry, material);
        sphere.castShadow = true;
        sphere.receiveShadow = true;
        
        sphere.userData.angle = (Math.PI * 2 / 4) * i;
        sphere.userData.radius = 18;
        sphere.userData.height = Math.sin(i) * 5;
        
        scene.add(sphere);
        spheres.push(sphere);
    }
}

function createWavePlane() {
    const geometry = new THREE.PlaneGeometry(50, 50, 20, 20);
    const material = new THREE.MeshPhongMaterial({
        color: 0x1a4b50,
        emissive: 0x9B4DCA,
        emissiveIntensity: 0.05,
        side: THREE.DoubleSide
    });

    waves = new THREE.Mesh(geometry, material);
    waves.rotation.x = -Math.PI / 3;
    waves.position.y = -20;
    scene.add(waves);

    const positionAttribute = geometry.getAttribute('position');
    geometry.userData.originalPositions = new Float32Array(positionAttribute.array);
}

function setupLighting() {
    const mainLight = new THREE.PointLight(0xC9A24B, 1.5, 120);
    mainLight.position.set(30, 30, 30);
    mainLight.castShadow = true;
    mainLight.shadow.mapSize.width = 1024;
    mainLight.shadow.mapSize.height = 1024;
    scene.add(mainLight);

    const secondLight = new THREE.PointLight(0xE4572E, 1, 120);
    secondLight.position.set(-30, -20, 20);
    scene.add(secondLight);

    const blueLight = new THREE.PointLight(0x2E9CDB, 0.8, 120);
    blueLight.position.set(0, 30, -30);
    scene.add(blueLight);

    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
    scene.add(ambientLight);
}

function animate() {
    requestAnimationFrame(animate);
    time += 0.005;

    if (torusKnot) {
        torusKnot.rotation.x += 0.002;
        torusKnot.rotation.y += 0.003;
        torusKnot.position.y = Math.sin(time * 0.5) * 2;
    }

    spheres.forEach((sphere, i) => {
        sphere.userData.angle += 0.008 + (i * 0.0015);
        sphere.position.x = Math.cos(sphere.userData.angle) * sphere.userData.radius;
        sphere.position.z = Math.sin(sphere.userData.angle) * sphere.userData.radius + Math.sin(time * 0.3) * 1.5;
        sphere.position.y = sphere.userData.height + Math.cos(time * 0.4 + i) * 1.5;
        
        sphere.rotation.x += 0.0015;
        sphere.rotation.y += 0.0025;
    });

    if (particles) {
        particles.rotation.x += 0.00008;
        particles.rotation.y += 0.00015;
        particles.rotation.z += 0.0001;

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

    if (Math.floor(time * 100) % 2 === 0 && waves) {
        const positionAttribute = waves.geometry.getAttribute('position');
        const originalPositions = waves.geometry.userData.originalPositions;
        
        for (let i = 0; i < positionAttribute.count; i++) {
            const x = originalPositions[i * 3];
            const y = originalPositions[i * 3 + 1];
            const wave = Math.sin(x * 0.08 + time) * Math.cos(y * 0.08 + time) * 1.5;
            
            positionAttribute.setZ(i, originalPositions[i * 3 + 2] + wave);
        }
        
        positionAttribute.needsUpdate = true;
        waves.geometry.computeVertexNormals();
    }

    camera.position.x += (mouseX * 0.3 - camera.position.x) * 0.03;
    camera.position.y += (-mouseY * 0.2 - camera.position.y) * 0.03;
    camera.lookAt(scene.position);

    renderer.render(scene, camera);
}

function onWindowResize() {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
}

function onMouseMove(event) {
    mouseX = (event.clientX / window.innerWidth) * 2 - 1;
    mouseY = -(event.clientY / window.innerHeight) * 2 + 1;
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function() {
        setTimeout(() => init3D(), 100);
    });
} else {
    setTimeout(() => init3D(), 100);
}

window.addEventListener('load', function() {
    if (!renderer) init3D();
});
</script>

</body>
</html>