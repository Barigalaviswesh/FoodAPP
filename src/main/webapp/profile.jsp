<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile - FoodApp</title>

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

.nav-icon {
    width: 18px;
    height: 18px;
    display: inline-block;
    vertical-align: middle;
}

.nav-links a.active {
    color: #000;
    font-weight: 600;
}

.profile {
    position: relative;
    cursor: pointer;
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
}

/* ===== CONTENT ===== */
.container {
    max-width: 800px;
    margin: 40px auto;
    padding: 40px;
    background: white;
    border-radius: 16px;
    box-shadow: 0 2px 8px rgba(0,0,0,.08);
}

.page-title {
    font-size: 32px;
    font-weight: 600;
    margin-bottom: 30px;
    color: #1a1a1a;
}

.profile-section {
    margin-bottom: 30px;
}

.section-title {
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #1a1a1a;
    border-bottom: 2px solid #fc8019;
    padding-bottom: 10px;
}

.info-group {
    margin-bottom: 20px;
}

.info-label {
    font-size: 14px;
    color: #686b78;
    margin-bottom: 5px;
    font-weight: 500;
}

.info-value {
    font-size: 16px;
    color: #1a1a1a;
    font-weight: 500;
}

.edit-btn {
    background: #fc8019;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    margin-top: 20px;
    transition: background 0.2s;
}

.edit-btn:hover {
    background: #e6730f;
}

.back-btn {
    color: #fc8019;
    text-decoration: none;
    font-weight: 500;
    display: inline-block;
    margin-bottom: 20px;
}

.back-btn:hover {
    text-decoration: underline;
}
</style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar">
    <div class="logo-container">
        <div class="logo">FoodApp</div>
        <div class="nav-links">
            <a href="HomeServlet">HOME</a>
        </div>
    </div>

    <div class="nav-links">
        <div class="profile" onclick="toggleProfile()" onmouseenter="showProfile()" onmouseleave="hideProfile()">
            <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
            </svg>
            <%= session.getAttribute("user") != null ? ((User)session.getAttribute("user")).getUsername() : "User" %>
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
                com.foodapp.model.Cart cartBadge = (com.foodapp.model.Cart) session.getAttribute("cart");
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
    <a href="HomeServlet" class="back-btn">← Back to Home</a>
    <h1 class="page-title">My Profile</h1>

    <%
        User user = (User) session.getAttribute("user");
        if (user != null) {
    %>

    <div class="profile-section">
        <h2 class="section-title">Personal Information</h2>
        <div class="info-group">
            <div class="info-label">Username</div>
            <div class="info-value"><%= user.getUsername() %></div>
        </div>
        <div class="info-group">
            <div class="info-label">Email</div>
            <div class="info-value"><%= user.getEmail() %></div>
        </div>
        <div class="info-group">
            <div class="info-label">Address</div>
            <div class="info-value"><%= user.getAddress() != null && !user.getAddress().isEmpty() ? user.getAddress() : "Not provided" %></div>
        </div>
    </div>

    <div class="profile-section">
        <h2 class="section-title">Account Settings</h2>
        <a href="reset.html" class="edit-btn">Change Password</a>
    </div>

    <%
        } else {
    %>
    <div style="text-align: center; padding: 40px;">
        <h2 style="color: #e43a3a; margin-bottom: 20px;">Please login to view your profile</h2>
        <a href="login.html" class="edit-btn">Login</a>
    </div>
    <%
        }
    %>

</div>

<script>
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
    if (dropdown && !profile.classList.contains('active')) {
        setTimeout(() => {
            if (!profile.classList.contains('active')) {
                dropdown.style.display = 'none';
            }
        }, 200);
    }
}

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
