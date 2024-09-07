package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.dbConnect;

@WebServlet("/OrderNowServlet")
public class OrderNowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int foodId = Integer.parseInt(request.getParameter("foodId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String customerId = (String) request.getSession().getAttribute("username"); // Assuming customer is logged in
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Assuming you have a method to initialize the DB connection
            con = dbConnect.initializeDatabase();

            // Insert order into orders table
            String query = "INSERT INTO orders (food_id, customer_id, quantity, order_status) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setInt(1, foodId);
            ps.setString(2, customerId);
            ps.setInt(3, quantity);
            ps.setString(4, "Pending");

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("message", "Order placed successfully!");
            } else {
                request.setAttribute("message", "Failed to place order.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while placing your order.");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);
    }
}
