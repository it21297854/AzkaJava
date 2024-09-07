package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.FoodController;  // Assuming the implementation class is named FoodImp
import bean.FoodModel;  // Assuming the model class is named FoodModel

@WebServlet("/GetFoodById")
public class GetFoodById extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GetFoodById() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

        int id = Integer.parseInt(request.getParameter("id")); // Extract the 'id' parameter from the request

        // Create an instance of the implementation class to handle business logic
        FoodController foodImp = new FoodController();
        FoodModel food;

        // Get the food details by ID
        food = foodImp.getFoodByID(id);

        // Set the food object as a request attribute and forward to the JSP for display/editing
        request.setAttribute("food", food);
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateFoodDetails.jsp");  // Update the JSP page to match your food update form
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);  // Call doGet method for POST requests as well
    }
}
