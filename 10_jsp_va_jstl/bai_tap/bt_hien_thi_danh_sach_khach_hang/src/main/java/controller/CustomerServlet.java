package controller;

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

@WebServlet(name = "CustomerServlet", urlPatterns = {"", "/customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> listCustomer;

    static {
        listCustomer = new ArrayList<>();
        listCustomer.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Da Nang", "customer.jpeg"));
        listCustomer.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Hà Nội", "customer.jpeg"));
        listCustomer.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Bắc Giang", "customer.jpeg"));
        listCustomer.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Nam Định", "customer.jpeg"));
        listCustomer.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Tây", "customer.jpeg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", listCustomer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);
    }
}
