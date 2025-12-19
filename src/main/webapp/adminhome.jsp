<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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
            text-align: center;
            padding: 50px;
            background-color: #E3CC98;
            border: 1px solid #A38131;
            border-radius: 10px;
            width: 50%;
            max-width: 400px; /* Ensures it doesn't get too wide */
        }

        h1 {
            color: #A38131;
        }

        a {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #CCAF6A;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            width: 200px;
        }

        a:hover {
            background-color: #A38131;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <a href="addRestarent.jsp">ADD RESTAURANT</a>
        <a href="addMenu.jsp">ADD MENU</a>
    </div>
</body>
</html>
