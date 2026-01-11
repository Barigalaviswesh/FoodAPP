<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - FoodApp</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff6b35, #f7931e);
            text-align: center;
            padding: 20px;
            color: #333;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .confirmation-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            backdrop-filter: blur(10px);
        }

        .success-icon {
            font-size: 4rem;
            color: #28a745;
            margin-bottom: 20px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        .message {
            font-size: 2.2rem;
            font-weight: bold;
            color: #ff6b35;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .bike-animation {
            position: relative;
            width: 100%;
            overflow: hidden;
            height: 200px;
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            border-radius: 15px;
            margin: 30px 0;
            box-shadow: inset 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .bike {
            position: absolute;
            bottom: 20px;
            left: -150px;
            width: 120px;
            height: 80px;
            background: #ff6b35;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2rem;
            animation: ride 4s linear infinite;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        @keyframes ride {
            0% { 
                left: -150px; 
                transform: rotate(0deg);
            }
            50% {
                transform: rotate(2deg);
            }
            100% { 
                left: calc(100% + 50px);
                transform: rotate(0deg);
            }
        }

        .delivery-info {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            border-left: 4px solid #ff6b35;
        }

        .delivery-info h3 {
            color: #ff6b35;
            margin-bottom: 10px;
        }

        .delivery-info p {
            color: #666;
            margin-bottom: 5px;
        }

        .thank-you {
            font-size: 1.2rem;
            color: #666;
            margin: 20px 0;
            line-height: 1.6;
        }

        .action-buttons {
            margin-top: 30px;
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: linear-gradient(135deg, #ff6b35, #f7931e);
            color: white;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #e55a2b, #e8851a);
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(255, 107, 53, 0.3);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #28a745, #20c997);
            color: white;
        }

        .btn-secondary:hover {
            background: linear-gradient(135deg, #218838, #1ea085);
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(40, 167, 69, 0.3);
        }

        .btn-outline {
            background: transparent;
            color: #ff6b35;
            border: 2px solid #ff6b35;
        }

        .btn-outline:hover {
            background: #ff6b35;
            color: white;
            transform: translateY(-2px);
        }

        .order-details {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        .order-details h4 {
            color: #ff6b35;
            margin-bottom: 15px;
            text-align: center;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .detail-row:last-child {
            border-bottom: none;
            font-weight: bold;
            color: #ff6b35;
        }

        @media (max-width: 768px) {
            .confirmation-container {
                margin: 10px;
                padding: 30px 20px;
            }
            
            .message {
                font-size: 1.8rem;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 250px;
            }
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <div class="success-icon">✅</div>
        <div class="message">Order Confirmed!</div>
        
        <div class="delivery-info">
            <h3>🚚 Delivery Information</h3>
            <p><strong>Estimated Delivery:</strong> 25-30 minutes</p>
            <p><strong>Order ID:</strong> #12345</p>
            <p><strong>Status:</strong> <span style="color: #28a745;">Confirmed</span></p>
        </div>

        <div class="bike-animation">
            <div class="bike">🏍️</div>
        </div>

        <div class="order-details">
            <h4>📋 Order Summary</h4>
            <div class="detail-row">
                <span>Subtotal:</span>
                <span>₹299</span>
            </div>
            <div class="detail-row">
                <span>Delivery Fee:</span>
                <span>₹25</span>
            </div>
            <div class="detail-row">
                <span>Total Amount:</span>
                <span>₹324</span>
            </div>
        </div>
        
        <p class="thank-you">
            🎉 Thank you for your order! Our delivery partner is preparing to bring your delicious meal right to your doorstep.
        </p>

        <div class="action-buttons">
            <a href="orderTracking.html" class="btn btn-primary">📍 Track Order</a>
            <a href="orders.jsp" class="btn btn-secondary">📋 View All Orders</a>
            <a href="restaurants.html" class="btn btn-outline">🍽️ Order Again</a>
        </div>
    </div>
</body>
</html>
