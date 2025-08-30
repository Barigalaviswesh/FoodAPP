<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.foodapp.model.Restaurant, com.foodapp.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(45deg, #CCAF6A, #EDDEBB);
    color: #66593B;
    text-align: center;
    padding: 20px;
    background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXm9yzhadg_y4-HYb_5mUdSMO70bTDO1LYaA&s');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

.navbar {
    background-color: #E3CC98;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 30px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

.navbar a {
    color: #A38131;
    text-decoration: none;
    font-size: 18px;
    padding: 10px 15px;
    font-weight: bold;
}

.navbar a:hover {
    background-color: #A38131;
    color: white;
    border-radius: 5px;
}

.user-info {
    font-weight: bold;
    font-size: 18px;
    color: #A38131;
}

.logout-btn {
    background-color: #A38131;
    border: none;
    color: white;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 8px;
    transition: 0.3s;
}

.logout-btn:hover {
    opacity: 0.9;
    transform: scale(1.05);
}

.card-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
}

.card {
    background-color: #E3CC98;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    width: 320px;
    padding: 20px;
    text-align: center;
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
}

.card img {
    width: 100%;
    height: 180px;
    border-radius: 8px;
    object-fit: cover;
    margin-bottom: 10px;
}

.card h3 {
    color: #A38131;
    font-size: 1.5em;
}

.view-menu, .show-more {
    display: inline-block;
    padding: 10px 16px;
    background-color: #A38131;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    margin-top: 10px;
    border: none;
    cursor: pointer;
    transition: 0.3s;
}

.view-menu:hover, .show-more:hover {
    opacity: 0.9;
    transform: scale(1.05);
}

h1{
	color: black;
}

    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    ArrayList<Restaurant> restlist = (ArrayList<Restaurant>) session.getAttribute("restaurant");
%>

<div class="navbar">
    <div>
        <a href="#">Home</a>
        <a href="#">About Us</a>
        <a href="#">Contact</a>
        <a href="#">Restaurants</a>
    </div>
    <div class="user-info">
        <%= user != null ? user.getUsername() : "Guest" %>
        <% if (user != null) { %>
            <form action="LogoutServlet" method="post" style="display:inline;">
                <button class="logout-btn" type="submit">Logout</button>
            </form>
        <% } %>
    </div>
</div>


<h1>RESTAURANT LIST</h1>

<div class="card-container">
    <% if (restlist != null && !restlist.isEmpty()) {
        for (Restaurant r : restlist) { %>
            <div class="card">
                <img src="<%= r.getImgpath() %>" alt="Restaurant Image">
                <h3><%= r.getRestName() %></h3>
                <p>Cuisine: <%= r.getCuisineType() %></p>
                <p>Delivery Time: <%= r.getDeliveryTime() %> min</p>
                <p>Active: <%= r.getIsActive() == 1 ? "Yes" : "No" %></p>
                <p>Ratings: ⭐ <%= r.getRating() %>/5</p>
                <form action="MenuServlet" method="get">
                    <input type="hidden" name="id" value="<%= r.getId() %>">
                    <button type="submit" class="show-more">Show More</button>
                </form>
            </div>
    <% } } else { %>
        <p>No restaurants available.</p>
    <% } %>
</div>

</body>
</html>
