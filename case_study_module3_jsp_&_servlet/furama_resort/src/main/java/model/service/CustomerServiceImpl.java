package model.service;

import model.bean.Customer;
import model.repository.CustomerRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements CustomerService{
    private CustomerRepositoryImpl customerRepository = new CustomerRepositoryImpl();
    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        customerRepository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomer(String customerId) throws SQLException {
        return customerRepository.selectCustomer(customerId);
    }

    @Override
    public List<Customer> selectAllCustomer() throws SQLException {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public boolean deleteCustomer(String customerId) throws SQLException {
        return customerRepository.deleteCustomer(customerId);
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return customerRepository.updateCustomer(customer);
    }
}
