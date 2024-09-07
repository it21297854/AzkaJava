<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4ff;
            text-align: center;
            margin: 0;
            padding: 50px;
        }

        .message-box {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: inline-block;
            margin-top: 20px;
        }

        .message-box h2 {
            color: #6a11cb;
        }

        .message-box p {
            color: #333;
            font-size: 18px;
        }

        .message-box a {
            display: inline-block;
            background-color: #6a11cb;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px;
        }

        .message-box a:hover {
            background-color: #2575fc;
        }
    </style>
</head>
<body>

    <div class="message-box">
        <h2>Order Status</h2>
        <p><%= request.getAttribute("message") %></p>
        <p>Have any questions or need assistance? here to help! Phone : +94768800398</p>
        <a href="MenuServlet">Go back to Menu</a>
    </div>

</body>
</html>
