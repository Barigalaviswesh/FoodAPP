<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Menu</title>
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
            max-width: 500px; /* Limits the container's width */
            text-align: center;
        }

        h1 {
            color: #A38131;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px 0;
            font-weight: bold;
            color: #66593B;
        }

        input[type="text"], input[type="number"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
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
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #A38131;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Menu Item</h1>
        <form action="AddMenu">
            <label for="menuid">Menu ID:</label>
            <input type="number" name="menuid" id="menuid" required>

            <label for="restid">Restaurant ID:</label>
            <input type="text" name="restid" id="restid" required>

            <label for="itemname">Item Name:</label>
            <input type="text" name="itemname" id="itemname" required>

            <label for="description">Description:</label>
            <input type="text" name="description" id="description" required>

            <label for="price">Price:</label>
            <input type="number" name="price" id="price" required>

            <label for="isavail">Is Available:</label>
            <input type="number" name="isavail" id="isavail" required>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
