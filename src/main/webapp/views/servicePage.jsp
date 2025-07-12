<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Vehicle Slot Booking</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../css/service.css">


</head>
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
   }



    .booking-wrapper {
      width: 100%;
      max-width: 900px;
      padding: 20px;
      margin:auto;
      margin-top:60px;
    }

    .booking-card {
      backdrop-filter: blur(10px);
      background:rgba(255, 255, 255, 0.618);
      padding: 30px 40px;
      border-radius: 16px;
      box-shadow: 0px 0px 20px rgba(0,0,0,0.4);
      transition: all 0.3s ease-in-out;
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

    .form-row input,
    .form-row select {
      flex: 1;
      padding: 12px 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
    }

    input[type="date"] {
      background-color: #ffffff;
      border: 1px solid #444;
      color: #000000;
      padding: 12px 16px;
      border-radius: 8px;
      font-size: 14px;
      transition: border 0.3s ease, background 0.3s ease;
    }

    .appointment-block label {
      font-weight: 500;
      display: block;
      margin: 10px 0 6px;
      color: #444;
    }

    .time-slots {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      margin-top: 10px;
    }

    .slot {
      padding: 10px 15px;
      border: 1px solid #000000;
      background: white;
      color: #000000;
      border-radius: 6px;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .slot.selected {
      background: #171717;
      color: white;
    }

    .slot:hover {
      background: #000000;
      color: white;
    }

    .submit-btn {
      background: red;
      color: white;
      border: none;
      padding: 14px;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      margin-top: 20px;
      transition: background 0.3s ease;
    }

    .submit-btn:hover {
      background: #000000;
    }

    @media (max-width: 600px) {
      .form-row {
        flex-direction: column;
      }

      .time-slots {
        justify-content: space-between;
      }

      .slot {
        flex: 1 1 40%;
        text-align: center;
      }
    }</style>
<body>
  <div class="booking-wrapper">
    <div class="booking-card">
      <h2><i class="fas fa-car"></i> Vehicle Slot Booking</h2>

      <form action="bookService" method="post">
        <div class="form-row">
          <input type="text" name="name" placeholder="Full Name" required>
          <input type="text" name="phone" placeholder="Phone Number" required>
        </div>

        <div class="form-row">
          <input type="text" name="vehicleno" placeholder="Vehicle Number" required>
          <select name="service" required>
           <option value="Oil and Filter Change">Oil and Filter Change</option>
               <option value="Air Filter Replacement">Air Filter Replacement</option>
               <option value="Fuel Filter Replacement">Fuel Filter Replacement</option>
               <option value="Cabin Air Filter Replacement">Cabin Air Filter Replacement</option>
               <option value="Coolant Flush">Coolant Flush</option>
               <option value="Transmission Fluid Change">Transmission Fluid Change</option>
               <option value="Brake Fluid Replacement">Brake Fluid Replacement</option>
               <option value="Battery Check and Replacement">Battery Check and Replacement</option>
               <option value="Wiper Blade Replacement">Wiper Blade Replacement</option>
               <option value="Spark Plug Replacement">Spark Plug Replacement</option>

               <!-- Mechanical Repairs -->
               <option value="Engine Repair/Overhaul">Engine Repair/Overhaul</option>
               <option value="Transmission Repair">Transmission Repair</option>
               <option value="Clutch Replacement">Clutch Replacement</option>
               <option value="Suspension Repair">Suspension Repair</option>
               <option value="Steering Repair">Steering Repair</option>

               <!-- Electrical Repairs -->
               <option value="Headlight/Taillight Repair">Headlight/Taillight Repair</option>
               <option value="Starter Motor Replacement">Starter Motor Replacement</option>
               <option value="Alternator Repair">Alternator Repair</option>
               <option value="Wiring Inspection">Wiring Inspection</option>

               <!-- AC and Heating -->
               <option value="AC Gas Refill">AC Gas Refill</option>
               <option value="AC Compressor Repair">AC Compressor Repair</option>
               <option value="Heater Repair">Heater Repair</option>

               <!-- Body and Paint -->
               <option value="Dent Removal">Dent Removal</option>
               <option value="Full Body Paint">Full Body Paint</option>
               <option value="Bumper Repair">Bumper Repair</option>
               <option value="Windshield Replacement">Windshield Replacement</option>

               <!-- Tyre and Wheel -->
               <option value="Tyre Replacement">Tyre Replacement</option>
               <option value="Wheel Alignment">Wheel Alignment</option>
               <option value="Wheel Balancing">Wheel Balancing</option>
               <option value="Alloy Wheel Repair">Alloy Wheel Repair</option>

               <!-- Others -->
               <option value="Diagnostic Check">Diagnostic Check</option>
               <option value="Pre-Purchase Inspection">Pre-Purchase Inspection</option>
               <option value="Custom Modification">Custom Modification</option>
               <option value="Insurance Claim Assistance">Insurance Claim Assistance</option>

          </select>
        </div>

        <div class="appointment-block">
          <label><i class="fas fa-calendar-alt"></i> Select Date</label>
          <input type="date" name="date" required>

          <label><i class="fas fa-clock"></i> Select Time</label>
          <div class="time-slots">
            <button type="button" class="slot">09:00</button>
            <button type="button" class="slot">10:00</button>
            <button type="button" class="slot">11:00</button>
            <button type="button" class="slot">12:00</button>
            <button type="button" class="slot">14:00</button>
            <button type="button" class="slot">15:00</button>
            <button type="button" class="slot">16:00</button>
            <button type="button" class="slot">17:00</button>
          </div>
          <input type="hidden" name="time" id="selected-time" required>
        </div>

        <button type="submit" class="submit-btn">Confirm Booking</button>
      </form>
    </div>
  </div>

  <script>
    const slots = document.querySelectorAll('.slot');
    const timeInput = document.getElementById('selected-time');
    const form = document.querySelector('form');

    slots.forEach(btn => {
      btn.addEventListener('click', () => {
        slots.forEach(s => s.classList.remove('selected'));
        btn.classList.add('selected');
        timeInput.value = btn.textContent;
      });
    });

    form.addEventListener('submit', (e) => {
      if (!timeInput.value) {
        e.preventDefault();
        alert("Please select a time slot.");
      }
    });
  </script>

</body>
</html>
