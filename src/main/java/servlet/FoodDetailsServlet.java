package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.FoodController;
import bean.FoodModel;

@WebServlet("/FoodDetailsServlet")
public class FoodDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<FoodModel> foodList = new ArrayList<FoodModel>(); 

        FoodController foodController = new FoodController(); 

        foodList = foodController.getFoodItems(); 

        request.setAttribute("foodList", foodList); // Update the attribute name
        RequestDispatcher dispatcher = request.getRequestDispatcher("foodDetails.jsp"); 
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
