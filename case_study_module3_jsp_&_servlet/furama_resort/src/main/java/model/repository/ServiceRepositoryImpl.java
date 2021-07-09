package model.repository;

import model.bean.AttachService;
import model.bean.Customer;
import model.bean.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository {
    private static final String INSERT_SERVICE = "INSERT INTO service values (?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_SERVICE_USED = "select * from contract" +
            " inner join service on service.service_id = contract.service_id" +
            " inner join contract_detail on contract.contract_id = contract_detail.contract_id" +
            " inner join attach_service on attach_service.attach_service_id = contract_detail.attach_service_id" +
            " inner join customer on contract.customer_id = customer.customer_id;";
    @Override
    public void insertService(Service service) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_SERVICE);
                preparedStatement.setString(1, service.getServiceId());
                preparedStatement.setString(2, service.getServiceName());
                preparedStatement.setInt(3, service.getServiceArea());
                preparedStatement.setDouble(4, service.getServiceCost());
                preparedStatement.setInt(5, service.getServiceMaxPeople());
                preparedStatement.setInt(6, service.getRentTypeId());
                preparedStatement.setInt(7, service.getServiceTypeId());
                preparedStatement.setString(8, service.getStandardRoom());
                preparedStatement.setString(9, service.getDescriptionOtherConvenience());
                preparedStatement.setDouble(10, service.getPoolArea());
                preparedStatement.setInt(11, service.getNumberOfFloor());
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }

        }
    }

    public List<Service> selectServiceUsed() throws SQLException {
        List<Service> services = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_SERVICE_USED);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    String serviceId = rs.getString("service_id");
                    String serviceName = rs.getString("service_name");
                    int serviceArea = rs.getInt("service_area");
                    double serviceCost = rs.getDouble("service_cost");
                    int serviceMaxPeople = rs.getInt("service_max_people");
                    int rentTypeId = rs.getInt("rent_type_id");
                    int serviceTypeId = rs.getInt("service_type_id");
                    String standardRoom = rs.getString("standard_room");
                    String deOtConvenience = rs.getString("description_other_convenience");
                    double poolArea = rs.getDouble("pool_area");
                    int numberOfFloor = rs.getInt("number_of_floors");

                    services.add(new Service(serviceId,serviceName,serviceArea,serviceCost,serviceMaxPeople,rentTypeId,
                            serviceTypeId,standardRoom,deOtConvenience,poolArea,numberOfFloor));
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }
        }
        return services;
    }

    public List<Customer> selectCustomerUsed() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_SERVICE_USED);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    String customerId = rs.getString("customer_id");
                    int customerTypeId = rs.getInt("customer_type_id");
                    String customerName = rs.getString("customer_name");
                    String customerBirthday = rs.getString("customer_birthday");
                    int customerGender = rs.getInt("customer_gender");
                    String customerIdCard = rs.getString("customer_id_card");
                    String customerPhone = rs.getString("customer_phone");
                    String customerEmail = rs.getString("customer_email");
                    String customerAddress = rs.getString("customer_address");
                    customers.add(new Customer(customerId, customerTypeId, customerName, customerBirthday, customerGender, customerIdCard, customerPhone, customerEmail, customerAddress));
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }
        }
        return customers;
    }

    public List<AttachService> selectAttachServiceUsed() throws SQLException {
        List<AttachService> attachServices = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_SERVICE_USED);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int asId = rs.getInt("attach_service_id");
                    String asName = rs.getString("attach_service_name");
                    double asCost = rs.getDouble("attach_service_cost");
                    int unit = rs.getInt("attach_service_unit");
                    String asStatus = rs.getString("attach_service_status");

                    attachServices.add(new AttachService(asId,asName,asCost,unit,asStatus));
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }
        }
        return attachServices;
    }


}
