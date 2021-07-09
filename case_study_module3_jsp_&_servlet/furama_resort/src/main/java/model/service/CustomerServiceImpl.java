package model.service;

import Validate.Validate;
import model.bean.Customer;
import model.repository.CustomerRepositoryImpl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public Map<String, String> insert(Customer newCustomer) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateCustomerId(newCustomer.getCustomerId()) != null
                || Validate.validateCustomerPhone(newCustomer.getCustomerPhone()) != null
        || Validate.validateCustomerEmail(newCustomer.getCustomerEmail())!=null
        || Validate.validateCustomerDate(newCustomer.getCustomerBirthday())!= null
        || Validate.validateCustomerIdCard(newCustomer.getCustomerIdCard())!=null) {
            mapMessage.put("messCustomer", Validate.validateCustomerId(newCustomer.getCustomerId()));
            mapMessage.put("messCustomerPhone", Validate.validateCustomerPhone(newCustomer.getCustomerPhone()));
            mapMessage.put("messCustomerEmail", Validate.validateCustomerEmail(newCustomer.getCustomerEmail()));
            mapMessage.put("messCustomerDate", Validate.validateCustomerDate(newCustomer.getCustomerBirthday()));
            mapMessage.put("messCustomerIdCard", Validate.validateCustomerIdCard(newCustomer.getCustomerIdCard()));
        } else {
            customerRepository.insertCustomer(newCustomer);
        }
        return mapMessage;
    }
}
