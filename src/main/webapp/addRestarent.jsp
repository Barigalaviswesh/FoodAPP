<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Restaurant</title>
    <style>
<<<<<<< HEAD
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(45deg, #CCAF6A, #EDDEBB);
            color: #66593B;
            min-height: 100vh;
            padding: 20px;
        }

        .navbar {
            background-color: #E3CC98;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
        }

        .navbar a {
            color: #A38131;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 15px;
            font-weight: bold;
        }

        .navbar a:hover {
            background-color: #A38131;
            color: white;
            border-radius: 5px;
        }

        .container {
            background-color: rgba(227, 204, 152, 0.95);
            padding: 40px;
            border-radius: 15px;
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
=======
        body {
            background-color: #EDDEBB;
            font-family: Arial, sans-serif;
            color: #66593B;
            margin: 0;
            height: 100vh; /* Full viewport height */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #E3CC98;
            padding: 30px;
            border: 1px solid #A38131;
            border-radius: 10px;
            width: 50%;
            max-width: 500px;
            text-align: center;
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
        }

        h1 {
            color: #A38131;
<<<<<<< HEAD
            margin-bottom: 30px;
            text-align: center;
            font-size: 2.2rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label {
            margin-bottom: 8px;
            font-weight: 600;
            color: #66593B;
            font-size: 1rem;
        }

        input[type="text"], 
        input[type="number"], 
        select {
            padding: 12px;
            border: 2px solid #A38131;
            border-radius: 8px;
            font-size: 1rem;
            background-color: white;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, 
        input[type="number"]:focus, 
        select:focus {
            outline: none;
            border-color: #CCAF6A;
            box-shadow: 0 0 5px rgba(204, 175, 106, 0.3);
        }

        .btn-container {
            grid-column: 1 / -1;
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 20px;
        }

        input[type="submit"], .btn {
            background: linear-gradient(135deg, #A38131, #CCAF6A);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        input[type="submit"]:hover, .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(163, 129, 49, 0.3);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #666, #888);
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .container {
                padding: 20px;
            }
            
            h1 {
                font-size: 1.8rem;
            }
=======
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #66593B;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #A38131;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #CCAF6A;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            align-self: center;
        }

        input[type="submit"]:hover {
            background-color: #A38131;
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
        }
    </style>
</head>
<body>
<<<<<<< HEAD
    <!-- Navigation -->
    <nav class="navbar">
        <div>
            <a href="index.html">🍕 FoodExpress</a>
            <a href="about.html">About Us</a>
            <a href="contact.html">Contact</a>
            <a href="HomeServlet">Restaurants</a>
        </div>
        <div>
            <a href="adminhome.jsp">Admin Panel</a>
            <a href="adminlogin.jsp">Admin Login</a>
        </div>
    </nav>

    <div class="container">
        <h1>🏪 ADD NEW RESTAURANT</h1>
        
        <form action="AddRestaurant" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label for="restid">Restaurant ID:</label>
                    <input type="text" name="restid" id="restid" placeholder="Enter unique ID" required>
                </div>

                <div class="form-group">
                    <label for="name">Restaurant Name:</label>
                    <input type="text" name="name" id="name" placeholder="Enter restaurant name" required>
                </div>

                <div class="form-group">
                    <label for="cuisineType">Cuisine Type:</label>
                    <select name="cusionType" id="cuisineType" required>
                        <option value="">Select Cuisine Type</option>
                        <option value="Italian">Italian</option>
                        <option value="Chinese">Chinese</option>
                        <option value="Indian">Indian</option>
                        <option value="Mexican">Mexican</option>
                        <option value="American">American</option>
                        <option value="Japanese">Japanese</option>
                        <option value="Thai">Thai</option>
                        <option value="Mediterranean">Mediterranean</option>
                        <option value="Fast Food">Fast Food</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="deliveryTime">Delivery Time (minutes):</label>
                    <input type="number" name="deleiverytime" id="deliveryTime" min="10" max="120" placeholder="30" required>
                </div>

                <div class="form-group">
                    <label for="isActive">Restaurant Status:</label>
                    <select name="isactive" id="isActive" required>
                        <option value="">Select Status</option>
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="ratings">Initial Rating:</label>
                    <select name="ratings" id="ratings" required>
                        <option value="">Select Rating</option>
                        <option value="5.0">⭐⭐⭐⭐⭐ (5.0)</option>
                        <option value="4.5">⭐⭐⭐⭐⭐ (4.5)</option>
                        <option value="4.0">⭐⭐⭐⭐ (4.0)</option>
                        <option value="3.5">⭐⭐⭐⭐ (3.5)</option>
                        <option value="3.0">⭐⭐⭐ (3.0)</option>
                        <option value="2.5">⭐⭐⭐ (2.5)</option>
                        <option value="2.0">⭐⭐ (2.0)</option>
                        <option value="1.0">⭐ (1.0)</option>
                    </select>
                </div>

                <div class="btn-container">
                    <input type="submit" value="🏪 Add Restaurant">
                    <a href="adminhome.jsp" class="btn btn-secondary">Cancel</a>
                </div>
            </div>
=======
    <div class="container">
        <h1>ADD RESTAURANT</h1>
        <form action="AddRestaurant">
            <label for="restid">Restaurant ID:</label>
            <input type="text" name="restid" id="restid" required>

            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required>

            <label for="cuisineType">Cuisine Type:</label>
            <input type="text" name="cusionType" id="cuisineType" required>

            <label for="deliveryTime">Delivery Time (min):</label>
            <input type="number" name="deleiverytime" id="deliveryTime" required>

            <label for="isActive">Is Active:</label>
            <input type="text" name="isactive" id="isActive" required>

            <label for="ratings">Ratings:</label>
            <input type="text" name="ratings" id="ratings" required>

            <input type="submit" value="Submit">
>>>>>>> b0c5b995833117a9018f01f37507912f3a09d135
        </form>
    </div>
</body>
</html>
