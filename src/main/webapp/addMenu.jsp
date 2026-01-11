<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Menu Item - FoodApp</title>

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
    display: flex;
    justify-content: center;
    align-items: center;
}

/* CARD */
.container {
    background: rgba(255, 255, 255, 0.95);
    padding: 35px;
    border-radius: 20px;
    width: 420px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    text-align: center;
}

h1 {
    color: #ff6b35;
    margin-bottom: 25px;
    font-size: 2rem;
}

/* FORM */
label {
    display: block;
    text-align: left;
    margin-bottom: 6px;
    font-weight: 600;
    color: #333;
}

input[type="text"],
input[type="number"] {
    width: 100%;
    padding: 14px;
    margin-bottom: 16px;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    font-size: 15px;
    background-color: #f8f9fa;
}

input:focus {
    outline: none;
    border-color: #ff6b35;
    background-color: white;
    box-shadow: 0 0 8px rgba(255,107,53,0.25);
}

/* BUTTON */
input[type="submit"] {
    width: 100%;
    padding: 14px;
    margin-top: 10px;
    background: linear-gradient(135deg, #ff6b35, #f7931e);
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(255,107,53,0.3);
}
</style>
</head>

<body>

<div class="container">
    <h1>🍽 Add Menu Item</h1>

    <form action="AddMenu" method="post">

        <label>Menu ID</label>
        <input type="number" name="menuid" required>

        <label>Restaurant ID</label>
        <input type="number" name="restid" required>

        <label>Item Name</label>
        <input type="text" name="itemname" required>

        <label>Description</label>
        <input type="text" name="description" required>

        <label>Price (₹)</label>
        <input type="number" name="price" required>

        <label>Available (1 = Yes, 0 = No)</label>
        <input type="number" name="isavail" required>

        <label>Menu Image URL</label>
        <input type="text" name="imgPath"
               placeholder="Paste image URL from Unsplash / Google" required>

        <input type="submit" value="Add Menu Item">
    </form>
</div>

</body>
</html>
