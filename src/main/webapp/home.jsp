<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.foodapp.model.Restaurant, com.foodapp.model.Cart, com.foodapp.model.User" %>

<%
    // Get user from session
    User loggedInUser = (User) session.getAttribute("user");
    String userName = (loggedInUser != null) ? loggedInUser.getUsername() : "Guest";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodApp - Home</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #fff;
}

/* ===== NAVBAR ===== */
.navbar {
    background: #fff;
    padding: 15px 40px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0 2px 6px rgba(0,0,0,.08);
    position: sticky;
    top: 0;
    z-index: 100;
}

.logo-container {
    display: flex;
    align-items: center;
    gap: 20px;
}

.logo {
    background: #fc8019;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 4px;
    color: white;
    font-size: 20px;
    font-weight: bold;
    padding: 10px 16px;
    white-space: nowrap;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 30px;
}

.nav-links a {
    text-decoration: none;
    color: #333;
    font-weight: 500;
    font-size: 15px;
    display: flex;
    align-items: center;
    gap: 6px;
}

.nav-links a.active {
    color: #000;
    font-weight: 600;
    text-decoration: underline;
    text-underline-offset: 4px;
}

.location {
    display: flex;
    align-items: center;
    gap: 5px;
    cursor: pointer;
    color: #686b78;
    font-size: 15px;
}

.location-text {
    max-width: 200px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.location-arrow {
    color: #fc8019;
    font-size: 12px;
}

.new-badge {
    background: #ff6b35;
    color: white;
    font-size: 10px;
    padding: 2px 6px;
    border-radius: 3px;
    font-weight: 600;
    margin-left: 4px;
}

.cart {
    position: relative;
}

.cart-badge {
    position: absolute;
    top: -8px;
    right: -8px;
    background: #0d9488;
    color: white;
    padding: 2px 6px;
    border-radius: 50%;
    font-size: 11px;
    font-weight: 600;
    min-width: 18px;
    text-align: center;
}

.icon {
    width: 18px;
    height: 18px;
    display: inline-block;
    vertical-align: middle;
}

.nav-icon {
    width: 16px;
    height: 16px;
    margin-right: 6px;
}

.profile {
    position: relative;
    cursor: pointer;
}

.profile-text {
    display: flex;
    align-items: center;
    gap: 6px;
}

.dropdown {
    display: none;
    position: absolute;
    top: 100%;
    right: 0;
    background: white;
    width: 160px;
    box-shadow: 0 4px 12px rgba(0,0,0,.15);
    border-radius: 6px;
    z-index: 1000;
    margin-top: 5px;
}

.dropdown a {
    display: block;
    padding: 10px 15px;
    text-decoration: none;
    color: #333;
}

.dropdown a:hover {
    background: #f2f2f2;
}

.profile:hover .dropdown,
.profile.active .dropdown {
    display: block;
}

/* ===== CONTENT ===== */
.container {
    padding: 30px 40px;
    max-width: 1400px;
    margin: 0 auto;
}

.section-title {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #1a1a1a;
}

/* ===== WHAT'S ON YOUR MIND SECTION ===== */
.mind-section {
    margin-bottom: 50px;
}

.mind-title {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #1a1a1a;
}

.categories-container {
    position: relative;
    display: flex;
    align-items: center;
}

.categories-scroll {
    display: flex;
    gap: 20px;
    overflow-x: auto;
    scroll-behavior: smooth;
    padding: 10px 0;
    -webkit-overflow-scrolling: touch;
    scrollbar-width: none;
}

.categories-scroll::-webkit-scrollbar {
    display: none;
}

.category-item {
    min-width: 140px;
    text-align: center;
    cursor: pointer;
    text-decoration: none;
    color: #333;
}

.category-image {
    width: 140px;
    height: 140px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 10px;
    background: #f0f0f0;
}

.category-name {
    font-size: 14px;
    font-weight: 500;
    color: #1a1a1a;
}

.scroll-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: white;
    border: 1px solid #e0e0e0;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    box-shadow: 0 2px 8px rgba(0,0,0,.1);
    z-index: 10;
    font-size: 18px;
}

.scroll-btn.left {
    left: -20px;
}

.scroll-btn.right {
    right: -20px;
}

.scroll-btn:hover {
    background: #f8f8f8;
}

/* ===== RESTAURANT SECTION ===== */
.restaurants-container {
    position: relative;
    display: flex;
    align-items: center;
}

.restaurants-scroll {
    display: flex;
    gap: 25px;
    overflow-x: auto;
    scroll-behavior: smooth;
    padding: 10px 0;
    -webkit-overflow-scrolling: touch;
    scrollbar-width: none;
}

.restaurants-scroll::-webkit-scrollbar {
    display: none;
}

.restaurant-card {
    min-width: 300px;
    background: white;
    border-radius: 16px;
    overflow: hidden;
    text-decoration: none;
    color: black;
    box-shadow: 0 2px 8px rgba(0,0,0,.08);
    transition: transform .2s, box-shadow .2s;
    position: relative;
}

.restaurant-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 4px 16px rgba(0,0,0,.12);
}

.restaurant-image-container {
    position: relative;
    width: 100%;
    height: 200px;
    overflow: hidden;
}

.restaurant-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.offer-badge {
    position: absolute;
    bottom: 10px;
    left: 10px;
    background: rgba(0, 0, 0, 0.8);
    color: white;
    padding: 4px 10px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 600;
}

.restaurant-info {
    padding: 15px;
}

.restaurant-name {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 8px;
    color: #1a1a1a;
}

.restaurant-rating {
    font-size: 14px;
    color: #3d7e3e;
    margin-bottom: 6px;
    display: flex;
    align-items: center;
    gap: 4px;
}

.restaurant-cuisine {
    font-size: 14px;
    color: #686b78;
    line-height: 1.4;
}

.no-restaurants {
    color: #e43a3a;
    font-size: 16px;
    padding: 20px;
    text-align: center;
}
</style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar">
    <div class="logo-container">
        <div class="logo">FoodApp</div>
        <div class="nav-links">
            <a href="HomeServlet" class="active">HOME</a>
            <div class="location">
                <span class="location-text">Telecom Nagar, Madhavi Nagar, Ku...</span>
                <span class="location-arrow">▼</span>
            </div>
            <a href="#search">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
                Search
            </a>
            <a href="#offers">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path>
                </svg>
                Offers
                <span class="new-badge">NEW</span>
            </a>
            <a href="#help">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                Help
            </a>
        </div>
    </div>

    <div class="nav-links">
        <div class="profile" onclick="toggleProfile()" onmouseenter="showProfile()" onmouseleave="hideProfile()">
            <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
            </svg>
            <span class="profile-text"><%= userName %></span>
            <div class="dropdown" id="profileDropdown">
                <a href="profile.jsp">Profile</a>
                <a href="orders.jsp">Orders</a>
                <a href="favourites.jsp">Favourites</a>
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
        <a href="cart.jsp" class="cart">
            <svg class="nav-icon" fill="#0d9488" viewBox="0 0 24 24">
                <path d="M7 18c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12L8.1 13h7.45c.75 0 1.41-.41 1.75-1.03L21.7 4H5.21l-.94-2H1zm16 16c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
            </svg>
            Cart
            <%
                Cart cartBadge = (Cart) session.getAttribute("cart");
                int cartCount = (cartBadge != null && cartBadge.getItems() != null) ? cartBadge.getTotalItemCount() : 0;
            %>
            <% if(cartCount > 0) { %>
            <span class="cart-badge"><%= cartCount %></span>
            <% } %>
        </a>
    </div>
</div>

<!-- ===== CONTENT ===== -->
<div class="container">

<!-- ===== WHAT'S ON YOUR MIND SECTION ===== -->
<div class="mind-section">
    <h2 class="mind-title"><%= userName %>, what's on your mind?</h2>
    <div class="categories-container">
        <button class="scroll-btn left" onclick="scrollCategories('left')">‹</button>
        <div class="categories-scroll" id="categoriesScroll">
            <a href="#biryani" class="category-item">
                <img src="https://images.unsplash.com/photo-1563379091339-03246963d4c9?w=140&h=140&fit=crop" alt="Biryani" class="category-image">
                <div class="category-name">Biryani</div>
            </a>
            <a href="#cakes" class="category-item">
                <img src="https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=140&h=140&fit=crop" alt="Cakes" class="category-image">
                <div class="category-name">Cakes</div>
            </a>
            <a href="#burgers" class="category-item">
                <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=140&h=140&fit=crop" alt="Burgers" class="category-image">
                <div class="category-name">Burgers</div>
            </a>
            <a href="#pizzas" class="category-item">
                <img src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=140&h=140&fit=crop" alt="Pizzas" class="category-image">
                <div class="category-name">Pizzas</div>
            </a>
            <a href="#shawarma" class="category-item">
                <img src="https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=140&h=140&fit=crop" alt="Shawarma" class="category-image">
                <div class="category-name">Shawarma</div>
            </a>
            <a href="#waffle" class="category-item">
                <img src="https://images.unsplash.com/photo-1562376552-0d160a2f238d?w=140&h=140&fit=crop" alt="Waffle" class="category-image">
                <div class="category-name">Waffle</div>
            </a>
            <a href="#noodles" class="category-item">
                <img src="https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=140&h=140&fit=crop" alt="Noodles" class="category-image">
                <div class="category-name">Noodles</div>
            </a>
        </div>
        <button class="scroll-btn right" onclick="scrollCategories('right')">›</button>
    </div>
</div>

<!-- ===== TOP RESTAURANT CHAINS SECTION ===== -->
<div class="restaurants-section">
    <h2 class="section-title">Top restaurant chains in Kurnool</h2>
    <div class="restaurants-container">
        <button class="scroll-btn left" onclick="scrollRestaurants('left')">‹</button>
        <div class="restaurants-scroll" id="restaurantsScroll">
<%
List<Restaurant> list = (List<Restaurant>) request.getAttribute("restaurantList");

if(list == null || list.isEmpty()){
%>
    <div class="no-restaurants">No restaurants found</div>
<%
} else {
    for(Restaurant r : list){
        String img = r.getImgPath();
        if(img == null || img.trim().isEmpty() || img.equals("null")){
            img = "https://images.unsplash.com/photo-1600891964599-f61ba0e24092";
        }
        // Ensure image URL is valid
        if(!img.startsWith("http://") && !img.startsWith("https://") && !img.startsWith("/")){
            img = "https://images.unsplash.com/photo-1600891964599-f61ba0e24092";
        }
%>
            <a href="MenuServlet?id=<%= r.getId() %>" class="restaurant-card">
                <div class="restaurant-image-container">
                    <img src="<%= img %>" alt="<%= r.getRestName() %>" class="restaurant-image">
                    <div class="offer-badge">50% OFF</div>
                </div>
                <div class="restaurant-info">
                    <div class="restaurant-name"><%= r.getRestName() %></div>
                    <div class="restaurant-rating">
                        ⭐ <%= r.getRating() %> • <%= r.getDeliveryTime() %> mins
                    </div>
                    <div class="restaurant-cuisine"><%= r.getCuisineType() %></div>
                </div>
            </a>
<%
    }
}
%>
        </div>
        <button class="scroll-btn right" onclick="scrollRestaurants('right')">›</button>
    </div>
</div>

</div>

<script>
function scrollCategories(direction) {
    const scrollContainer = document.getElementById('categoriesScroll');
    const scrollAmount = 300;
    if (direction === 'left') {
        scrollContainer.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
    } else {
        scrollContainer.scrollBy({ left: scrollAmount, behavior: 'smooth' });
    }
}

function scrollRestaurants(direction) {
    const scrollContainer = document.getElementById('restaurantsScroll');
    const scrollAmount = 350;
    if (direction === 'left') {
        scrollContainer.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
    } else {
        scrollContainer.scrollBy({ left: scrollAmount, behavior: 'smooth' });
    }
}

function toggleProfile() {
    const profile = document.querySelector('.profile');
    const dropdown = document.getElementById('profileDropdown');
    profile.classList.toggle('active');
}

function showProfile() {
    const dropdown = document.getElementById('profileDropdown');
    if (dropdown) {
        dropdown.style.display = 'block';
    }
}

function hideProfile() {
    const dropdown = document.getElementById('profileDropdown');
    const profile = document.querySelector('.profile');
    // Only hide if not clicked (active)
    if (dropdown && !profile.classList.contains('active')) {
        setTimeout(() => {
            if (!profile.classList.contains('active')) {
                dropdown.style.display = 'none';
            }
        }, 200);
    }
}

// Close dropdown when clicking outside
document.addEventListener('click', function(event) {
    const profile = document.querySelector('.profile');
    const dropdown = document.getElementById('profileDropdown');
    if (profile && dropdown && !profile.contains(event.target)) {
        profile.classList.remove('active');
        dropdown.style.display = 'none';
    }
});
</script>

</body>
</html>
