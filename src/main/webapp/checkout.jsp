<%@ page import="java.util.Map, com.foodapp.model.Cart, com.foodapp.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
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
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    text-align: center;
    color: #66593B;
}

.checkout-container {
    width: 80%;
    max-width: 900px;
    background-color: #E3CC98;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.checkout-form, .order-summary {
    flex: 1;
    min-width: 300px;
    padding: 20px;
    border-radius: 12px;
    background-color: #EDDEBB;
    margin: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

h2, h3 {
    font-size: 24px;
    font-weight: bold;
    color: #A38131;
    margin-bottom: 15px;
}

.form-group {
    margin-bottom: 15px;
    text-align: left;
}

label {
    font-weight: 600;
    display: block;
    color: #66593B;
    margin-bottom: 5px;
}

input[type="text"], textarea, select {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 2px solid #A38131;
    border-radius: 5px;
    outline: none;
    background-color: #E3CC98;
    color: #66593B;
}

textarea {
    resize: none;
    height: 80px;
}

.order-summary ul {
    list-style-type: none;
    padding: 0;
}

.order-summary li {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid #A38131;
}

.order-total {
    font-weight: bold;
    font-size: 18px;
    margin-top: 10px;
    color: #66593B;
}

.btn {
    display: block;
    width: 100%;
    background-color: #A38131;
    color: white;
    padding: 12px;
    font-size: 16px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    margin-top: 15px;
    transition: 0.3s;
}

.btn:hover {
    opacity: 0.9;
    transform: scale(1.05);
}

.empty-cart {
    color: #A38131;
    font-weight: bold;
}

    </style>
</head>
<body>
    <div class="checkout-container">
        <div class="checkout-form">
            <h2>Checkout</h2>
            <form action="CheckoutServlet" method="post">
                <div class="form-group">
                    <label for="address">Delivery Address:</label>
                    <textarea id="address" name="address" placeholder="Enter your delivery address..." required></textarea>
                </div>
                <div class="form-group">
                    <label for="paymentMethod">Payment Method:</label>
                    <select id="paymentMethod" name="paymentMethod" required>
                        <option>--Select option--</option>
                        <option value="Credit_Card">Credit Card</option>
                        <option value="Debit_Card">Debit Card</option>
                        <option value="UPI">UPI</option>
                        <option value="Cash">Cash on Delivery</option>
                    </select>
                </div>
                <button type="submit" class="btn">Place Order</button>
            </form>
        </div>

        <div class="order-summary">
            <h3>Order Summary</h3>
            <% Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null || cart.getItems().isEmpty()) { %>
                <p class="empty-cart">Your cart is empty. Please add items to proceed.</p>
            <% } else { int totalAmount = 0; %>
                <ul>
                    <% for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                        CartItem item = entry.getValue();
                        totalAmount += item.getPrice() * item.getQuantity(); %>
                        <li>
                            <span><%= item.getName() %></span>
                            <span>Qty: <%= item.getQuantity() %></span>
                            <span>Rs. <%= item.getPrice() * item.getQuantity() %></span>
                        </li>
                    <% } %>
                </ul>
                <div class="order-total">
                    <p>Total Amount: Rs. <%= totalAmount %></p>
                </div>
                <%
                    session.setAttribute("totalAmount", totalAmount);
                %>
            <% } %>
        </div>
    </div>
</body>
</html>
