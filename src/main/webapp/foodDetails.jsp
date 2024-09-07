<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.FoodModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Details</title>
    <style>
        /* Main theme styles */
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .main {
            width: 80%;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            text-align: left;
            padding: 12px 15px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        th {
            background-color: #6a11cb;
            color: white;
            font-weight: bold;
        }

        td {
            color: #333;
        }

        button {
            background-color: #6a11cb;
            border: none;
            color: white;
            padding: 10px 16px;
            text-align: center;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2575fc;
        }

        .action-buttons a {
            text-decoration: none;
        }

        .delete-button:hover {
            background-color: #e64a19;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        
    </style>
</head>
<body>

<div class="main">
    <h2>Food Details</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Food Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Description</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
        <% 
            ArrayList<FoodModel> foodList = (ArrayList<FoodModel>) request.getAttribute("foodList");
            if (foodList != null) {
                for (FoodModel food : foodList) { 
        %>
        <tr>
            <td><%= food.getId() %></td>
            <td><%= food.getFoodName() %></td>
            <td><%= food.getCategory() %></td>
            <td><%= food.getPrice() %></td>
            <td><%= food.getDescription() %></td>
            <td>
                <a href="DeleteFood?id=<%= food.getId() %>" onclick="return confirm('Are you sure you want to delete this food item?')">
                    <button class="delete-button">Delete</button>
                </a>
            </td>
            <td>
                <a href="GetFoodById?id=<%= food.getId() %>">
                    <button>Update</button>
                </a>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="7">No food items available.</td>
        </tr>
        <% } %>
    </table>

    <div class="action-buttons">
        <a href="index.jsp">
            <button>Go back to main menu</button>
        </a>
        <a href="addFood.jsp">
            <button>Add New Food</button>
        </a>
    </div>
</div>

</body>
</html>
