<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
    <style>
        body {
            background-color: #EDDEBB; /* Light background color */
            font-family: Arial, sans-serif; /* Font style */
            color: #66593B; /* Text color */
            margin: 0;
            height: 100vh; /* Full viewport height */
            display: flex; /* Flexbox layout */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }

        .container {
            background-color: #E3CC98; /* Container background color */
            padding: 30px; /* Padding around content */
            border: 1px solid #A38131; /* Border color */
            border-radius: 10px; /* Rounded corners */
            width: 90%; /* Responsive width */
            max-width: 400px; /* Maximum width */
            text-align: center; /* Center text */
        }

        h2 {
            color: #A38131; /* Header color */
            margin-bottom: 20px; /* Space below header */
        }

        label {
            display: block; /* Each label on a new line */
            margin-bottom: 5px; /* Space below label */
            font-weight: bold; /* Bold text */
            text-align: left; /* Align text to the left */
        }

        input[type="text"], input[type="password"] {
            width: 100%; /* Full width */
            padding: 10px; /* Padding inside input */
            margin-bottom: 15px; /* Space below input */
            border: 1px solid #A38131; /* Border color */
            border-radius: 5px; /* Rounded corners */
            box-sizing: border-box; /* Include padding in total width */
        }

        input[type="submit"] {
            background-color: #CCAF6A; /* Submit button color */
            color: white; /* Submit button text color */
            padding: 10px; /* Padding inside button */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
            width: 100%; /* Full width */
            font-weight: bold; /* Bold text */
        }

        input[type="submit"]:hover {
            background-color: #A38131; /* Button hover color */
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Login Form</h2>

    <form action="adminloginServlet" method="post">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
