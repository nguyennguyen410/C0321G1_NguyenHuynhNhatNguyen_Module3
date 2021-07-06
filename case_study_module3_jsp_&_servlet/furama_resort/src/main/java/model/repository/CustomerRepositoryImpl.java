package model.repository;

import model.bean.Customer;
import org.omg.PortableServer.SERVANT_RETENTION_POLICY_ID;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    private static final String INSERT_CUSTOMERS = "INSERT INTO customer" + "  (customer_id, customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_CUSTOMERS = "select * from customer";
    private static final String DELETE_CUSTOMERS = "delete from customer where customer_id = ?;";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id =?";
    private static final String UPDATE_CUSTOMER = "update customer set customer_type_id=?, customer_name=?, " +
            "customer_birthday=?, customer_gender=?, customer_id_card=?, customer_phone=?, customer_email=?, customer_address=? where customer_id = ?;";

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareCall(INSERT_CUSTOMERS);
                preparedStatement.setString(1, customer.getCustomerId());
                preparedStatement.setInt(2, customer.getCustomerTypeId());
                preparedStatement.setString(3, customer.getCustomerName());
                preparedStatement.setString(4, customer.getCustomerBirthday());
                preparedStatement.setInt(5, customer.getCustomerGender());
                preparedStatement.setString(6, customer.getCustomerIdCard());
                preparedStatement.setString(7, customer.getCustomerPhone());
                preparedStatement.setString(8, customer.getCustomerEmail());
                preparedStatement.setString(9, customer.getCustomerAddress());

                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }

        }
    }

    @Override
    public Customer selectCustomer(String customerId) throws SQLException {
        Customer customer = null;
        String query = SELECT_CUSTOMER_BY_ID;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, customerId);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String id = resultSet.getString("customer_id");
                    int type = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customer = new Customer(id, type, name, birthday, gender, idCard, phone, email, address);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }

        }
        return customer;
    }

    @Override
    public List<Customer> selectAllCustomer() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
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


    @Override
    public boolean deleteCustomer(String customerId) throws SQLException {
        boolean rowDeleted;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMERS);
        statement.setString(1, customerId);
        rowDeleted = statement.executeUpdate() > 0;
        return rowDeleted;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(UPDATE_CUSTOMER);

        statement.setInt(1, customer.getCustomerTypeId());
        statement.setString(2, customer.getCustomerName());
        statement.setString(3, customer.getCustomerBirthday());
        statement.setInt(4, customer.getCustomerGender());
        statement.setString(5, customer.getCustomerIdCard());
        statement.setString(6, customer.getCustomerPhone());
        statement.setString(7, customer.getCustomerEmail());
        statement.setString(8, customer.getCustomerAddress());
        statement.setString(9, customer.getCustomerId());
        rowUpdated = statement.executeUpdate() > 0;

        statement.close();
        DBConnection.close();

        return rowUpdated;
    }
}
