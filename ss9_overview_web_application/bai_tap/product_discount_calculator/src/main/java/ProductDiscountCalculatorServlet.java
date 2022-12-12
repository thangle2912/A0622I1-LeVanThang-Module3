import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/display-discount")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float listPrice = Float.parseFloat(request.getParameter("list_price"));
        float discountPercent = Float.parseFloat(request.getParameter("discount_percent"));
        String description = request.getParameter("description");

        float discountAmount = (float) (listPrice * discountPercent * 0.01);

        float discountPrice = listPrice - discountAmount;

        request.setAttribute("discount_Amount",discountAmount);
        request.setAttribute("discount_price",discountPrice);
        request.setAttribute("description",description);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
