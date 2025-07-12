<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>JamleZGarage - Auth Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/login.css">

</head>
<body>

<!-- Navbar -->
<header>
    <div class="logo"><i class="fas fa-tools"></i> JamleZ <span style="color:white;">Garage</span></div>
    <nav>
        <a href="index.html">Home</a>
        <a href="loginPage">Services</a>
        <a href="loginPage">TrackVehicle</a>
        <a href="loginPage">About</a>
        <a href="loginPage">Contact</a>

    </nav>
    <div class="nav-actions">
        <button class="login-btn" onclick="switchForm('login')">Login</button>
        <button class="signup-btn" onclick="switchForm('signup')">Sign Up</button>
    </div>
</header>

<!-- Auth Forms -->
<div class="main-container">
    <div class="auth-container">
        <div class="toggle-buttons">
            <button id="loginToggle" class="active">Login</button>
            <button id="signupToggle">Sign Up</button>
        </div>

        <!-- Login Form -->
        <div class="form-box active" id="loginForm">
            <h2>User Login</h2>
            <form  action="userLogin" method="post">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="email" placeholder="Email" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit">Login</button>

            </form>
            <div class="toggle-link">Don't have an account? <a href="#" onclick="switchForm('signup')">Sign Up</a></div>
        </div>

        <!-- Signup Form -->
        <div class="form-box" id="signupForm">
            <h2>User Sign Up</h2>

            <form action="signupPage" method="post">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" placeholder="Full Name" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email"  name="email" placeholder="Email Address" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-phone"></i>
                    <input type="text" name="phone" placeholder="Phone" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit">Sign Up</button>

            </form>
            <div class="toggle-link">Already have an account? <a href="#" onclick="switchForm('login')">Login</a></div>
        </div>
    </div>
</div>

<script src="../script/login.js"></script>

</body>
</html>
