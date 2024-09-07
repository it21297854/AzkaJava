package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.FoodController;  // Make sure you have this implementation for handling food operations
import bean.FoodModel;     // Your FoodModel class for holding food data

@WebServlet("/UpdateFoodServlet")
public class UpdateFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // You can add any necessary code here if needed for GET requests.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

        // Create a new FoodModel object to store the updated food details
        FoodModel food = new FoodModel();

        // Set the properties of the FoodModel object from the request parameters
        food.setId(Integer.parseInt(request.getParameter("id")));
        food.setFoodName(request.getParameter("foodName"));
        food.setCategory(request.getParameter("category"));
        food.setPrice(Double.parseDouble(request.getParameter("price")));
        food.setDescription(request.getParameter("description"));

        // Call the FoodImp class (similar to FeedbackImp) to update the food details
        FoodController foodImp = new FoodController();
        boolean check = foodImp.editFood(food);

        if (check) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("FoodDetailsServlet");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminHome.jsp");
            dispatcher.forward(request, response);
        }
    }
}
