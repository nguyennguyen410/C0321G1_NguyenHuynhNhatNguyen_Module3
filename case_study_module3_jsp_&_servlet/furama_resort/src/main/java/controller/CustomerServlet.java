package controller;

import Validate.Validate;
import model.bean.Customer;
import model.service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private CustomerServiceImpl customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    insert(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "editCustomer":
                try {
                    updateCustomerId(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }
    }

    private void updateCustomerId(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("customerId");
        int type = Integer.parseInt(request.getParameter("customerTypeId"));
        String name = request.getParameter("customerName");
        String birthday = request.getParameter("customerBirthday");
        int gender = Integer.parseInt(request.getParameter("customerGender"));
        String idCard = request.getParameter("customerIdCard");
        String phone = request.getParameter("customerPhone");
        String email = request.getParameter("customerEmail");
        String address = request.getParameter("customerAddress");
        Customer customer =new Customer(id, type, name, birthday, gender, idCard, phone, email, address);

        customerService.updateCustomer(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit-customer.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String customerId = request.getParameter("customerId");
        if(Validate.validateCustomerId(customerId)!=null){
            request.setAttribute("messCustomer", "Customer Id like KH-XXXX (X: 0-9)");
            showNewForm(request,response);
            return;
        }
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        if(Validate.validateCustomerDate(customerBirthday)!=null){
            request.setAttribute("messCustomerDate", "Date like YYYY/MM/DD");
            showNewForm(request,response);
            return;
        }
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        if(Validate.validateCustomerIdCard(customerIdCard)!=null){
            request.setAttribute("messCustomerIdCard", "Customer Id Card like XXXXXXXXX (X: 0-9)");
            showNewForm(request,response);
            return;
        }
        String customerPhone = request.getParameter("customerPhone");
        if(Validate.validateCustomerPhone(customerPhone)!=null){
            request.setAttribute("messCustomerPhone", "Customer Phone like (XX)-XXXXXXXXXX (X: 0-9)");
            showNewForm(request,response);
            return;
        }
        String customerEmail = request.getParameter("customerEmail");
        if(Validate.validateCustomerEmail(customerEmail)!=null){
            request.setAttribute("messCustomerEmail", "Customer Email invalid");
            showNewForm(request,response);
            return;
        }
        String customerAddress = request.getParameter("customerAddress");
        Customer newCustomer = new Customer(customerId, customerTypeId, customerName, customerBirthday, customerGender, customerIdCard, customerPhone, customerEmail, customerAddress);
        customerService.insertCustomer(newCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("create-customer.jsp");
        dispatcher.forward(request, response);

    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String customerId = request.getParameter("customerId");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");

        Customer newCustomer = new Customer(customerId, customerTypeId, customerName, customerBirthday, customerGender, customerIdCard, customerPhone, customerEmail, customerAddress);
        Map<String, String> mapMessenger = customerService.insert(newCustomer);
        if (!mapMessenger.isEmpty()){
            request.setAttribute("newCustomer", newCustomer);
            request.setAttribute("messCustomer", mapMessenger.get("messCustomer"));
            request.setAttribute("messCustomerDate", mapMessenger.get("messCustomerDate"));
            request.setAttribute("messCustomerEmail", mapMessenger.get("messCustomerEmail"));
            request.setAttribute("messCustomerPhone", mapMessenger.get("messCustomerPhone"));
            request.setAttribute("messCustomerIdCard", mapMessenger.get("messCustomerIdCard"));
            showNewForm(request,response);
            return;
        }else {
            customerService.insertCustomer(newCustomer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("create-customer.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "homeCustomer":
                showHomeForm(request, response);
                break;
            case "listCustomer":
                try {
                    showListCustomer(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "deleteCustomer":
                try {
                    deleteCustomerById(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "editCustomer":
                try {
                    editCustomerForm(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                break;
        }
    }

    private void editCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String customerId = request.getParameter("customerId");
        Customer customer = customerService.selectCustomer(customerId);

        RequestDispatcher dispatcher = request.getRequestDispatcher("edit-customer.jsp");
        request.setAttribute("customer", customer);
        dispatcher.forward(request, response);
    }

    private void deleteCustomerById(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String customerId =request.getParameter("customerId");
        customerService.deleteCustomer(customerId);

        List<Customer> listCustomer = customerService.selectAllCustomer();
        request.setAttribute("listCustomer", listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-customer.jsp");
        dispatcher.forward(request, response);
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Customer> listCustomer = customerService.selectAllCustomer();
        request.setAttribute("listCustomer", listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-customer.jsp");
        dispatcher.forward(request, response);
    }

    private void showHomeForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("create-customer.jsp");
        dispatcher.forward(request, response);
    }
}
