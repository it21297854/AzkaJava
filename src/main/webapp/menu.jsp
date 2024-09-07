<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.FoodModel" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Foodie Paradise</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4ff;
            color: #333;
        }

        /* Navbar styles */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
            color: #6a11cb;
        }

        .navbar ul {
            list-style-type: none;
            display: flex;
        }

        .navbar ul li {
            margin: 0 15px;
        }

        .navbar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .navbar ul li a:hover {
            color: #6a11cb;
        }

        /* Menu Section */
        .menu-section {
            padding: 40px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 40px;
            color: #6a11cb;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .menu-item {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .menu-item h3 {
            color: #2575fc;
            margin-bottom: 15px;
        }

        .menu-item p {
            font-size: 16px;
            color: #666;
        }

        .menu-item .price {
            font-size: 18px;
            margin: 10px 0;
            color: #333;
        }

        .menu-item form {
            margin-top: 15px;
        }

        .menu-item input[type="number"] {
            width: 60px;
            padding: 5px;
        }

        .menu-item button {
            background-color: #6a11cb;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .menu-item button:hover {
            background-color: #2575fc;
        }

        footer {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">Foodie Paradise</div>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="MenuServlet">Menu</a></li>
            <li><a href="OrderDetailsServlet">Orders</a></li>
            <li><a href="#contact">Contact</a></li>
            <%
                if (session.getAttribute("username") != null) {
            %>
            <li><a href="LogoutServlet">Logout</a></li>
            <%
                } else {
            %>
            <li><a href="login.jsp">Login</a></li>
            <%
                }
            %>
        </ul>
    </div>

    <!-- Menu Section -->
    <div class="menu-section">
        <h2>Our Delicious Menu</h2>
        <div class="menu-grid">
            <% 
                // Assuming that foodItemsList is passed as an attribute with an ArrayList of FoodModel objects
                ArrayList<FoodModel> foodItemsList = (ArrayList<FoodModel>) request.getAttribute("foodItemsList");
                for (FoodModel food : foodItemsList) {
            %>
            <div class="menu-item">
                <h3><%= food.getFoodName() %></h3>
                <p><strong>Category:</strong> <%= food.getCategory() %></p> <!-- Category of the food -->
                <p><%= food.getDescription() %></p> <!-- Description of the food -->
                <div class="price">$<%= food.getPrice() %></div> <!-- Price -->
                <form action="OrderNowServlet" method="POST">
                    <input type="hidden" name="foodId" value="<%= food.getId() %>" />
                    <input type="number" name="quantity" value="1" min="1" />
                    <button type="submit">Order Now</button>
                </form>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2024 Foodie Paradise. All Rights Reserved.
    </footer>

</body>
</html>
