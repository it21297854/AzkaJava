<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.OrderModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <style>
        /* Same CSS as before */
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

        .back-button {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        input[type="text"] {
            padding: 8px;
            width: 50%;
            margin: 10px auto;
            display: block;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        select {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="main">
    <h2>Order Details</h2>

    <!-- Search Bar -->
    <input type="text" id="searchBar" onkeyup="searchOrders()" placeholder="Search for orders..">

    <table id="orderTable">
        <tr>
            <th>ID</th>
            <th>Food Name</th>
            <th>Customer ID</th>
            <th>Quantity</th>
            <th>Order Status</th>
            <th>Order Date</th>
            <th>Action</th>
        </tr>
        <% 
            ArrayList<OrderModel> orderList = (ArrayList<OrderModel>) request.getAttribute("orderList");
            if (orderList != null) {
                for (OrderModel order : orderList) { 
        %>
        <tr>
            <td><%= order.getId() %></td>
            <td><%= order.getFoodName() %></td>
            <td><%= order.getCustomerId() %></td>
            <td><%= order.getQuantity() %></td>
            <td>
                <select id="status-<%= order.getId() %>">
                    <option value="Pending" <%= "Pending".equals(order.getOrderStatus()) ? "selected" : "" %>>Pending</option>
                    <option value="Completed" <%= "Completed".equals(order.getOrderStatus()) ? "selected" : "" %>>Completed</option>
                    <option value="Canceled" <%= "Canceled".equals(order.getOrderStatus()) ? "selected" : "" %>>Canceled</option>
                </select>
            </td>
            <td><%= order.getOrderDate() %></td>
            <td>
                <button onclick="saveOrder(<%= order.getId() %>)">Save</button>
                <button onclick="deleteOrder(<%= order.getId() %>)">Delete</button>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="7">No orders available.</td>
        </tr>
        <% } %>
    </table>

    <!-- Back to Main Menu Button -->
    <div class="back-button">
        <button onclick="location.href='index.jsp'">Back to Main Menu</button>
    </div>
</div>

<script>
    // AJAX to save order status
    function saveOrder(orderId) {
        var status = document.getElementById("status-" + orderId).value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "UpdateOrderServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert(xhr.responseText); // Popup with success or failure message
            }
        };

        xhr.send("orderId=" + orderId + "&orderStatus=" + status + "&action=save");
    }

    // AJAX to delete an order
    function deleteOrder(orderId) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "UpdateOrderServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert(xhr.responseText); // Popup with success or failure message
                location.reload(); // Reload the page after deletion
            }
        };

        xhr.send("orderId=" + orderId + "&action=delete");
    }

    // Search functionality for orders
    function searchOrders() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchBar");
        filter = input.value.toUpperCase();
        table = document.getElementById("orderTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            tr[i].style.display = "none";
            td = tr[i].getElementsByTagName("td");
            for (var j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    }
                }
            }
        }
    }
</script>

</body>
</html>
