<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.OrderModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4ff;
            text-align: center;
            margin: 0;
            padding: 50px;
        }

        .order-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: inline-block;
            width: 80%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #6a11cb;
            color: white;
        }

        button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #c0392b;
        }

        a {
            text-decoration: none;
        }

        .message {
            margin-top: 20px;
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>

    <div class="order-container">
        <h2>Your Orders</h2>

        <table>
            <tr>
                <th>Order ID</th>
                <th>Food Name</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <% 
                ArrayList<OrderModel> orderList = (ArrayList<OrderModel>) request.getAttribute("orderList");
                for (OrderModel order : orderList) { 
            %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getFoodName() %></td>
                <td><%= order.getQuantity() %></td>
                <td><%= order.getOrderStatus() %></td>
                <td>
                    <form action="CancelOrderServlet" method="POST" style="display: inline;">
                        <input type="hidden" name="orderId" value="<%= order.getId() %>" />
                        <button type="submit">Cancel</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>

        <p class="message"><%= request.getAttribute("message") %></p>
    </div>

</body>
</html>
