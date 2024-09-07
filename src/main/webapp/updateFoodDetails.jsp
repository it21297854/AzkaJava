<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.FoodModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Food Details</title>
    <style>
        /* Main theme styles */
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #6a11cb;
            border: none;
            color: white;
            padding: 10px 16px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: block;
            margin: 0 auto;
            margin-bottom: 20px;
        }

        button:hover {
            background-color: #2575fc;
        }
        
        a {
    		text-decoration: none; /* Removes underline */
		}

		a:hover {
    		text-decoration: none; /* Ensures no underline on hover as well */
		}

    </style>
</head>
<body>

<div class="container">
    <h2>Update Food Details</h2>

    <form action="UpdateFoodServlet" method="POST">
        <input type="hidden" name="id" value="<%= ((FoodModel) request.getAttribute("food")).getId() %>" />

        <label for="foodName">Food Name:</label>
        <input type="text" id="foodName" name="foodName" value="<%= ((FoodModel) request.getAttribute("food")).getFoodName() %>" required />

        <label for="category">Category:</label>
        <input type="text" id="category" name="category" value="<%= ((FoodModel) request.getAttribute("food")).getCategory() %>" required />

        <label for="price">Price:</label>
        <input type="number" step="0.01" id="price" name="price" value="<%= ((FoodModel) request.getAttribute("food")).getPrice() %>" required />

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="5" required><%= ((FoodModel) request.getAttribute("food")).getDescription() %></textarea>

        <button type="submit">Update Food</button>
    </form>

    <a href="FoodDetailsServlet">
        <button>Back to Food List</button>
    </a>
</div>

</body>
</html>
