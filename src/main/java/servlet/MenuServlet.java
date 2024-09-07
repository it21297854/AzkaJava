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
import bean.FoodModel;
import util.dbConnect;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<FoodModel> foodItemsList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Assuming you have a method to initialize the DB connection
            con = dbConnect.initializeDatabase();
            String query = "SELECT * FROM AzfoodTB"; // Assuming food_items is your food table
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                FoodModel food = new FoodModel();
                food.setId(rs.getInt("id"));
                food.setFoodName(rs.getString("foodName")); // Name of the food item
                food.setCategory(rs.getString("category")); // Category of the food
                food.setPrice(rs.getDouble("price")); // Price of the food item
                food.setDescription(rs.getString("description")); // Description of the food item
                foodItemsList.add(food);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Pass the list to the JSP page
        request.setAttribute("foodItemsList", foodItemsList);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
