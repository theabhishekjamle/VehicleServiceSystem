<%@ page import="java.util.List" %>
<%@ page import="com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Cars - JamleZGarage</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #111;
            color: #fff;
            margin: 0;
            padding: 20px;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .card {
            width: 250px;
            background-color: #1c1c1c;
            border: 1px solid #333;
            border-radius: 10px;
            overflow: hidden;
            padding: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.6);
        }
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        .card h3, .card p {
            margin: 8px 0;
        }
    </style>
</head>
<body>
    <h1>Available Cars</h1>

    <div class="card-container">
        <%
            List<sellingcarModel> cars = (List<sellingcarModel>) request.getAttribute("sellingcars_list");
            if (cars != null) {
                for (sellingcarModel car : cars) {
        %>
            <div class="card">
                <img src="<%= car.getCarimage() %>" alt="<%= car.getCarname() %>" />
                <h3><%= car.getCarname() %></h3>
                <p><strong>Model:</strong> <%= car.getCarmodel() %></p>
                <p><strong>Price:</strong> ₹<%= car.getCarprice() %></p>
                <p><strong>Location:</strong> <%= car.getCarlocation() %></p>
            </div>
        <%
                }
            } else {
        %>
            <p>No cars available.</p>
        <%
            }
        %>
    </div>
</body>
</html>
