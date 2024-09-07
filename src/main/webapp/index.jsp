<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Portal</title>
<style>
    body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

    .admin-container {
      max-width: 500px;
      margin: 100px auto;
      padding: 30px;
      border: 1px solid #dcdcdc;
      border-radius: 5px;
      background-color: white;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
      text-align: center;
    }

    h1 {
      color: #333;
    }

    p {
      color: #666;
      margin-bottom: 20px;
    }

    .admin-button {
      display: inline-block;
      padding: 10px 20px;
      background-color: #6a11cb;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.2s ease-in-out;
    }

    .admin-button:hover {
      background-color: #2575fc;
    }
  </style>
</head>
<body>
  <div class="admin-container">
    <h1>Welcome, Foodie Paradise Ordering System!</h1>
    <p>You have access to the portal here.</p>
    <a href="FoodDetailsServlet" class="admin-button">Admin Portal</a>
    <a href="login.jsp" class="admin-button">User Portal</a>
    <a href="StaffPortalServlet" class="admin-button">Staff Portal</a>
    
  </div>
</body>
</html>