<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.foodapp.model.Menu"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu Details</title>
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
    background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu4aX01t-IhqbB20JZNWff32x8BmZAr27ze1ZOJKJ6SGd9cXJPXG7SjPzkRAw4pywpb_U&usqp=CAU');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

h1 {
    color: #A38131;
    margin-bottom: 20px;
}

.menu-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
}

.menu-card {
    background-color: #E3CC98;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    width: 280px;
    padding: 20px;
    text-align: center;
    transition: 0.3s ease-in-out;
}

.menu-card:hover {
    transform: translateY(-5px);
    box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
}

.menu-card h3 {
    color: #A38131;
    font-size: 1.5em;
    margin-bottom: 10px;
}

.menu-card p {
    color: #66593B;
    font-size: 1em;
    margin-bottom: 8px;
}

.menu-card .price {
    font-weight: bold;
    font-size: 1.2em;
    color: #66593B;
}

.menu-card img {
    width: 100%;
    height: 180px;
    border-radius: 8px;
    object-fit: cover;
    margin-bottom: 10px;
}

.quantity-input {
    width: 50px;
    padding: 5px;
    font-size: 16px;
    text-align: center;
    border: 2px solid #A38131;
    border-radius: 5px;
    margin: 10px 0;
    background-color: #EDDEBB;
    color: #66593B;
}

.quantity-input:focus {
    border-color: #A38131;
    outline: none;
}

.add-to-cart-btn {
    background-color: #A38131;
    color: white;
    border: none;
    padding: 10px 16px;
    font-size: 16px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

.add-to-cart-btn:hover {
    opacity: 0.9;
    transform: scale(1.05);
}
h1{
color: black;
}

    </style>
</head>
<body>
    <h1>Menu Details</h1>
    <div class="menu-container">
        <%
            List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");  
            if (menuList != null && !menuList.isEmpty()) {
                for (Menu menu : menuList) {
        %>
            <div class="menu-card">
                <img src="<%= menu.getimgPath() %>" alt="Menu Image">
                <h3><%= menu.getItemName() %></h3>
                <p><%= menu.getDesc() %></p>
                <p class="price">Price: Rs.<%= menu.getPrice() %></p>
                <p>Available: <%= menu.isAvailable() == 1 ? "Yes" : "No" %></p>
                <form action="CartServlet?itemId=<%= menu.getMid() %>" method="post">
                    Quantity: <input type="number" name="quantity" value="1" min="1" class="quantity-input">
                    <input type="submit" value="Add to Cart" class="add-to-cart-btn">
                    <input type="hidden" name="action" value="add">
                </form>
            </div>
        <%
                }
            } else {
        %>
            <p>No menu items found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
