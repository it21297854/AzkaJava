package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.dbConnect;

@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Establish a database connection
            Connection con = dbConnect.initializeDatabase();

            // Get form parameters from the request
            String foodName = request.getParameter("foodName");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");

            // Create an SQL query to insert the new food item into the database
            String query = "INSERT INTO azfoodtb (foodName, category, price, description) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, foodName);
            pst.setString(2, category);
            pst.setDouble(3, price);
            pst.setString(4, description);

            // Execute the query
            int rowsAffected = pst.executeUpdate();

            // If rows were affected, the insert was successful
            if (rowsAffected > 0) {
                // Forward to the food details or main page after adding
                RequestDispatcher rd = request.getRequestDispatcher("FoodDetailsServlet");
                rd.forward(request, response);
            } else {
                // Handle the case where insert failed
                RequestDispatcher rd = request.getRequestDispatcher("addFood.jsp");
                rd.forward(request, response);
            }

            // Close the database connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Forward to an error page
        }
    }
}
