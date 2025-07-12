<%@ page import="java.util.List" %>
<%@ page import="com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel" %>
<%@ page import="com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel" %>
<%@ page import="com.VehicleServiceSystem.VehicleServiceSystem.Model.bookingModel" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>JamleZGarage Admin Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --dark-bg: #f9f9f9;
      --card-bg: #1a1a1a;
      --text-light: #000000;
      --text-white: #000000;
      --primary: #1a1a19;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: rgb(0, 0, 0);
      color: var(--text-white);
      display: flex;
      margin: 0;
    }

    .sidebar {
      width: 240px;
      padding: 2rem 1rem;

      border-radius: 15px;
      height: 90vh;
      display: flex;
      flex-direction: column;
      justify-content: space-between;

    }

    .sidebar-nav{
      color: rgb(225, 222, 222);
      padding: 20px;
      background: rgb(12,12,12);
      border-radius: 15px;



    }
    .sidebar-nav a {
      color: grey;
      text-decoration: none;
      display: flex;
      margin: 5px;
      align-items: center;
      gap: 1rem;
      padding: 0.7rem 1rem;

      cursor: pointer;
      transition: 0.2s;
    }

    .sidebar-nav a:hover,
    .sidebar-nav a.active {
      transition: 0.1s;
      border-radius: 0px;
      border-left: solid 1px rgb(255, 255, 255);
      color: rgb(255, 255, 255);
      font-weight: bold;
      transform: translateX(4px);

    }

    .sidebar-footer {
      text-align: center;
    }

    .sidebar-footer form {
      margin-top: 10px;
    }


    .main {
      flex: 1;
      padding: 2rem;

    }

    .section-box {
      display: none;
      color: white;
      background: rgb(12,12,12);
      padding: 1.5rem;
      border-radius: 10px;
      margin-bottom: 1rem;
    }

    .section-box.active {
      display: block;
    }

   .cards {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    animation: fadeIn 0.6s ease-in-out;

    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

  /* Individual card styling */
  .card {
      flex: 1 1 200px;
      background:linear-gradient(45deg,rgb(19, 19, 19),rgb(22, 22, 22));
      backdrop-filter: blur(40px);;
      border: solid rgb(141, 140, 140) 0px;
      color: rgb(227, 227, 227);
      border-radius: 15px;
      padding: 20px;
      box-shadow: 0 0px 5px rgba(187, 186, 186, 0.327);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      cursor: pointer;


    }

    /* Hover effect */
    .card:hover {
      transform: translateY(-7px);
       box-shadow: 0 0px 5px rgba(187, 186, 186, 0.327);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      transition: 0.3s;
      background: linear-gradient(45deg,rgb(0, 0, 0),black,rgb(85, 84, 84));
      color: white;

    }

  /* Animate section boxes */
  .section-box {
    display: none;
    animation: fadeIn 0.5s ease-in-out;
  }

  .section-box.active {
    display: block;
  }

  .logout_btn{
    background: rgb(149, 149, 149);
    font-family: 'Poppins';
    font-weight: bold;
    text-transform: uppercase;
    color:rgb(0, 0, 0);
    padding: 7px 30px;
    border-radius: 20px;
     border: solid grey 2px;
    cursor: pointer;
    margin:30px 45px;
    transition: background-color 0.3s, color 0.3s, border 0.3s;
  }
    .logout_btn:hover{
     background-color: rgb(0, 0, 0);
     color: white;
     border: solid white 2px;
      transition: background-color 0.3s, color 0.3s, border 0.3s;
    }
  /* Slide up card animation */
  @keyframes slideUp {
    from {
      transform: translateY(20px);
      opacity: 0;
    }
    to {
      transform: translateY(0px);
      opacity: 1;
    }
  }

  /* Fade in for sections */
  @keyframes fadeIn {
    from {
      opacity: 0;
    }
    to {
      opacity: 1;
    }
  }

  /* Customer Panel Styling */
  #customers {

    padding: 2rem;
    border-radius: 12px;
    color: #ffffff;
    animation: fadeIn 0.4s ease-in-out;
  }

  /* Search Bar Styling */
  #customers input[type="text"] {
    width: 50%;
    padding: 12px 16px;
    font-size: 1rem;
    margin-bottom: 20px;
    border-radius: 10px;
    border: none;
    outline: none;
    background-color: #1f1f1f;
    color: white;
    box-shadow: inset 0 0 5px #000000;
    transition: all 0.3s ease;
  }

  #customers input[type="text"]:focus {
    box-shadow: 0 0 5px white;
    border: 1px solid white;
  }

  /* Table Styling */
   table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 12px;
    overflow: hidden;
    background: #1a1a1a;
    color: white;
     animation: fadeIn 0.6s ease-in-out;

     transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

   th, td {
    padding: 14px 18px;
    text-align: left;
  }

   thead {
    background-color: #2a2a2a;
    color: white;
    text-transform: uppercase;
    font-weight: 600;
    font-size: 0.85rem;
  }

   tr {
    border-bottom: 1px solid #2f2f2f;
    transition: 0.3s;
  }

   tbody tr:hover {
    background-color: #2b2b2b;
    color: #fff;
  }

  /* No Users Message */
   h2 {
    text-align: center;
    margin-top: 2rem;
    color: #ccc;
  }

  /* Entry Animation */
  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .search_box{
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      transition: all 0.5s ;

    }

    .searchBtn input{
      font-family: "Poppins";
      padding:12px 22px;
      width: 300px;
      margin: 10px;
      background: rgb(49, 49, 49);
      color:white;
      border: none;
      border-radius: 5px;
      transition: all 0.2s ;

    }
     .searchBt input[type="text"]:focus {
       border: solid grey 0;
       transition: all 0.5s ;
      outline: none;
     }

    .addBtn input{
       font-family: "Poppins";
      padding:10px 20px; margin: 10px;
      background: rgb(217, 214, 214);
      border-radius: 5px;
      transition: all 0.2s ;
       cursor: pointer;
    }
    .addBtn input:hover {
      transform: translateY(-4px);

      transition: all 0.2s ;
      cursor: pointer;
    }

    .car-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        padding: 10px;
         animation: fadeIn 0.6s ease-in-out;

         transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .car-card {
        width: 250px;
        background:linear-gradient(45deg,rgb(19, 19, 19),rgb(22, 22, 22));
        color: grey;
        padding: 15px;
        border-radius: 10px;
         animation: fadeIn 0.6s ease-in-out;
         box-shadow: 0 0px 5px rgba(187, 186, 186, 0.327);
         transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .car-card:hover {
        transform: translateY(-7px);
       animation: fadeIn 0.6s ease-in-out;
       box-shadow: 0 0px 5px rgba(187, 186, 186, 0.327);
       transition: transform 0.3s ease, box-shadow 0.3s ease;
        color:white;
        cursor:pointer;
        background: linear-gradient(45deg,rgb(0, 0, 0),black,rgb(85, 84, 84));
    }

    .car-img {
        width: 100%;
        height: 160px;
        object-fit: cover;
        border-radius: 8px;
        margin-bottom: 10px;
    }

    .btn {
        background-color: #f39c12;
        border: none;
        padding: 8px 12px;
        color: white;
        cursor: pointer;
        border-radius: 5px;
    }

    .btn:hover {
        background-color: #e67e22;
    }


.service-cards-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 1.5rem;
  margin-top: 1rem;
}

.service-card {
 flex: 1 1 200px;
    background:linear-gradient(45deg,rgb(19, 19, 19),rgb(22, 22, 22));
    backdrop-filter: blur(40px);;
    border: solid rgb(141, 140, 140) 0px;
    color: rgb(227, 227, 227);
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 0px 5px rgba(187, 186, 186, 0.327);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
     transition: 0.3s;


}

.service-card h3 {

  margin-bottom: 0.3rem;
  font-size: 1.2rem;
}

.service-card.pending {
  border-left: 4px solid #ffcc00;
}

.service-card.in-progress {
  border-left: 4px solid #00bfff;
}

.service-card.completed {
  border-left: 4px solid #28a745;
}

.service-card.add-more {
  border-left: 4px solid #888;
  background-color: #333344;
}

.service-card:hover {
   transform: translateY(-7px);
     box-shadow: 0 0px 5px rgba(187, 186, 186, 0.327);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    transition: 0.3s;
    background: linear-gradient(45deg,rgb(0, 0, 0),black,rgb(85, 84, 84));
    color: white;
}
  </style>
</head>
<body>

<!-- <%-- JSP admin model --%>
<%@ page import="com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel" %>
<%
    adminDataModel admin = (adminDataModel) session.getAttribute("loggedInAdmin");
%> -->

<!-- Sidebar -->
<aside class="sidebar">

  <div class="sidebar-nav">
      <h1>JamleZGarage</h1>
    <a class="menu-link active" onclick="showSection('dashboard')"><i class="fas fa-chart-line"></i> Dashboard</a>
    <a class="menu-link" onclick="showSection('customers')"><i class="fas fa-user"></i> Customers</a>
    <a class="menu-link " onclick="showSection('services')"><i class="fas fa-gear"></i> Services</a>
    <a class="menu-link " onclick="showSection('forsellcars')"><i class="fas fa-car"></i>For Sell Cars</a>
    <a class="menu-link" onclick="showSection('insurance')"><i class="fas fa-file-invoice"></i> Insurance</a>
    <a class="menu-link " onclick="showSection('trackvehicle')"><i class="fas fa-search"></i> Track Vehicle</a>
    <a class="menu-link " onclick="showSection('updatevehicle')"><i class="fa-solid fa-thumbs-up"></i>Update Vehicle</a>
    <a class="menu-link" onclick="showSection('employees')"><i class="fas fa-users"></i> Employees</a>
    <a class="menu-link" onclick="showSection('cash')"><i class="fas fa-money-bill"></i> Cash</a>
    <form action="adminlogout" method="post" style="display: inline;">
        <input type="submit" value="Logout" class="logout_btn">
    </form>



</aside>

<!-- Java Code -->

<%
int totalCustomer = 0;
List<userDataModel> users = (List<userDataModel>) request.getAttribute("user_data");
if (users != null) {
  totalCustomer = users.size();
}

int totalSellingCar=0;
List<sellingcarModel> cars = (List<sellingcarModel>) request.getAttribute("sellingcars_list");
if (cars != null) {
  totalSellingCar = cars.size();
}

int totalbooking=0;
List<bookingModel> booking = (List<bookingModel>) request.getAttribute("bookingservice");
if (booking != null) {
  totalbooking = booking.size();
}
%>

<!-- Main content -->
<main class="main">
  <!-- Dashboard -->
  <div id="dashboard" class="section-box active">
    <h2 style="margin-bottom: 1rem;">📊 Dashboard Overview</h2>
       <div class="cards">
        <div class="card">
          <i class="fas fa-users"></i>
          <h3>Total Customers</h3>
          <p> <%=totalCustomer%> registered</p>
        </div>
        <div class="card">
          <i class="fas fa-user-tie"></i>
          <h3>Total Employees</h3>
          <p>88 onboard</p>
        </div>
        <div class="card">
          <i class="fas fa-calendar-check"></i>
          <h3>Active Bookings</h3>
          <p> <%=totalbooking%> in progress</p>
        </div>
        <div class="card">
          <i class="fas fa-car"></i>
          <h3>Cars for Sale</h3>
          <p><%=totalSellingCar%> listed</p>
        </div>
        <div class="card">
          <i class="fas fa-money-bill-wave"></i>
          <h3>Revenue</h3>
          <p>₹1,20,000 this month</p>
        </div>
    </div>
  </div>



  <!-- customers -->
  <div id="customers" class="section-box">
    <h2> 👥 Customers Panel</h2>
    <p>Details about vehicle insurance claims and partners.</p>

    <div class="">
    <input type="text" placeholder="Search Name Email Phone ...">

         <table>

         <thead>
               <tr>
                         <th style="padding: 12px;">ID</th>
                         <th style="padding: 12px;">Name</th>
                         <th style="padding: 12px;">Email</th>
                         <th style="padding: 12px;">Phone</th>

               </tr>
         </thead>

         <tbody>
             <%
             if (users != null && !users.isEmpty()) {
                 for (userDataModel user : users) {
             %>
                 <tr style="border-bottom: 1px solid #333;">
                          <td style="padding: 10px;"><%= user.getId() %></td>
                          <td style="padding: 10px;"><%= user.getName() %></td>
                          <td style="padding: 10px;"><%= user.getEmail() %></td>
                          <td style="padding: 10px;"><%= user.getPhone() %></td>

                 </tr>
             <%
                 }
             } else {
             %>
                 <h2>No users found.</h2>
             <%
             }
             %>


  </tbody>
 </table>
    </div>

  </div>



   <div id="services" class="section-box">
    <h2>🛠️ Service Panel</h2>
    <div class="service-cards-container">

      <!-- Pending Services -->
      <div class="service-card pending">
        <i class="fas fa-hourglass-half"></i>
        <h3>Pending Services</h3>
        <p>12 Bookings</p>
      </div>

      <!-- In Progress -->
      <div class="service-card in-progress">
        <i class="fas fa-tools"></i>
        <h3>In Progress</h3>
        <p>5 Vehicles</p>
      </div>

      <!-- Completed -->
      <div class="service-card completed">
        <i class="fas fa-check-circle"></i>
        <h3>Completed</h3>
        <p>30 Services</p>
      </div>

      <!-- Add New -->
      <div class="service-card add-more">
        <i class="fas fa-plus-circle"></i>
        <h3>Add New Service</h3>
        <p>Create new service type</p>
      </div>

    </div>
  </div>


 <div id="forsellcars" class="section-box">
     <h2>For Sell Car Panel</h2>
     <p>Browse available cars listed for sale.</p>

     <div class="car-grid">
         <%
             List<sellingcarModel> carList = (List<sellingcarModel>) request.getAttribute("sellingcars_list");
             if (carList != null && !carList.isEmpty()) {
                 for (sellingcarModel car : carList) {
         %>
             <div class="car-card">
                 <img src="<%= car.getCarimage() %>" alt="Car Image" class="car-img">
                 <h3><%= car.getCarname() %></h3>
                 <p><strong>Model:</strong> <%= car.getCarmodel() %></p>
                 <p><strong>Price:</strong> ₹<%= car.getCarprice() %></p>
                 <p><strong>Price:</strong> ₹<%= car.getCarlocation() %></p>

                 <form action="viewCarDetails" method="get">
                     <input type="hidden" name="id" value="<%= car.getId() %>" />
                     <button type="submit" class="btn">View Details</button>
                 </form>
             </div>
         <%
                 }
             } else {
         %>
             <p>No cars available for sale.</p>
         <%
             }
         %>
     </div>
 </div>
  <div id="insurance" class="section-box">
    <h2>insurance Panel</h2>
    <p>Details about vehicle insurance claims and partners.</p>
  </div>


  <div id="trackvehicle" class="section-box">
    <h2>Track Vehicle Panel</h2>
    <p>Details about vehicle insurance claims and partners.</p>
     <div class="search_box">
          <div class="searchBtn">
             <input type="text" id="serviceSearch" placeholder="Search Services">
          </div>
          <div class="addBtn">
            <input type="button" value="Add Services">
          </div>
        </div>

        <div class="tableContent">
            <%
                if (booking != null && !booking.isEmpty()) {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>S.No</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Vehicle Number</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Service</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (bookingModel bookingDetail : booking) {
                        %>
                            <tr>
                                <td><%= bookingDetail.getId() %></td>
                                <td><%= bookingDetail.getDate() %></td>
                                <td><%= bookingDetail.getTime() %></td>
                                <td><%= bookingDetail.getVehicleno() %></td>
                                <td><%= bookingDetail.getName() %></td>
                                <td><%= bookingDetail.getPhone() %></td>
                                <td><%= bookingDetail.getService() %></td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            <%
                } else {
            %>
                <h2>No users found.</h2>
            <%
                }
            %>
        </div>
  </div>
  <div id="updatevehicle" class="section-box">
    <h2>Update Vehicle Service Panel</h2>
    <p>Details about vehicle insurance claims and partners.</p>
  </div>
  <div id="employees" class="section-box">
    <h2>Update Vehicle Service Panel</h2>
    <p>Details about vehicle insurance claims and partners.</p>
  </div>





  <!-- Cash -->
  <div id="cash" class="section-box">
    <h2>Cash & Billing</h2>
    <p>Track payments, receipts, and invoicing here.</p>
  </div>
</main>

<script>
  function showSection(sectionId) {
    // Hide all
    document.querySelectorAll('.section-box').forEach(box => box.classList.remove('active'));
    // Show the selected one
    document.getElementById(sectionId).classList.add('active');

    // Sidebar highlighting
    document.querySelectorAll('.menu-link').forEach(link => link.classList.remove('active'));
    event.target.closest('.menu-link').classList.add('active');
  }
</script>
<script>
  // Optional: Section Switching Logic
  const buttons = document.querySelectorAll(".menu-btn");
  const sections = document.querySelectorAll(".section-box");

  buttons.forEach((btn, index) => {
    btn.addEventListener("click", () => {
      sections.forEach(sec => sec.classList.remove("active"));
      sections[index].classList.add("active");
    });
  });

  function searchCustomers() {
      const input = document.getElementById("customerSearch");
      const filter = input.value.toLowerCase();
      const table = document.getElementById("customerTable");
      const rows = table.getElementsByTagName("tr");

      for (let i = 1; i < rows.length; i++) {
        let match = false;
        const cells = rows[i].getElementsByTagName("td");
        for (let j = 0; j < cells.length; j++) {
          const cell = cells[j];
          if (cell && cell.innerText.toLowerCase().includes(filter)) {
            match = true;
            break;
          }
        }
        rows[i].style.display = match ? "" : "none";
      }
    }
</script>
<script>
  function searchCustomers() {
    const input = document.querySelector("#customers input[type='text']");
    const filter = input.value.toLowerCase();
    const rows = document.querySelectorAll("#customers tbody tr");

    rows.forEach(row => {
      const text = row.innerText.toLowerCase();
      row.style.display = text.includes(filter) ? "" : "none";
    });
  }

  // Hook up input to search function
  document.querySelector("#customers input[type='text']").addEventListener("keyup", searchCustomers);

</script>

<script>
  function searchService() {
    const input = document.getElementById("serviceSearch");
    const filter = input.value.toLowerCase();
    const rows = document.querySelectorAll("#trackvehicle    tbody tr");

    rows.forEach(row => {
      const text = row.innerText.toLowerCase();
      row.style.display = text.includes(filter) ? "" : "none";
    });
  }

  document.getElementById("serviceSearch").addEventListener("keyup", searchService);
</script>



</body>
</html>
