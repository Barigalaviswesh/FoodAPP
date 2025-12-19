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
<<<<<<< HEAD
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #ff6b35, #f7931e);
    color: #333;
    text-align: center;
    padding: 20px;
    min-height: 100vh;
}

.navbar {
    background: linear-gradient(135deg, #ff6b35, #f7931e);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    margin-bottom: 2rem;
}

.navbar a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    padding: 10px 15px;
    font-weight: 500;
    transition: color 0.3s;
}

.navbar a:hover {
    color: #fff3cd;
=======
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
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
}

.user-info {
    font-weight: bold;
    font-size: 18px;
<<<<<<< HEAD
    color: white;
}

.logout-btn {
    background: rgba(255, 255, 255, 0.2);
    border: 2px solid white;
    color: white;
    padding: 8px 16px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 20px;
    transition: 0.3s;
    margin-left: 10px;
}

.logout-btn:hover {
    background: white;
    color: #ff6b35;
=======
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
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
}

.card-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
}

.card {
<<<<<<< HEAD
    background: rgba(255, 255, 255, 0.95);
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
=======
    background-color: #E3CC98;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
    width: 320px;
    padding: 20px;
    text-align: center;
    transition: 0.3s;
<<<<<<< HEAD
    overflow: hidden;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
=======
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
}

.card img {
    width: 100%;
    height: 180px;
<<<<<<< HEAD
    border-radius: 10px;
    object-fit: cover;
    margin-bottom: 15px;
}

.card p {
    color: #666;
    margin-bottom: 8px;
    font-size: 0.95rem;
}

.card h3 {
    color: #ff6b35;
    font-size: 1.5em;
    margin-bottom: 10px;
=======
    border-radius: 8px;
    object-fit: cover;
    margin-bottom: 10px;
}

.card h3 {
    color: #A38131;
    font-size: 1.5em;
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
}

.view-menu, .show-more {
    display: inline-block;
<<<<<<< HEAD
    padding: 12px 24px;
    background: linear-gradient(135deg, #ff6b35, #f7931e);
    color: white;
    text-decoration: none;
    border-radius: 25px;
    margin-top: 15px;
    border: none;
    cursor: pointer;
    transition: 0.3s;
    font-weight: 600;
}

.view-menu:hover, .show-more:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3);
}

h1{
	color: white;
	font-size: 2.5rem;
	margin-bottom: 2rem;
	text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
=======
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
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
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
<<<<<<< HEAD
        <a href="index.html" style="color: white; text-decoration: none; font-size: 1.8rem; font-weight: bold;">🍕 FoodApp</a>
        <a href="about.html">About Us</a>
        <a href="contact.html">Contact</a>
        <a href="HomeServlet">Restaurants</a>
    </div>
    <div class="user-info">
        Welcome, <%= user != null ? user.getUsername() : "Guest" %>
=======
        <a href="#">Home</a>
        <a href="#">About Us</a>
        <a href="#">Contact</a>
        <a href="#">Restaurants</a>
    </div>
    <div class="user-info">
        <%= user != null ? user.getUsername() : "Guest" %>
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
        <% if (user != null) { %>
            <form action="LogoutServlet" method="post" style="display:inline;">
                <button class="logout-btn" type="submit">Logout</button>
            </form>
<<<<<<< HEAD
        <% } else { %>
            <a href="login.html" style="margin-left: 10px; color: white; padding: 8px 16px; border: 2px solid white; border-radius: 20px; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='white'; this.style.color='#ff6b35';" onmouseout="this.style.background='transparent'; this.style.color='white';">Login</a>
=======
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
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
<<<<<<< HEAD
        <!-- Sample restaurants when database is empty -->
        <div class="card">
            <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=300&h=200&fit=crop" alt="Pizza Palace">
            <h3>Pizza Palace</h3>
            <p>Cuisine: Italian</p>
            <p>Delivery Time: 25 min</p>
            <p>Active: Yes</p>
            <p>Ratings: ⭐ 4.5/5</p>
            <button class="show-more">Show More</button>
        </div>
        
        <div class="card">
            <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=300&h=200&fit=crop" alt="Burger Barn">
            <h3>Burger Barn</h3>
            <p>Cuisine: American</p>
            <p>Delivery Time: 20 min</p>
            <p>Active: Yes</p>
            <p>Ratings: ⭐ 4.2/5</p>
            <button class="show-more">Show More</button>
        </div>
        
        <div class="card">
            <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=300&h=200&fit=crop" alt="Spice Garden">
            <h3>Spice Garden</h3>
            <p>Cuisine: Indian</p>
            <p>Delivery Time: 35 min</p>
            <p>Active: Yes</p>
            <p>Ratings: ⭐ 4.7/5</p>
            <button class="show-more">Show More</button>
        </div>
        
        <div class="card">
            <img src="https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=300&h=200&fit=crop" alt="Sushi Spot">
            <h3>Sushi Spot</h3>
            <p>Cuisine: Japanese</p>
            <p>Delivery Time: 30 min</p>
            <p>Active: Yes</p>
            <p>Ratings: ⭐ 4.6/5</p>
            <button class="show-more">Show More</button>
        </div>
        
        <div class="card">
            <img src="https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=300&h=200&fit=crop" alt="Taco Time">
            <h3>Taco Time</h3>
            <p>Cuisine: Mexican</p>
            <p>Delivery Time: 15 min</p>
            <p>Active: Yes</p>
            <p>Ratings: ⭐ 4.3/5</p>
            <button class="show-more">Show More</button>
        </div>
        
        <div class="card">
            <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=300&h=200&fit=crop" alt="Pasta Paradise">
            <h3>Pasta Paradise</h3>
            <p>Cuisine: Italian</p>
            <p>Delivery Time: 28 min</p>
            <p>Active: Yes</p>
            <p>Ratings: ⭐ 4.4/5</p>
            <button class="show-more">Show More</button>
        </div>
=======
        <p>No restaurants available.</p>
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
    <% } %>
</div>

</body>
</html>
