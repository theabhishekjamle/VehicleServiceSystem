<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>JamleZGarage - Admin Portal</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>

    </style>
</head>
<body>


<!-- Auth Forms -->
<div class="main-container">
    <div class="auth-container">
        <div class="toggle-buttons">
            <button id="loginToggle" class="active">Admin Login</button>
            <button id="signupToggle">Admin Sign Up</button>
        </div>

        <!-- Login Form -->
        <div class="form-box active" id="loginForm">
            <h2>Admin Login</h2>
            <form action="adminLoginHere" method="post">
                <div class="input-group">
                    <i class="fas fa-key"></i>
                    <input type="text" name="adminId"  placeholder="AdminID" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit">Login</button>
            </form>
            <div class="toggle-link">Don't have an admin account? <a href="#" onclick="switchForm('signup')">Sign Up</a></div>
        </div>

        <!-- Signup Form -->
        <div class="form-box" id="signupForm">
            <h2>Admin Sign Up</h2>
            <form action="adminSignup" method="post">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" placeholder="Full Name" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-key"></i>
                    <input type="text" name="adminId" placeholder="AdminID" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Email" required>
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

<!-- JS -->
<script src="../script/admin.js"></script>
</body>
</html>
