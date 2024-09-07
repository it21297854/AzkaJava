<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        /* Reset some basic styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
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

        /* Section styles */
        section {
            padding: 60px 20px;
            text-align: center;
        }

        .section-home {
            background-color: #f0f4ff;
        }

        .section-fooditems {
            background-color: #fff3e0;
        }

        .section-about {
            background-color: #e0ffe4;
        }

        .section-contact {
            background-color: #f4e4ff;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 32px;
            color: #6a11cb;
        }

        p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
            color: #666;
        }

        .btn {
            background-color: #6a11cb;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2575fc;
        }

        /* Footer */
        footer {
            background-color: #333;
            color: #fff;
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
            <li><a href="#home">Home</a></li>
            <li><a href="#fooditems">Food Items</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact Us</a></li>
            <% 
            // Check if the user is logged in
            if (session.getAttribute("username") != null) { 
        %>
        <li><a href="LogoutServlet">Logout</a></li>
        <% } else { %>
        <li><a href="login.jsp">Login</a></li>
        <% } %>
        </ul>
    </div>

    <!-- Home Section -->
    <section id="home" class="section-home">
        <h2>Welcome to Foodie Paradise!</h2>
        <p>Your one-stop destination for delicious food items delivered right to your doorstep.</p>
        <a href="#fooditems" class="btn">Explore Our Menu</a>
    </section>

    <!-- Food Items Section -->
    <section id="fooditems" class="section-fooditems">
        <h2>Our Food Items</h2>
        <p>We offer a variety of delicious meals prepared with the finest ingredients.</p>
        <p>Choose from our diverse range of cuisines and enjoy the flavors of paradise.</p>
        <a href="MenuServlet" class="btn">View Full Menu</a>
    </section>

    <!-- About Section -->
    <section id="about" class="section-about">
        <h2>About Us</h2>
        <p>At Foodie Paradise, we believe that food brings people together. Our goal is to provide the best culinary experience through fresh ingredients and creative recipes.</p>
        <p>We started our journey in 2024 and have been serving our customers with love and passion ever since.</p>
    </section>

    <!-- Contact Us Section -->
    <section id="contact" class="section-contact">
        <h2>Contact Us</h2>
        <p>Have any questions or need assistance? We’re here to help!</p>
        <p>Email us at: <a href="mailto:support@foodieparadise.com">support@foodieparadise.com</a></p>
        <p>Phone: +9768800398</p>
        <a href="contact.jsp" class="btn">Get in Touch</a>
    </section>

    <!-- Footer -->
    <footer>
        &copy; 2024 Foodie Paradise. All Rights Reserved.
    </footer>

</body>
</html>