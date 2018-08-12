package pl.coderslab.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/orders")
public class Orders extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Integer employeeId = null;
//        List<Order> orders;
//        try {
//            employeeId = Integer.parseInt(request.getParameter("employeeId"));
//            request.setAttribute("employeeId", employeeId);
//        } catch (NumberFormatException ignore) {
//        }
//
//        try {
//            if (employeeId == null) {
//                orders = OrderDAO.loadAll();
//
//            } else {
//                orders = OrderDAO.loadByEmployeeId(employeeId);
//
//            }
//            request.setAttribute("orders", orders);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        try {
//            List<Employee> employees = EmployeeDAO.loadAll();
//            request.setAttribute("employees", employees);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        try {
            getServletContext().getRequestDispatcher("/WEB-INF/orders.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
