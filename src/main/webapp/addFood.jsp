<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Food</title>
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .main {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin: 10px 0 5px 0;
        }

        input, textarea {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
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

<div class="main">
    <h2>Add New Food</h2>
    <form action="AddFoodServlet" method="post">
        <label for="foodName">Food Name:</label>
        <input type="text" id="foodName" name="foodName" required>

        <label for="category">Category:</label>
        <input type="text" id="category" name="category" required>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>

        <button type="submit">Add Food</button>
    </form>

    <div class="action-buttons">
        <a href="index.jsp"><button>Go back to main menu</button></a>
    </div>
</div>

</body>
</html>
