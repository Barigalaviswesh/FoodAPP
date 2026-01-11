<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.foodapp.model.Cart, com.foodapp.model.CartItem"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart - FoodApp</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background: #fff;
    min-height: 100vh;
    padding: 20px;
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
    margin: -20px -20px 20px -20px;
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

/* MAIN CARD */
.container {
    max-width: 850px;
    background: #fffaf6;
    margin: 20px auto;
    padding: 40px;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0 20px 40px rgba(0,0,0,0.15);
}

h1 {
    color: #ff6b35;
    margin-bottom: 25px;
}

/* ERROR MESSAGE */
.cart-error {
    color: red;
    font-weight: bold;
    margin-bottom: 20px;
}

/* CART ITEM */
.cart-item {
    background: #f8f9fa;
    padding: 18px;
    margin-bottom: 15px;
    border-radius: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
}

.item-image {
    width: 80px;
    height: 80px;
    border-radius: 8px;
    object-fit: cover;
    flex-shrink: 0;
}

.item-info {
    text-align: left;
    flex: 1;
}

.item-name {
    font-size: 1.1rem;
    font-weight: bold;
}

.item-price {
    color: #ff6b35;
}

/* QUANTITY */
.quantity-controls {
    display: flex;
    align-items: center;
    gap: 10px;
}

.quantity-btn {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    border: none;
    background: #ff6b35;
    color: white;
    cursor: pointer;
}

.quantity {
    font-weight: bold;
}

/* REMOVE */
.remove-btn {
    background: #dc3545;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 6px;
    cursor: pointer;
}

/* TOTAL */
.cart-total {
    background: linear-gradient(135deg, #ff6b35, #f7931e);
    color: white;
    padding: 18px;
    border-radius: 10px;
    margin-top: 20px;
    font-size: 1.3rem;
}

/* ACTIONS */
.cart-actions {
    margin-top: 25px;
    display: flex;
    justify-content: center;
    gap: 15px;
}

.btn {
    padding: 12px 26px;
    border-radius: 25px;
    text-decoration: none;
    font-weight: bold;
}

.btn-secondary {
    background: #6c757d;
    color: white;
}

.btn-primary {
    background: linear-gradient(135deg, #ff6b35, #f7931e);
    color: white;
}

/* EMPTY */
.empty-cart h2 {
    color: #666;
    margin-bottom: 10px;
}

.empty-cart p {
    color: #888;
    margin-bottom: 25px;
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
            <%= session.getAttribute("user") != null ? ((com.foodapp.model.User)session.getAttribute("user")).getUsername() : "User" %>
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

<div class="container">
    <h1>Your Cart</h1>

    <!-- CART ERROR -->
    <%
        String cartError = (String) session.getAttribute("cartError");
        if (cartError != null) {
    %>
        <div class="cart-error"><%= cartError %></div>
    <%
        session.removeAttribute("cartError");
        }
    %>

    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null && !cart.getItems().isEmpty()) {
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem item = entry.getValue();
    %>

    <div class="cart-item">
        <%
            String itemImg = item.getImgPath();
            if(itemImg == null || itemImg.isEmpty() || itemImg.equals("null")) {
                itemImg = "https://images.unsplash.com/photo-1504674900247-0877df9cc836";
            }
            // Ensure image URL is valid
            if(!itemImg.startsWith("http://") && !itemImg.startsWith("https://") && !itemImg.startsWith("/")){
                itemImg = "https://images.unsplash.com/photo-1504674900247-0877df9cc836";
            }
        %>
        <img src="<%= itemImg %>" alt="<%= item.getName() %>" class="item-image">
        <div class="item-info">
            <div class="item-name"><%= item.getName() %></div>
            <div class="item-price">&#8377; <%= String.format("%.2f", item.getPrice()) %></div>
        </div>

        <div class="quantity-controls">
            <button class="quantity-btn" onclick="updateCartItem(<%= item.getItemId() %>, <%= item.getQuantity() - 1 %>)">-</button>
            <span class="quantity" id="cartQty<%= item.getItemId() %>"><%= item.getQuantity() %></span>
            <button class="quantity-btn" onclick="updateCartItem(<%= item.getItemId() %>, <%= item.getQuantity() + 1 %>)">+</button>
        </div>

        <button class="remove-btn" onclick="removeCartItem(<%= item.getItemId() %>)">Remove</button>
    </div>

    <%
            }
    %>

    <div class="cart-total">
        Total: &#8377; <%= String.format("%.2f", cart.getTotal()) %>
    </div>

    <div class="cart-actions">
        <a href="HomeServlet" class="btn btn-secondary">Continue Shopping</a>
        <a href="checkout.jsp" class="btn btn-primary">Proceed to Checkout</a>
    </div>

    <%
        } else {
    %>

    <div class="empty-cart">
        <h2>Your cart is empty</h2>
        <p>Add some delicious items from our restaurants!</p>
        <a href="HomeServlet" class="btn btn-primary">Browse Restaurants</a>
    </div>

    <%
        }
    %>
</div>

<script>
function updateCartItem(itemId, quantity) {
    if (quantity < 0) quantity = 0;
    
    fetch("CartServlet", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "action=update&itemId=" + itemId + "&quantity=" + quantity
    }).then(response => response.text())
    .then(data => {
        const parts = data.split(":");
        const cartCount = parts.length > 1 ? parseInt(parts[1]) : 0;
        
        if (quantity === 0) {
            // Item removed, reload page to update display
            location.reload();
        } else {
            // Update quantity display
            const qtyElement = document.getElementById("cartQty" + itemId);
            if (qtyElement) {
                qtyElement.textContent = quantity;
            }
            // Update total
            location.reload();
        }
    }).catch(error => {
        console.error("Error updating cart:", error);
        alert("Error updating cart. Please try again.");
    });
}

function removeCartItem(itemId) {
    if (confirm("Are you sure you want to remove this item?")) {
        fetch("CartServlet", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: "action=remove&itemId=" + itemId
        }).then(response => response.text())
        .then(data => {
            location.reload();
        }).catch(error => {
            console.error("Error removing item:", error);
            alert("Error removing item. Please try again.");
        });
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
