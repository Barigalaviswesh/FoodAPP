<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map, com.foodapp.model.Cart, com.foodapp.model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <style>
        body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(45deg, #CCAF6A, #EDDEBB);
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    text-align: center;
    color: #66593B;
}

.container {
    background-color: #E3CC98;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    text-align: center;
    width: 80%;
    max-width: 700px;
}

h1 {
    color: #A38131;
    font-size: 28px;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #EDDEBB;
    border-radius: 8px;
    overflow: hidden;
}

th, td {
    padding: 12px;
    border: 1px solid #A38131;
    text-align: center;
}

th {
    background-color: #A38131;
    color: white;
}

.btn {
    padding: 10px 15px;
    border: none;
    cursor: pointer;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    transition: 0.3s ease-in-out;
}

.update-btn {
    background-color: #66593B;
    color: white;
}

.remove-btn {
    background-color: #A38131;
    color: white;
}

.proceed-btn {
    background-color: #CCAF6A;
    color: white;
}

.add-more-btn {
    background-color: #E3CC98;
    color: #66593B;
    text-decoration: none;
    display: inline-block;
    padding: 10px 15px;
    border-radius: 8px;
}

.btn:hover, .add-more-btn:hover {
    opacity: 0.9;
    transform: scale(1.05);
}

footer {
    margin-top: 20px;
    text-align: center;
    color: #66593B;
    font-size: 14px;
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Your Shopping Cart</h1>
        
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null && !cart.getItems().isEmpty()) {
                int restaurantId = cart.getItems().values().iterator().next().getRestaurantId();
        %>
        <table>
            <tr>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
            <%
                double totalCost = 0;
                for (CartItem item : cart.getItems().values()) {
                    double itemTotal = item.getQuantity() * item.getPrice();
                    totalCost += itemTotal;
            %>
            <tr>
                <td><%= item.getName() %></td>
                <td>
                    <form action="CartServlet" method="post" style="display: inline;">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" style="width: 60px;">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <input type="hidden" name="action" value="update">
                        <input type="submit" value="Update" class="btn update-btn">
                    </form>
                </td>
                <td>Rs.<%= item.getPrice() %></td>
                <td>Rs.<%= itemTotal %></td>
                <td>
                    <form action="CartServlet" method="post" style="display: inline;">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <input type="hidden" name="action" value="remove">
                        <input type="submit" value="Remove" class="btn remove-btn">
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="3"><strong>Total Cost</strong></td>
                <td colspan="2"><strong>Rs.<%= totalCost %></strong></td>
            </tr>
        </table>
        <br>
        <a href="MenuServlet?id=<%= restaurantId %>" class="add-more-btn">Add More</a>
        <form action="checkout.jsp" method="post" style="display: inline;">
            <input type="submit" value="Proceed to Checkout" class="btn proceed-btn">
        </form>
        <%
            } else {
        %>
        <p>Your cart is empty.</p>
        <a href="menu.jsp" class="add-more-btn">Back to Menu</a>
        <%
            }
        %>
    </div>

    <footer>
        <p>&copy; 2024 FoodApp. All rights reserved.</p>
    </footer>
</body>
</html>
