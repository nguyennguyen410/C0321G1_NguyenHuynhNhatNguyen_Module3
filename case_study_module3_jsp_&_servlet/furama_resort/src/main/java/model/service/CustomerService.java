package model.service;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    public void insertCustomer(Customer customer) throws SQLException;

    public Customer selectCustomer(String customerId) throws SQLException;

    public List<Customer> selectAllCustomer() throws SQLException;

    public boolean deleteCustomer(String customerId) throws SQLException;

    public boolean updateCustomer(Customer customer) throws SQLException;
}
