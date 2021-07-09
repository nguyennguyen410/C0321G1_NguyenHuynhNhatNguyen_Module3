package controller;

import Validate.Validate;
import model.bean.AttachService;
import model.bean.Customer;
import model.bean.Service;
import model.service.ServiceServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServiceServlet", value = "/service")
public class ServiceServlet extends HttpServlet {
    ServiceServiceImpl serviceService = new ServiceServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                try {
                    insertService(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            
            default:
                break;
        }
    }

    private void insertService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String serviceId = request.getParameter("serviceId");
        if(Validate.validateServiceId(serviceId)!=null){
            request.setAttribute("messService", "Service Id like DV-XXXX (X: 0-9)");
            showCreateServiceForm(request,response);
            return;
        }
        String serviceName = request.getParameter("serviceName") ;
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        if(Validate.validateNumber(request.getParameter("numberOfFloor"))!=null){
            request.setAttribute("messNumber", "Number invalid");
            showCreateServiceForm(request,response);
            return;
        }

        /*double totalMoney = serviceCost * rentTypeId;
        request.setAttribute("totalMoney", totalMoney);*/
        Service service = new Service(serviceId,serviceName,serviceArea,serviceCost,serviceMaxPeople,rentTypeId,serviceTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloor);
        serviceService.insertService(service);

        RequestDispatcher dispatcher = request.getRequestDispatcher("create-service.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "homeService":
                showHomeServiceForm(request, response);
                break;
            case "create":
                showCreateServiceForm(request, response);
                break;
            case "listServiceUsed":
                try {
                    showList(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Service> listServiceUsed = serviceService.selectServiceUsed();
        List<Customer> listCustomerUsed = serviceService.selectCustomerUsed();
        List<AttachService> listAttachServiceUsed = serviceService.selectAttachServiceUsed();
        request.setAttribute("listServiceUsed", listServiceUsed);
        request.setAttribute("listCustomerUsed", listCustomerUsed);
        request.setAttribute("listAttachUsed", listAttachServiceUsed);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-service-used.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateServiceForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("create-service.jsp");
        dispatcher.forward(request, response);
    }

    private void showHomeServiceForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("service.jsp");
        dispatcher.forward(request, response);
    }
}
