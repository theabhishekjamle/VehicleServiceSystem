<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>JamleZGarage - Header</title>

  <!-- Fonts and Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../css/header.css">
  <style>

  </style>
</head>

<body>

<header>
  <div class="logo">
    <i class="fas fa-tools"></i> JamleZ <span style="color:white;">Garage</span>
  </div>

  <nav>
   <a href="/home">Home</a>
           <a href="/service">Services</a>
           <a href="/trackVehicle">TrackVehicle</a>
           <a href="/shop">Shop</a>
           <a href="#about">About</a>
           <a href="#contact">Contact</a>

  </nav>

   <div class="nav-actions">

          <%
              com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel user =
                  (com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel) session.getAttribute("loggedInUser");
          %>

          <div class="nav-actions">
              <c:if test="${user != null}">
                  <span>Welcome, <%= user.getName() %>!</span>
                  <form action="logout" method="post" style="display:inline;">
                      <button type="submit">Logout</button>
                  </form>
              </c:if>
          </div>

      </div>
</header>

</body>
</html>
