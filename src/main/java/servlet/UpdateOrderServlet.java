package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.OrderController;

@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String action = request.getParameter("action");

        OrderController orderController = new OrderController();
        String result = "";

        if ("save".equals(action)) {
            String orderStatus = request.getParameter("orderStatus");
            orderController.updateOrderStatus(orderId, orderStatus); // Update order status in DB
            result = "Order status updated to " + orderStatus; // Message for success popup
        } else if ("delete".equals(action)) {
            orderController.deleteOrder(orderId); // Delete order from DB
            result = "Order deleted successfully"; // Message for deletion popup
        }

        // Send the result back to the JSP via AJAX response
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(result);
        out.flush();
    }
}
