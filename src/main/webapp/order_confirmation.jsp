<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
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
    text-align: center;
    padding: 20px;
    color: #66593B;
}

.confirmation-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 80vh;
}

.message {
    font-size: 2rem;
    font-weight: bold;
    color: #A38131;
    margin-bottom: 20px;
}

.bike-animation {
    position: relative;
    width: 100%;
    overflow: hidden;
    height: 300px;
    background-color: #E3CC98;
    border-radius: 10px;
    margin: 20px 0;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.bike {
    position: absolute;
    bottom: 10px;
    left: -150px;
    width: 200px;
    animation: ride 5s linear infinite;
}

@keyframes ride {
    0% { left: -150px; }
    100% { left: 100%; }
}

.thank-you {
    font-size: 1.2rem;
    color: #66593B;
    margin-top: 20px;
}

    </style>
</head>
<body>
    
    <div class="confirmation-container">
        <div class="message">Your Order is Confirmed!</div>
        <div class="bike-animation">
            <img src="images/download.jpg" alt="Delivery Bike" class="bike">
        </div>
        <p>Our delivery partner is on the way to deliver your delicious meal!</p>
    </div>
</body>
</html>
