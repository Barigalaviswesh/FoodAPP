<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Restaurant</title>
    <style>
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
        }

        h1 {
            color: #A38131;
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
        }
    </style>
</head>
<body>
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
        </form>
    </div>
</body>
</html>
