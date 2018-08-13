package pl.coderslab.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import pl.coderslab.dao.EmployeeDAO;
import pl.coderslab.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/repository/employees")
public class EmployeesRepository extends HttpServlet {
    ObjectMapper mapper = new ObjectMapper();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try {
            List<Employee> employees = EmployeeDAO.loadAll();
            out.append(mapper.writeValueAsString(employees));
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
