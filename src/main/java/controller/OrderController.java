package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.OrderModel;
import util.dbConnect;

public class OrderController {
	private static Connection con;
    private PreparedStatement preparedStatement;
    
	public ArrayList<OrderModel> getOrderItems() {
	    ArrayList<OrderModel> orderList = new ArrayList<>();
	    String query = "SELECT o.id, o.food_id, o.customer_id, o.quantity, o.order_status, o.order_date, f.foodName " +
	                   "FROM orders o " +
	                   "JOIN AzfoodTB f ON o.food_id = f.id " +
	                   "ORDER BY o.id";

	    try {
	        con = dbConnect.initializeDatabase();
	        preparedStatement = con.prepareStatement(query);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            OrderModel order = new OrderModel();
	            order.setId(resultSet.getInt("id"));
	            order.setFoodId(resultSet.getInt("food_id"));
	            order.setCustomerId(resultSet.getString("customer_id"));
	            order.setQuantity(resultSet.getInt("quantity"));
	            order.setOrderStatus(resultSet.getString("order_status"));
	            order.setFoodName(resultSet.getString("foodName"));  // Set the food name from the AzfoodTB table
	            order.setOrderDate(resultSet.getString("order_date"));
	            orderList.add(order);
	        }
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    } finally {
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    return orderList;
	}
	
	public void updateOrderStatus(int orderId, String status) {
        Connection con = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish a connection
            con = dbConnect.initializeDatabase();

            // Update query to change the order status based on order ID
            String query = "UPDATE orders SET order_status = ? WHERE id = ?";

            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, status); // Set the new order status
            preparedStatement.setInt(2, orderId);   // Set the order ID for which the status needs to be updated

            // Execute the update
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Order status updated successfully for order ID: " + orderId);
            } else {
                System.out.println("Failed to update order status for order ID: " + orderId);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close the connection and prepared statement
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // Method to delete an order from the database
    public void deleteOrder(int orderId) {
        Connection con = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish a connection
            con = dbConnect.initializeDatabase();

            // Delete query to remove the order based on order ID
            String query = "DELETE FROM orders WHERE id = ?";

            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, orderId); // Set the order ID that needs to be deleted

            // Execute the delete
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Order deleted successfully for order ID: " + orderId);
            } else {
                System.out.println("Failed to delete order for order ID: " + orderId);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close the connection and prepared statement
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
