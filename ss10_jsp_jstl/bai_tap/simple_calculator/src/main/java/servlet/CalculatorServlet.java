package servlet;

import model.Calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float number1 = Float.parseFloat(request.getParameter("number1"));
        float number2 = Float.parseFloat(request.getParameter("number2"));

        char operator = request.getParameter("operator").charAt(0);
        try {
            float result = Calculator.calculator(number1, number2, operator);

            request.setAttribute("number1",number1);
            request.setAttribute("number2",number2);
            request.setAttribute("operator",operator);
            request.setAttribute("result",result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
            requestDispatcher.forward(request,response);
        } catch (Exception e) {
            request.setAttribute("result",e.getMessage());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
            requestDispatcher.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
