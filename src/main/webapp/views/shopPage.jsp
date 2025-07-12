<%@ page import="java.util.List" %>
<%@ page import="com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Shop Vehicle | JamleZGarage</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color:white;
      color: black;
      margin: 0;

    }

    .shop-container {
      display: flex;
      padding: 2rem;
      gap: 2rem;
      flex-wrap: wrap;
    }

    .filter-panel {
      width: 280px;
      background:white;
      color:black;
      padding: 1.5rem;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.5);
    }

    .filter-panel h3 {
      font-size: 18px;
      margin-bottom: 1rem;
    }

    .filter-panel label {
      font-size: 14px;
      display: block;
      margin-bottom: 8px;
    }

    .car-listings {
      flex: 1;
    }

    .listing-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1rem;
    }

    .car-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 20px;
    }

   .card {
     background-color: #fff;
     color: #000;
     border-radius: 16px;
     overflow: hidden;
     box-shadow: 0 4px 12px rgba(0,0,0,0.5);
     padding: 0;
     transition: transform 0.2s ease;
   }

   .card:hover {
     transform: translateY(-3px);
     z-index: 1;
   }

   .card img {
     width: 100%;
     height: 180px;
     object-fit: cover;
     border-bottom: 1px solid #eee;
   }

   .card h3 {
     font-size: 16px;
     font-weight: 600;
     padding: 0.8rem 1rem 0 1rem;
     margin: 0;
   }

   .car-details {
     font-size: 14px;
     color: #666;
     padding: 0 1rem;
   }

   .price {
     font-size: 18px;
     color: #e50914;
     font-weight: bold;
     padding: 0 1rem;
   }

   .view-details {
     display: block;
     padding: 0.8rem 1rem 0 1rem;
     color: #e50914;
     font-weight: 600;
     font-size: 14px;
     text-decoration: none;
   }

   .location {
     font-size: 12px;
     color: #888;
     padding: 0.5rem 1rem 1rem 1rem;
   }


    .popup-overlay {
      display: none;
      position: fixed;
      z-index: 9999;
      left: 0; top: 0;
      width: 100%; height: 100%;
      background: rgba(0, 0, 0, 0.7);
      justify-content: center;
      align-items: center;
    }

    .popup-content {
      background: #fff;
      padding: 2rem;
      border-radius: 12px;
      width: 600px;
      position: relative;
      font-family: 'Poppins', sans-serif;
      animation: fadeIn 0.3s ease;
      color: #000;
    }

    .popup-content h2 {
      margin-top: 0;
    }

   .popup-content input {
     width: 100%;
     padding: 10px;
     margin-top: 4px;
     border: 1px solid #ccc;
     border-radius: 8px;
     font-size: 14px;
     margin-bottom: 10px;
   }

   .popup-content label {
     font-weight: 500;
     display: block;
     margin-top: 10px;
   }

   .popup-content button[type="submit"] {
     margin-top: 1rem;
     background: #e50914;
     border: none;
     color: white;
     padding: 10px 20px;
     border-radius: 10px;
     cursor: pointer;
     font-size: 16px;
     width: 100%;
   }


    .close-btn {
      position: absolute;
      top: 10px;
      right: 16px;
      font-size: 26px;
      color: #888;
      cursor: pointer;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: scale(0.9); }
      to { opacity: 1; transform: scale(1); }
    }

    #listBTN {
      position: fixed;
      bottom: 30px;
      right: 30px;
      background-color: #e50914;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 10px;
      font-size: 16px;
      cursor: pointer;
      z-index: 9999; /* ✅ Make sure it's always on top */
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
    }

  </style>
</head>

<body>

<div class="shop-container">

  <!-- Floating Button -->
  <button id="listBTN" onclick="openPopup()">List Your Car</button>

  <!-- Popup Form -->
  <div id="popupForm" class="popup-overlay">
    <div class="popup-content" style="max-width: 900px; display: flex; gap: 2rem; align-items: flex-start;">

      <!-- Close Button -->
      <span class="close-btn" onclick="closePopup()">&times;</span>

      <!-- Left: Card Preview -->
      <div class="card" style="flex: 1; margin: 0; box-shadow: 0 2px 10px rgba(0,0,0,0.2);">
        <img id="previewImage" src="https://via.placeholder.com/400x180?text=Preview+Image" alt="Preview">

        <h3 id="previewName">Car Name</h3>

        <p class="car-details" id="previewDetails">
          0 kms &bull; Fuel &bull; Transmission
        </p>

        <p class="price" id="previewPrice">₹0 Lakh</p>

        <a href="#" class="view-details">View Seller Details <i class="fa fa-arrow-right"></i></a>

        <p class="location" id="previewLocation"><i class="fa fa-location-dot"></i> Location</p>
      </div>

      <!-- Right: Form Fields -->
      <form method="post" action="savesellingcar" oninput="previewCarImage()" style="flex: 1;">
        <h2 style="color: #e50914; margin-top: 0;">List Your Car</h2>

        <label>Image URL:</label>
        <input type="text" name="carimage" id="carimage" placeholder="https://..." required>

        <label>Car Name:</label>
        <input type="text" name="carname" id="carname" placeholder="e.g., BMW" required>

        <label>Car Model:</label>
        <input type="text" name="carmodel" id="carmodel" placeholder="e.g., M5 Competition" required>

        <label>Price (₹):</label>
        <input type="text" name="carprice" id="carprice" placeholder="e.g., 45" required>

        <label>Location:</label>
        <input type="text" name="carlocation" id="carlocation" placeholder="e.g., Mumbai" required>

        <button type="submit">Submit</button>
      </form>
    </div>
  </div>


  <!-- Filters -->
  <div class="filter-panel">
    <h3>Filters</h3>
    <label><input type="checkbox"> Under ₹3 Lakh</label>
    <label><input type="checkbox"> ₹3–₹5 Lakh</label>
    <label><input type="checkbox"> Sedan</label>
    <label><input type="checkbox"> SUV</label>
  </div>

  <!-- Car Listings -->
  <div class="car-listings">
    <div class="listing-header">
      <h2>Available Cars</h2>
    </div>

    <div class="car-grid">
      <%
        List<sellingcarModel> cars = (List<sellingcarModel>) request.getAttribute("sellingcars_list");
        if (cars != null && !cars.isEmpty()) {
          for (sellingcarModel car : cars) {
      %>
      <div class="card">
        <img src="<%= car.getCarimage() %>" alt="<%= car.getCarname() %>">

        <h3><%= car.getCarname() %></h3>

        <p class="car-details">
          <%= "6,023 kms" %> &nbsp;&bull;&nbsp;
          <%= "Petrol" %> &nbsp;&bull;&nbsp;
          <%= "Manual" %>
        </p>

        <p class="price">₹<%= car.getCarprice() %> Lakh</p>

        <a href="#" class="view-details">View Seller Details <i class="fa fa-arrow-right"></i></a>

        <p class="location"><i class="fa fa-location-dot"></i> <%= car.getCarlocation() %></p>

        <span style="position:absolute; top: 15px; right: 15px; cursor:pointer;">
          <i class="fa-regular fa-heart" style="color:#333;"></i>
        </span>
      </div>
      <%
          }
        } else {
      %>
      <p>No cars found.</p>
      <%
        }
      %>

    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>
<script>
  function openPopup() {
    document.getElementById('popupForm').style.display = 'flex';
  }

  function closePopup() {
    document.getElementById('popupForm').style.display = 'none';
  }

  function previewCarImage() {
    const imageUrl = document.getElementById("carimage").value;
    const carname = document.getElementById("carname").value;
    const carmodel = document.getElementById("carmodel").value;
    const price = document.getElementById("carprice").value;
    const location = document.getElementById("carlocation").value;

    document.getElementById("previewImage").src = imageUrl || "https://via.placeholder.com/400x180?text=Preview+Image";
    document.getElementById("previewName").innerText = carname || "Car Name";
    document.getElementById("previewDetails").innerText = carmodel || "Kms • Fuel • Transmission";
    document.getElementById("previewPrice").innerText = price ? `₹${price} Lakh` : "₹0 Lakh";
    document.getElementById("previewLocation").innerHTML = `<i class="fa fa-location-dot"></i> ${location || "Location"}`;
  }
</script>


</body>
</html>
