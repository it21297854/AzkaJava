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

@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Assuming you have a method to initialize the DB connection
            con = dbConnect.initializeDatabase();

            // Update order status to "Cancelled"
            String query = "UPDATE orders SET order_status = ? WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "Cancelled");
            ps.setInt(2, orderId);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                request.setAttribute("message", "Order cancelled successfully.");
            } else {
                request.setAttribute("message", "Failed to cancel the order.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while canceling the order.");
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
