<%@ page import="java.util.Map, com.foodapp.model.Cart, com.foodapp.model.CartItem, com.foodapp.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - FoodApp</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
            color: #333;
        }

        /* Header */
        .checkout-header {
            background: #fff;
            padding: 15px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 4px rgba(0,0,0,.08);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-left {
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

        .secure-checkout {
            font-size: 18px;
            font-weight: 600;
            color: #1a1a1a;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .header-right a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* Main Container */
        .checkout-container {
            display: flex;
            max-width: 1400px;
            margin: 0 auto;
            padding: 30px 20px;
            gap: 30px;
        }

        /* Left Section - Address Selection */
        .address-section {
            flex: 2;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
        }

        .section-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #1a1a1a;
        }

        .section-subtitle {
            font-size: 14px;
            color: #686b78;
            margin-bottom: 30px;
        }

        .address-list {
            position: relative;
            padding-left: 30px;
        }

        .address-line {
            position: absolute;
            left: 15px;
            top: 0;
            bottom: 0;
            width: 2px;
            background: repeating-linear-gradient(
                to bottom,
                #e0e0e0 0px,
                #e0e0e0 8px,
                transparent 8px,
                transparent 16px
            );
        }

        .address-pin {
            position: absolute;
            left: 6px;
            top: 0;
            width: 20px;
            height: 20px;
            background: #fc8019;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 12px;
            z-index: 1;
        }

        .address-card {
            background: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            position: relative;
            cursor: pointer;
            transition: all 0.2s;
        }

        .address-card:hover {
            border-color: #fc8019;
            box-shadow: 0 2px 8px rgba(252, 128, 25, 0.1);
        }

        .address-card.selected {
            border-color: #fc8019;
            border-width: 2px;
        }

        .address-icon {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .address-type {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #1a1a1a;
        }

        .address-text {
            font-size: 14px;
            color: #686b78;
            line-height: 1.6;
            margin-bottom: 10px;
        }

        .delivery-time {
            font-size: 13px;
            color: #3d7e3e;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .deliver-btn {
            background: #0d9488;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: background 0.2s;
        }

        .deliver-btn:hover {
            background: #0b7d72;
        }

        .add-address-btn {
            background: transparent;
            color: #0d9488;
            border: 2px solid #0d9488;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.2s;
        }

        .add-address-btn:hover {
            background: #0d9488;
            color: white;
        }

        /* Right Section - Order Summary */
        .order-section {
            flex: 1;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            position: sticky;
            top: 80px;
            height: fit-content;
            max-height: calc(100vh - 100px);
            overflow-y: auto;
        }

        .restaurant-info {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }

        .restaurant-image {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            object-fit: cover;
        }

        .restaurant-image-placeholder {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            background: linear-gradient(135deg, #ff6b35, #f7931e);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: white;
        }

        .restaurant-details h3 {
            font-size: 16px;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 4px;
        }

        .restaurant-details p {
            font-size: 13px;
            color: #686b78;
        }

        .order-item-card {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 15px 0;
            border-bottom: 1px solid #e0e0e0;
        }

        .veg-indicator {
            width: 16px;
            height: 16px;
            border: 1px solid #3d7e3e;
            border-radius: 2px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .veg-indicator.non-veg {
            border-color: #e43a3a;
        }

        .veg-dot {
            width: 10px;
            height: 10px;
            background: #3d7e3e;
            border-radius: 50%;
        }

        .veg-dot.non-veg {
            background: #e43a3a;
        }

        .item-details {
            flex: 1;
        }

        .item-name {
            font-size: 15px;
            font-weight: 500;
            color: #1a1a1a;
            margin-bottom: 4px;
        }

        .item-controls {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 8px;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 8px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            padding: 4px 8px;
        }

        .qty-btn {
            background: none;
            border: none;
            color: #0d9488;
            font-size: 18px;
            cursor: pointer;
            padding: 0 4px;
        }

        .qty-value {
            font-size: 14px;
            font-weight: 600;
            min-width: 20px;
            text-align: center;
        }

        .item-price {
            font-size: 15px;
            font-weight: 600;
            color: #1a1a1a;
        }

        .suggestions-box {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            background: #f8f9fa;
        }

        .suggestions-box textarea {
            width: 100%;
            border: none;
            background: transparent;
            font-size: 14px;
            color: #686b78;
            resize: none;
            min-height: 60px;
        }

        .suggestions-box textarea::placeholder {
            color: #999;
        }

        .no-contact {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
        }

        .no-contact input[type="checkbox"] {
            margin-right: 10px;
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .no-contact label {
            font-size: 14px;
            font-weight: 500;
            color: #1a1a1a;
            cursor: pointer;
            display: block;
            margin-bottom: 8px;
        }

        .no-contact p {
            font-size: 12px;
            color: #686b78;
            line-height: 1.5;
            margin-left: 28px;
        }

        .coupon-section {
            margin: 20px 0;
            padding: 15px;
            border: 1px dashed #e0e0e0;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .coupon-section:hover {
            border-color: #fc8019;
            background: #fff8f0;
        }

        .coupon-icon {
            font-size: 20px;
            color: #fc8019;
        }

        .coupon-text {
            font-size: 14px;
            font-weight: 500;
            color: #1a1a1a;
        }

        .bill-details {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
        }

        .bill-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            font-size: 14px;
        }

        .bill-label {
            color: #686b78;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .bill-value {
            color: #1a1a1a;
            font-weight: 500;
        }

        .bill-total {
            margin-top: 15px;
            padding-top: 15px;
            border-top: 2px solid #e0e0e0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .bill-total-label {
            font-size: 18px;
            font-weight: 600;
            color: #1a1a1a;
        }

        .bill-total-value {
            font-size: 20px;
            font-weight: 600;
            color: #1a1a1a;
        }

        .info-icon {
            width: 14px;
            height: 14px;
            border: 1px solid #999;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            color: #999;
            cursor: help;
        }

        @media (max-width: 1024px) {
            .checkout-container {
                flex-direction: column;
            }

            .order-section {
                position: relative;
                top: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="checkout-header">
        <div class="header-left">
            <div class="logo">FoodApp</div>
            <div class="secure-checkout">SECURE CHECKOUT</div>
        </div>
        <div class="header-right">
            <a href="#help"> Help</a>
            <div class="profile">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                </svg>
                <%= session.getAttribute("user") != null ? ((User)session.getAttribute("user")).getUsername() : "User" %>
            </div>
        </div>
    </div>

    <div class="checkout-container">
        <!-- Left Section - Address Selection -->
        <div class="address-section">
            <h2 class="section-title">Choose a delivery address</h2>
            <p class="section-subtitle">Multiple addresses in this location</p>

            <div class="address-list">
                <div class="address-line"></div>
                <div class="address-pin"></div>

                <!-- Home Address -->
                <div class="address-card selected" onclick="selectAddress('home')">
                    <div class="address-icon"></div>
                    <div class="address-type">Home</div>
                    <div class="address-text">
                        87/684, Telecom Nagar, Madhavi Nagar, Kurnool, Andhra Pradesh 518002, India
                    </div>
                    <div class="delivery-time">13 MINS</div>
                    <button class="deliver-btn" onclick="event.stopPropagation(); setDeliveryAddress('home')">DELIVER HERE</button>
                </div>

                <!-- Other Address -->
                <div class="address-card" onclick="selectAddress('other')">
                    <div class="address-icon"></div>
                    <div class="address-type">Other</div>
                    <div class="address-text">
                        87/143, Arora Nagar, Mahalakshmi Nagar, Kurnool, Andhra Pradesh 518002, India
                    </div>
                    <div class="delivery-time">17 MINS</div>
                    <button class="deliver-btn" onclick="event.stopPropagation(); setDeliveryAddress('other')">DELIVER HERE</button>
                </div>

                <!-- Add New Address -->
                <div class="address-card" onclick="selectAddress('new')">
                    <div class="address-type">Add New Address</div>
                    <div class="address-text">
                        Telecom Nagar, Madhavi Nagar, Kurnool, Andhra Pradesh 518002, India
                    </div>
                    <button class="add-address-btn" onclick="event.stopPropagation(); addNewAddress()">ADD NEW</button>
                </div>
            </div>
        </div>

        <!-- Right Section - Order Summary -->
        <div class="order-section">
            <form action="CheckoutServlet" method="post">
                <!-- Restaurant Info -->
                <div class="restaurant-info">
                    <div class="restaurant-image-placeholder">
                        <span>🍽️</span>
                    </div>
                    <div class="restaurant-details">
                        <h3>KFC</h3>
                        <p>Kurnool</p>
                    </div>
                </div>

                <!-- Order Items -->
                <%
                    Cart cart = (Cart) session.getAttribute("cart");
                    if (cart != null && !cart.getItems().isEmpty()) {
                        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                            CartItem item = entry.getValue();
                %>
                <div class="order-item-card">
                    <div class="veg-indicator non-veg">
                        <div class="veg-dot non-veg"></div>
                    </div>
                    <div class="item-details">
                        <div class="item-name"><%= item.getName() %></div>
                        <div class="item-controls">
                            <div class="quantity-control">
                                <button type="button" class="qty-btn" onclick="updateQuantity(<%= item.getItemId() %>, <%= item.getQuantity() - 1 %>)">&minus;</button>
                                <span class="qty-value"><%= item.getQuantity() %></span>
                                <button type="button" class="qty-btn" onclick="updateQuantity(<%= item.getItemId() %>, <%= item.getQuantity() + 1 %>)">&plus;</button>
                            </div>
                            <div class="item-price"> &#8377;<%= String.format("%.0f", item.getPrice() * item.getQuantity()) %></div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>

                <!-- Suggestions -->
                <div class="suggestions-box">
                    <textarea name="suggestions" placeholder="Any suggestions? We will pass it on..."></textarea>
                </div>

                <!-- No-contact Delivery -->
                <div class="no-contact">
                    <label>
                        <input type="checkbox" name="noContact" value="true">
                        Opt in for No-contact Delivery
                    </label>
                    <p>Unwell, or avoiding contact? Please select no-contact delivery. Partner will safely place the order outside your door (not for COD)</p>
                </div>

                <!-- Apply Coupon -->
                <div class="coupon-section" onclick="applyCoupon()">
                    <div class="coupon-icon">%</div>
                    <div class="coupon-text">Apply Coupon</div>
                </div>

                <!-- Bill Details -->
                <div class="bill-details">
                    <div class="bill-row">
                        <span class="bill-label">Item Total</span>
                        <span class="bill-value"> &#8377;<%= cart != null ? String.format("%.0f", cart.getTotal()) : "0" %></span>
                    </div>
                    <div class="bill-row">
                        <span class="bill-label">
                            Delivery Fee | 0.6 kms
                            <span class="info-icon" title="Delivery fee information">i</span>
                        </span>
                        <span class="bill-value">17</span>
                    </div>
                    <div class="bill-row">
                        <span class="bill-label">
                            GST & Other Charges
                            <span class="info-icon" title="Tax information">i</span>
                        </span>
                        <span class="bill-value"> &#8377;<%= cart != null ? String.format("%.0f", cart.getTotal() * 0.18) : "0" %></span>
                    </div>
                    <div class="bill-total">
                        <span class="bill-total-label">TO PAY</span>
                        <span class="bill-total-value"> &#8377;<%= cart != null ? String.format("%.0f", cart.getTotal() + 17 + (cart.getTotal() * 0.18)) : "0" %></span>
                    </div>
                </div>

                <input type="hidden" name="paymentMethod" value="cash" id="paymentMethod">
                <input type="hidden" name="deliveryAddress" id="deliveryAddress" value="home">

                <button type="submit" style="width: 100%; padding: 15px; background: #0d9488; color: white; border: none; border-radius: 8px; font-size: 16px; font-weight: 600; cursor: pointer; margin-top: 20px;">
                    Place Order
                </button>
            </form>
        </div>
    </div>

    <script>
        function selectAddress(type) {
            document.querySelectorAll('.address-card').forEach(card => {
                card.classList.remove('selected');
            });
            event.currentTarget.classList.add('selected');
            document.getElementById('deliveryAddress').value = type;
        }

        function setDeliveryAddress(type) {
            selectAddress(type);
        }

        function addNewAddress() {
            alert('Add new address functionality - to be implemented');
        }

        function updateQuantity(itemId, quantity) {
            if (quantity <= 0) {
                if (confirm('Remove this item from cart?')) {
                    window.location.href = 'CartServlet?action=remove&itemId=' + itemId;
                }
            } else {
                window.location.href = 'CartServlet?action=update&itemId=' + itemId + '&quantity=' + quantity;
            }
        }

        function applyCoupon() {
            alert('Apply coupon functionality - to be implemented');
        }
    </script>
</body>
</html>
