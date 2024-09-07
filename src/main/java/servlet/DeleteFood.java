package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.FoodController;

@WebServlet("/DeleteFood")
public class DeleteFood extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        boolean check;
        FoodController foodController = new FoodController(); // Make sure to use the correct controller class
        check = foodController.deleteFood(id); // Use the appropriate method to delete feedback
        
        if (check) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("FoodDetailsServlet"); // Use the correct servlet
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminHome.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

