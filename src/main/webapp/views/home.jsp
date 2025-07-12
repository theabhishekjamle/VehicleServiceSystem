
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>JamleZGarage - Vehicle Service</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="css/style.css">

</head>

<body>
<header>
    <div class="logo"><i class="fas fa-tools"></i> JamleZ <span style="color:white;">Garage</span></div>
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

<button id="floating-button" onclick="document.getElementById('popup').style.display='flex'">
    <i class="fas fa-calendar-check"></i>
</button>

<div id="popup">
    <div class="popup-content">
        <h3>Book Your Service Slot</h3>
        <input type="text" placeholder="Full Name" />
        <input type="email" placeholder="Email Address" />
        <input type="tel" placeholder="Contact Number" />
        <select>
            <option selected disabled>Choose Service Type</option>
            <option>Oil Change</option>
            <option>Battery Replacement</option>
            <option>Car Wash</option>
            <option>General Checkup</option>
        </select>
        <input type="datetime-local" />
        <textarea placeholder="Describe your issue or requirement" rows="4"></textarea>
        <button onclick="document.getElementById('popup').style.display='none'">Submit</button>
    </div>
</div>

<section class="hero">
    <h1>Book Trusted Vehicle Services Online</h1>
    <p>Your car deserves the best. Schedule maintenance, repairs & checkups anytime, anywhere.</p>
</section>

<section class="home-search">
    <input type="text" placeholder="Search services, parts, or support..." />
</section>

<section id="services">
    <h2>Our Services</h2>
    <div class="features">
        <div class="feature-card">
            <img src="https://img.icons8.com/color/96/car-service.png" alt="Instant Booking">
            <h3>Instant Booking</h3>
            <p>Choose your preferred time & location and book vehicle service in seconds.</p>
        </div>
        <div class="feature-card">
            <img src="https://img.icons8.com/color/96/speed.png" alt="Fast Service">
            <h3>Fast Service</h3>
            <p>Certified technicians ensuring quality repairs and quick turnaround.</p>
        </div>
        <div class="feature-card">
            <img src="https://img.icons8.com/color/96/security-checked.png" alt="Genuine Parts">
            <h3>Genuine Parts</h3>
            <p>We use only 100% OEM or equivalent spares for all vehicles.</p>
        </div>
        <div class="feature-card">
            <img src="https://img.icons8.com/color/96/car-battery.png" alt="Battery">
            <h3>Battery Replacement</h3>
            <p>Reliable battery diagnostics and fast replacements to keep your car running smoothly.</p>
        </div>
        <div class="feature-card">
            <img src="https://img.icons8.com/color/96/oil-industry.png" alt="Oil Change">
            <h3>Oil Change</h3>
            <p>High-quality oil and filters to extend the life of your engine.</p>
        </div>
        <div class="feature-card">
            <img src="https://img.icons8.com/color/96/car-wash.png" alt="Car Wash">
            <h3>Car Wash & Detailing</h3>
            <p>Exterior and interior cleaning services with top-notch detailing.</p>
        </div>
    </div>
</section>

<section class="pricing" id="pricing">
    <h2>Pricing Plans</h2>
    <div class="cards">
        <div class="pricing-card">
            <img src="https://img.icons8.com/color/96/settings.png" alt="Basic">
            <h3>Basic Service</h3>
            <p class="price">₹499</p>
            <ul>
                <li>Basic Checkup</li>
                <li>Oil Top-up</li>
                <li>Exterior Wash</li>
            </ul>
        </div>
        <div class="pricing-card">
            <img src="https://img.icons8.com/color/96/car.png" alt="Standard">
            <h3>Standard Service</h3>
            <p class="price">₹999</p>
            <ul>
                <li>Full Inspection</li>
                <li>Oil Change</li>
                <li>Interior Cleaning</li>
                <li>Minor Repairs</li>
            </ul>
        </div>
        <div class="pricing-card">
            <img src="https://img.icons8.com/color/96/car-wash.png" alt="Premium">
            <h3>Premium Service</h3>
            <p class="price">₹1799</p>
            <ul>
                <li>All Standard Service Benefits</li>
                <li>AC Check</li>
                <li>Car Polishing</li>
                <li>Pickup & Drop</li>
            </ul>
        </div>
    </div>
</section>

<section class="facilities" id="facilities">
    <h2>Our Facilities</h2>
    <div class="facility-row">
        <div class="facility-box"><i class="fas fa-wifi"></i> Free Wi-Fi</div>
        <div class="facility-box"><i class="fas fa-coffee"></i> Complimentary Beverages</div>
        <div class="facility-box"><i class="fas fa-tv"></i> Entertainment Lounge</div>
        <div class="facility-box"><i class="fas fa-user-shield"></i> Secure Parking</div>
        <div class="facility-box"><i class="fas fa-tools"></i> Modern Tools</div>
        <div class="facility-box"><i class="fas fa-shield-alt"></i> Insurance Help</div>
        <div class="facility-box"><i class="fas fa-clock"></i> 24x7 Emergency</div>
    </div>

    <div class="facility-row">
        <div class="facility-box"><i class="fas fa-car-side"></i> Free Pickup & Drop</div>
        <div class="facility-box"><i class="fas fa-star"></i> Premium Polishing</div>
        <div class="facility-box"><i class="fas fa-oil-can"></i> Engine Oil Check</div>
        <div class="facility-box"><i class="fas fa-battery-full"></i> Battery Report</div>
        <div class="facility-box"><i class="fas fa-car-crash"></i> Accident Repair</div>
        <div class="facility-box"><i class="fas fa-headset"></i> Support Desk</div>
        <div class="facility-box"><i class="fas fa-gas-pump"></i> Fuel Top-Up</div>
        <div class="facility-box"><i class="fas fa-car-alt"></i> Courtesy Vehicle</div>
        <div class="facility-box"><i class="fas fa-hand-holding-usd"></i> Easy Payments</div>
    </div>

</section>

<%@ include file="footer.jsp" %>

<script src="script/script.js"></script>
</body>

</html>