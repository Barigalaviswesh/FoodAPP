<%@ page import="java.util.*, com.foodapp.model.Menu, com.foodapp.model.Cart, com.foodapp.model.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu - FoodApp</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #fff;
    padding-bottom: 80px;
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
    max-width: 1200px;
    margin: 30px auto;
    padding: 0 20px;
}

.menu-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    margin-bottom: 30px;
}

.menu-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,.08);
    transition: transform 0.2s, box-shadow 0.2s;
    position: relative;
}

.menu-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,.12);
}

.card-badge {
    position: absolute;
    top: 12px;
    left: 12px;
    background: #0d9488;
    color: white;
    padding: 4px 10px;
    border-radius: 4px;
    font-size: 11px;
    font-weight: 600;
    z-index: 2;
}

.veg-indicator {
    position: absolute;
    top: 12px;
    left: 12px;
    width: 20px;
    height: 20px;
    border: 1.5px solid #3d7e3e;
    border-radius: 3px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: white;
    z-index: 2;
}

.veg-dot {
    width: 12px;
    height: 12px;
    background: #3d7e3e;
    border-radius: 50%;
}

.veg-indicator.non-veg {
    border-color: #e43a3a;
}

.veg-indicator.non-veg .veg-dot {
    background: #e43a3a;
}

.card-image {
    width: 100%;
    height: 220px;
    object-fit: cover;
}

.card-content {
    padding: 16px;
}

.card-title {
    font-size: 17px;
    font-weight: 600;
    color: #1a1a1a;
    margin-bottom: 8px;
    line-height: 1.4;
}

.card-description {
    font-size: 13px;
    color: #686b78;
    line-height: 1.5;
    margin-bottom: 12px;
    min-height: 38px;
    display: block;
}

.price-section {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 12px;
}

.original-price {
    font-size: 14px;
    color: #686b78;
    text-decoration: line-through;
}

.current-price {
    font-size: 16px;
    font-weight: 600;
    color: #1a1a1a;
}

.card-actions {
    margin-top: 12px;
}

.add-btn {
    border: 1.5px solid #0d9488;
    background: white;
    color: #0d9488;
    padding: 8px 20px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
    width: 100%;
}

.add-btn:hover {
    background: #0d9488;
    color: white;
}

.quantity-control {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 15px;
    border: 1.5px solid #0d9488;
    border-radius: 6px;
    padding: 6px 12px;
    background: white;
}

.qty-btn {
    background: none;
    border: none;
    color: #0d9488;
    font-size: 20px;
    font-weight: 600;
    cursor: pointer;
    padding: 0 8px;
    line-height: 1;
}

.qty-value {
    font-size: 15px;
    font-weight: 600;
    color: #1a1a1a;
    min-width: 25px;
    text-align: center;
}

.customisable {
    font-size: 12px;
    color: #686b78;
    margin-top: 8px;
    text-align: center;
}

/* Recommended Section */
.recommended-section {
    margin-top: 40px;
}

.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 0;
    cursor: pointer;
    border-bottom: 1px solid #e0e0e0;
}

.section-title {
    font-size: 18px;
    font-weight: 600;
    color: #1a1a1a;
}

.section-count {
    font-size: 14px;
    color: #686b78;
    margin-left: 8px;
}

.expand-icon {
    font-size: 18px;
    color: #686b78;
    transition: transform 0.3s;
}

.expand-icon.expanded {
    transform: rotate(180deg);
}

.recommended-content {
    display: none;
    margin-top: 20px;
}

.recommended-content.show {
    display: block;
}

/* Bottom Cart Bar */
.cartbar {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background: #0d9488;
    color: white;
    padding: 15px 40px;
    display: none;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 -2px 10px rgba(0,0,0,.1);
    z-index: 1000;
}

.cartbar-text {
    font-size: 15px;
    font-weight: 500;
}

.view-cart-btn {
    background: white;
    color: #0d9488;
    padding: 10px 20px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 600;
    font-size: 14px;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: background 0.2s;
}

.view-cart-btn:hover {
    background: #f0f0f0;
}

.empty-menu {
    text-align: center;
    padding: 60px 20px;
    color: #e43a3a;
    font-size: 18px;
}

@media (max-width: 768px) {
    .menu-grid {
        grid-template-columns: 1fr;
    }
}
</style>

<script>
function updateCart(id, qty) {
    if (qty < 0) qty = 0;
    
    const qtyElement = document.getElementById("q" + id);
    const currentQty = qtyElement ? parseInt(qtyElement.innerText.trim()) || 0 : 0;
    
    // Determine action: use 'add' only if current quantity is 0 and we're adding, otherwise 'update'
    const action = (currentQty === 0 && qty > 0) ? "add" : "update";
    
    fetch("CartServlet", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "action=" + action + "&itemId=" + id + "&quantity=" + qty
    }).then(response => response.text())
    .then(data => {
        // Check if response contains ERROR
        if (data.startsWith("ERROR") || data.includes("ERROR")) {
            console.error("Server error:", data);
            // Revert UI if error
            if (qtyElement) {
                qtyElement.innerText = currentQty;
            }
            return;
        }
        
        // Parse response: "OK:count" or just "OK"
        const parts = data.split(":");
        const cartCount = parts.length > 1 ? parseInt(parts[1]) : 0;
        
        const addBtn = document.getElementById("add" + id);
        const qtyControl = document.getElementById("qty" + id);
        
        // Always update the quantity display to match what we sent
        if (qty > 0) {
            if (qtyElement) {
                qtyElement.innerText = qty;
            }
            if (addBtn) {
                addBtn.style.display = "none";
            }
            if (qtyControl) {
                qtyControl.style.display = "flex";
            }
            updateCartBadge(cartCount);
            showCartBar(cartCount);
        } else {
            if (qtyElement) {
                qtyElement.innerText = "0";
            }
            if (addBtn) {
                addBtn.style.display = "block";
            }
            if (qtyControl) {
                qtyControl.style.display = "none";
            }
            updateCartBadge(cartCount);
            showCartBar(cartCount);
        }
    }).catch(error => {
        console.error("Error updating cart:", error);
        // Revert UI on error
        if (qtyElement) {
            qtyElement.innerText = currentQty;
        }
        alert("Error updating cart. Please try again.");
    });
}

// Increment quantity
function incrementCart(id) {
    const qtyElement = document.getElementById("q" + id);
    if (!qtyElement) {
        // If element doesn't exist, add item with quantity 1
        updateCart(id, 1);
        return;
    }
    const currentQty = parseInt(qtyElement.innerText.trim()) || 0;
    const newQty = currentQty + 1;
    // Update UI immediately for better UX
    qtyElement.innerText = newQty;
    // Also show quantity controls if hidden
    const addBtn = document.getElementById("add" + id);
    const qtyControl = document.getElementById("qty" + id);
    if (addBtn) addBtn.style.display = "none";
    if (qtyControl) qtyControl.style.display = "flex";
    // Update cart
    updateCart(id, newQty);
}

// Decrement quantity
function decrementCart(id) {
    const qtyElement = document.getElementById("q" + id);
    if (!qtyElement) {
        return;
    }
    const currentQty = parseInt(qtyElement.innerText.trim()) || 0;
    const newQty = Math.max(0, currentQty - 1);
    // Update UI immediately for better UX
    qtyElement.innerText = newQty;
    updateCart(id, newQty);
}

function updateCartBadge(count) {
    const currentBadge = document.querySelector('.cart-badge');
    const cartLink = document.querySelector('.cart');
    
    if (count > 0) {
        if (currentBadge) {
            currentBadge.textContent = count;
            currentBadge.style.display = 'inline-block';
        } else if (cartLink) {
            // Create badge if it doesn't exist
            const newBadge = document.createElement('span');
            newBadge.className = 'cart-badge';
            newBadge.textContent = count;
            cartLink.appendChild(newBadge);
        }
    } else {
        if (currentBadge) {
            currentBadge.style.display = 'none';
        }
    }
}

function showCartBar(count) {
    const cartBar = document.getElementById("bar");
    const cartBarText = document.querySelector(".cartbar-text");
    if (!cartBar) return;
    
    // Determine the actual count
    let actualCount = count;
    if (actualCount === undefined || actualCount === null) {
        // If count not provided, check current badge
        const currentBadge = document.querySelector('.cart-badge');
        actualCount = currentBadge ? parseInt(currentBadge.textContent) || 0 : 0;
    }
    
    if (actualCount > 0) {
        // Always show cart bar when there are items - PERMANENTLY VISIBLE
        if (cartBarText) {
            cartBarText.textContent = actualCount + (actualCount === 1 ? " item added" : " items added");
        }
        cartBar.style.display = "flex";
        cartBar.style.visibility = "visible";
    } else {
        // Hide cart bar only if cart is empty
        cartBar.style.display = "none";
    }
}

function toggleRecommended() {
    const content = document.querySelector('.recommended-content');
    const icon = document.querySelector('.expand-icon');
    content.classList.toggle('show');
    icon.classList.toggle('expanded');
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
<%
List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");

if(menuList == null || menuList.isEmpty()){
%>
    <div class="empty-menu">
        <h3>Menu not available. Please open menu from Home page.</h3>
    </div>
<%
    return;
}

Cart cart = (Cart) session.getAttribute("cart");
if(cart == null){
    cart = new Cart();
    session.setAttribute("cart", cart);
}

int itemCount = menuList.size();
%>

    <!-- Recommended Section -->
    <div class="recommended-section">
        <div class="section-header" onclick="toggleRecommended()">
            <div>
                <span class="section-title">Recommended</span>
                <span class="section-count">(<%= itemCount %>)</span>
            </div>
            <span class="expand-icon">▼</span>
        </div>
        <div class="recommended-content show">
            <div class="menu-grid">
<%
for(Menu m : menuList){
    int q = cart.getItems().containsKey(m.getMid())
            ? cart.getItems().get(m.getMid()).getQuantity()
            : 0;

    String img = m.getimgPath();
    if(img == null || img.isEmpty() || img.equals("null"))
        img = "https://images.unsplash.com/photo-1504674900247-0877df9cc836";
    // Ensure image URL is valid
    if(!img.startsWith("http://") && !img.startsWith("https://") && !img.startsWith("/")){
        img = "https://images.unsplash.com/photo-1504674900247-0877df9cc836";
    }
    
    String desc = m.getDesc();
    if(desc == null || desc.isEmpty())
        desc = "Delicious food item";
%>
                <div class="menu-card">
                    <div class="veg-indicator non-veg">
                        <div class="veg-dot"></div>
                    </div>
                    <img src="<%= img %>" alt="<%= m.getItemName() %>" class="card-image">
                    <div class="card-content">
                        <div class="card-title"><%= m.getItemName() %></div>
                        <div class="card-description"><%= desc %></div>
                        <div class="price-section">
                            <div class="current-price">&#8377;<%= String.format("%.0f", m.getPrice()) %></div>
                        </div>
                        <div class="card-actions">
                            <% if(q == 0){ %>
                                <button id="add<%= m.getMid() %>" class="add-btn" onclick="updateCart(<%= m.getMid() %>, 1)">ADD</button>
                                <div id="qty<%= m.getMid() %>" class="quantity-control" style="display: none;">
                                    <button class="qty-btn" onclick="decrementCart(<%= m.getMid() %>)">&minus;</button>
                                    <span class="qty-value" id="q<%= m.getMid() %>">0</span>
                                    <button class="qty-btn" onclick="incrementCart(<%= m.getMid() %>)">&plus;</button>
                                </div>
                            <% } else { %>
                                <button id="add<%= m.getMid() %>" class="add-btn" style="display: none;" onclick="updateCart(<%= m.getMid() %>, 1)">ADD</button>
                                <div id="qty<%= m.getMid() %>" class="quantity-control">
                                    <button class="qty-btn" onclick="decrementCart(<%= m.getMid() %>)">&minus;</button>
                                    <span class="qty-value" id="q<%= m.getMid() %>"><%= q %></span>
                                    <button class="qty-btn" onclick="incrementCart(<%= m.getMid() %>)">&plus;</button>
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>
<%
}
%>
            </div>
        </div>
    </div>
</div>

<!-- Bottom Cart Bar -->
<div class="cartbar" id="bar">
    <span class="cartbar-text">
        <%
            Cart cartBar = (Cart) session.getAttribute("cart");
            int cartBarCount = (cartBar != null && cartBar.getItems() != null) ? cartBar.getTotalItemCount() : 0;
        %>
        <%= cartBarCount %> <%= cartBarCount == 1 ? "item added" : "items added" %>
    </span>
    <a href="cart.jsp" class="view-cart-btn">
        VIEW CART
        <svg style="width: 16px; height: 16px; display: inline-block; margin-left: 6px;" fill="white" viewBox="0 0 24 24">
            <path d="M7 18c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12L8.1 13h7.45c.75 0 1.41-.41 1.75-1.03L21.7 4H5.21l-.94-2H1zm16 16c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
        </svg>
    </a>
</div>

<script>
// Show cart bar on page load if cart has items - and keep it PERMANENTLY VISIBLE
document.addEventListener('DOMContentLoaded', function() {
    <%
        Cart initCart = (Cart) session.getAttribute("cart");
        int initCount = (initCart != null && initCart.getItems() != null) ? initCart.getTotalItemCount() : 0;
    %>
    const initCount = <%= initCount %>;
    const cartBar = document.getElementById("bar");
    const cartBarText = document.querySelector(".cartbar-text");
    
    if (initCount > 0) {
        if (cartBar && cartBarText) {
            cartBarText.textContent = initCount + (initCount === 1 ? " item added" : " items added");
            cartBar.style.display = "flex"; // PERMANENTLY VISIBLE when items exist
            cartBar.style.visibility = "visible";
        }
    } else {
        // Hide only if cart is empty
        if (cartBar) {
            cartBar.style.display = "none";
        }
    }
    
    // Periodically check and update cart bar to keep it visible
    setInterval(function() {
        const currentBadge = document.querySelector('.cart-badge');
        const cartCount = currentBadge ? parseInt(currentBadge.textContent) || 0 : 0;
        if (cartCount > 0 && cartBar) {
            cartBar.style.display = "flex";
            cartBar.style.visibility = "visible";
            if (cartBarText) {
                cartBarText.textContent = cartCount + (cartCount === 1 ? " item added" : " items added");
            }
        }
    }, 1000); // Check every second to ensure it stays visible
});
</script>

</body>
</html>
