<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Restaurant - FoodApp</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #ff6b35, #f7931e);
    min-height: 100vh;
}

/* NAVBAR */
.navbar {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.navbar a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    margin-right: 15px;
}

.navbar a:hover {
    color: #fff3cd;
}

/* CONTAINER */
.container {
    background: rgba(255, 255, 255, 0.95);
    max-width: 650px;
    margin: 60px auto;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.15);
}

h1 {
    text-align: center;
    color: #ff6b35;
    margin-bottom: 30px;
}

/* FORM */
.form-group {
    margin-bottom: 18px;
}

label {
    font-weight: 600;
    display: block;
    margin-bottom: 6px;
    color: #333;
}

input, select {
    width: 100%;
    padding: 14px;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    font-size: 15px;
    background-color: #f8f9fa;
}

input:focus, select:focus {
    outline: none;
    border-color: #ff6b35;
    background-color: white;
    box-shadow: 0 0 8px rgba(255,107,53,0.25);
}

/* FILE INPUT */
input[type="file"] {
    padding: 10px;
    background-color: white;
}

/* BUTTONS */
.btn-group {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 25px;
}

button, .btn-link {
    padding: 14px 30px;
    border-radius: 10px;
    border: none;
    cursor: pointer;
    font-weight: bold;
    font-size: 15px;
    text-decoration: none;
}

button {
    background: linear-gradient(135deg, #ff6b35, #f7931e);
    color: white;
}

button:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(255,107,53,0.3);
}

.btn-link {
    background: #999;
    color: white;
}

.btn-link:hover {
    background: #777;
}
</style>
</head>

<body>

<nav class="navbar">
    <div>
        <a href="index.html">🍕 FoodApp</a>
        <a href="HomeServlet">Restaurants</a>
    </div>
    <div>
        <a href="adminhome.jsp">Admin Home</a>
        <a href="adminlogin.jsp">Admin Login</a>
    </div>
</nav>

<div class="container">
    <h1>🏪 Add New Restaurant</h1>

    <!-- IMPORTANT: enctype added for image upload -->
    <form action="AddRestaurant" method="post" enctype="multipart/form-data">

        <div class="form-group">
            <label>Restaurant ID</label>
            <input type="text" name="restid" required>
        </div>

        <div class="form-group">
            <label>Restaurant Name</label>
            <input type="text" name="name" required>
        </div>

        <div class="form-group">
            <label>Cuisine Type</label>
            <select name="cusionType" required>
                <option value="">Select</option>
                <option>Indian</option>
                <option>Chinese</option>
                <option>Italian</option>
                <option>Fast Food</option>
                <option>Mexican</option>
            </select>
        </div>

        <div class="form-group">
            <label>Delivery Time (minutes)</label>
            <input type="number" name="deleiverytime" min="10" max="120" required>
        </div>

        <div class="form-group">
            <label>Status</label>
            <select name="isactive" required>
                <option value="">Select</option>
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
        </div>

        <div class="form-group">
            <label>Rating</label>
            <select name="ratings" required>
                <option value="">Select</option>
                <option value="5">⭐⭐⭐⭐⭐</option>
                <option value="4">⭐⭐⭐⭐</option>
                <option value="3">⭐⭐⭐</option>
                <option value="2">⭐⭐</option>
                <option value="1">⭐</option>
            </select>
        </div>

        <!-- IMAGE UPLOAD -->
        <div class="form-group">
    <label>Restaurant Image URL</label>
    <input type="text" name="imgPath" placeholder="Enter image URL" required>

</div>


        <div class="btn-group">
            <button type="submit">Add Restaurant</button>
            <a href="adminhome.jsp" class="btn-link">Cancel</a>
        </div>

    </form>
</div>

</body>
</html>
