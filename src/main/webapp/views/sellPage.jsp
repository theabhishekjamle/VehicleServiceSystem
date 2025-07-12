
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String favorite = request.getParameter("favorite");
if (favorite == null) {
favorite = "0";
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Info</title>
</head>
<body>

<%
    String favt = request.getParameter("0");
    String image = request.getParameter("image");
    String carname = request.getParameter("carname");
    String carmodel = request.getParameter("carmodel");
    String price = request.getParameter("price");
    String phone = request.getParameter("phone");
%>

<h2>Car Details:</h2>
 if (favorite == null) favorite = "false";

  out.println("Favorite: " + favorite);
<p><strong>Favorite:</strong> <%= favt %></p>
<p><strong>Image URL:</strong> <%= image %></p>
<p><strong>Car Name:</strong> <%= carname %></p>
<p><strong>Model:</strong> <%= carmodel %></p>
<p><strong>Price:</strong> <%= price %></p>
<p><strong>Phone:</strong> <%= phone %></p>

</body>
</html>
