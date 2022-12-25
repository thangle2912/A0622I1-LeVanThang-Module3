package servlet;

import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer_list")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer(1,"Thắng","29-12-2001","Quảng Trị","https://cdn.dribbble.com/users/108698/screenshots/7340694/media/fd0e4a3108675997acab824ec43a50d8.png?compress=1&resize=400x300"));
        customerList.add(new Customer(2,"Thắng","29-12-2001","Quảng Trị","https://cdn.dribbble.com/users/108698/screenshots/7340694/media/fd0e4a3108675997acab824ec43a50d8.png?compress=1&resize=400x300"));
        customerList.add(new Customer(3,"Thắng","29-12-2001","Quảng Trị","https://cdn.dribbble.com/users/108698/screenshots/7340694/media/fd0e4a3108675997acab824ec43a50d8.png?compress=1&resize=400x300"));
        customerList.add(new Customer(4,"Thắng","29-12-2001","Quảng Trị","https://cdn.dribbble.com/users/108698/screenshots/7340694/media/fd0e4a3108675997acab824ec43a50d8.png?compress=1&resize=400x300"));
        customerList.add(new Customer(5,"Thắng","29-12-2001","Quảng Trị","https://cdn.dribbble.com/users/108698/screenshots/7340694/media/fd0e4a3108675997acab824ec43a50d8.png?compress=1&resize=400x300"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        requestDispatcher.forward(request,response);

    }

    @Override
    public void init() throws ServletException {

    }
}
