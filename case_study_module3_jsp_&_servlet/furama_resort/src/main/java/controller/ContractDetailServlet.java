package controller;

import model.bean.Contract;
import model.bean.ContractDetail;
import model.service.ContractDetailServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ContractDetailServlet", value = "/contractDetail")
public class ContractDetailServlet extends HttpServlet {
    private ContractDetailServiceImpl contractDetailService = new ContractDetailServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                try {
                    insertContractDetail(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                break;
        }
    }

    private void insertContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int contractDetailId = Integer.parseInt(request.getParameter("contractDetailId"));
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        int attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));


        ContractDetail contractDetail = new ContractDetail(contractDetailId,contractId,attachServiceId,quantity);
        contractDetailService.insertContractDetail(contractDetail);

        RequestDispatcher dispatcher = request.getRequestDispatcher("create-contract-detail.jsp");
        dispatcher.forward(request, response);
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
            default:
                break;
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("create-contract-detail.jsp");
        dispatcher.forward(request, response);
    }
}
