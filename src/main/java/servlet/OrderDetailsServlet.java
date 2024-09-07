package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderModel;
import util.dbConnect;

@WebServlet("/OrderDetailsServlet")
public class OrderDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerId = request.getSession().getAttribute("username").toString();
        ArrayList<OrderModel> orderList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Initialize database connection
            con = dbConnect.initializeDatabase();

            // Query to fetch orders for the logged-in user
            String query = "SELECT o.id, o.food_id, o.customer_id, o.quantity, o.order_status, f.food_name " +
                           "FROM orders o " +
                           "JOIN azfoodtb f ON o.food_id = f.id " +
                           "WHERE o.customer_id = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, customerId);
            rs = ps.executeQuery();

            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setId(rs.getInt("id"));
                order.setFoodId(rs.getInt("food_id"));
                order.setCustomerId(rs.getString("customer_id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setFoodName(rs.getString("food_name"));
                orderList.add(order);
            }

            // Set order list as request attribute
            request.setAttribute("orderList", orderList);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while fetching your orders.");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Forward to the JSP page to display orders
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}

