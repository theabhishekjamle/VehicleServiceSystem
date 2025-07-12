<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Track Vehicle</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>



@keyframes backgroundAnimation {
  0% {
    background-image: url("../images/image1.jpg");
  }
  25% {
    background-image: url("../images/image4.jpg");
  }
  50% {
    background-image: url("../images/image3.jpg");
  }
  75% {
    background-image: url("../images/image2.jpg");
  }
  100% {
    background-image: url("../images/image1.jpg");
  }
}


body {
  font-family: 'Poppins', sans-serif;
   animation: backgroundAnimation 10s infinite alternate;
   background-position: center;
   background-size: cover;
      margin: 0;
      padding: 0;
    }

    .booking-wrapper {
      width: 100%;
      max-width: 900px;
      padding: 20px;
      margin: 60px auto;
    }

    .booking-card {
       backdrop-filter: blur(10px);
        background:rgba(255, 255, 255, 0.618);
      padding: 30px 40px;
      border-radius: 16px;
      box-shadow: 0px 0px 20px rgba(0,0,0,0.4);
    }

    .booking-card h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #333;
      font-weight: 600;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .form-row {
      display: flex;
      gap: 15px;
      flex-wrap: wrap;
    }

    .form-row input {
      flex: 1;
      padding: 12px 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
    }

    .submit-btn {
      background: red;
      color: white;
      border: none;
      padding: 14px;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .submit-btn:hover {
      background: #000000;
    }

    .track-result {
      margin-top: 20px;
      padding: 15px;
      background-color: #f3f3f3;
      border-left: 5px solid #ff4d4d;
      border-radius: 8px;
      color: #222;
      display: none;
    }

    @media (max-width: 600px) {
      .form-row {
        flex-direction: column;
      }
    }
  </style>
</head>

<body>
  <div class="booking-wrapper">
    <div class="booking-card">
      <h2><i class="fas fa-search-location"></i> Track Your Vehicle</h2>

      <form id="track-form" onsubmit="trackVehicle(event)">
        <div class="form-row">
          <input type="text" name="vehicleno" id="track-vehicleno" placeholder="Enter Vehicle Number (e.g., MH12AB1234)" required>
          <input type="text" name="phone" id="track-phone" placeholder="Enter Phone Number" required>
        </div>

        <button type="submit" class="submit-btn"><i class="fas fa-search"></i> Track Now</button>
      </form>

      <div class="track-result" id="track-result">
        <strong>Status:</strong> Vehicle is currently <span style="color:green;">Under Inspection</span>.<br>
        Estimated Delivery: <strong>Tomorrow, 4:00 PM</strong>
      </div>
    </div>
  </div>

  <script>
    function trackVehicle(event) {
      event.preventDefault();

      const resultBox = document.getElementById("track-result");
      resultBox.style.display = "block";

      // Optional: simulate delay
      // setTimeout(() => { resultBox.style.display = "block"; }, 500);
    }
  </script>
</body>
</html>
