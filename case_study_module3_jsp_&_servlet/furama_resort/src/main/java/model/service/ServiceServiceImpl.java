package model.service;

import model.bean.AttachService;
import model.bean.Customer;
import model.bean.Service;
import model.repository.ServiceRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ServiceServiceImpl implements ServiceService{
    private ServiceRepositoryImpl serviceRepository = new ServiceRepositoryImpl();
    @Override
    public void insertService(Service service) throws SQLException {
        serviceRepository.insertService(service);
    }

    public List<Service> selectServiceUsed() throws SQLException {
      return  serviceRepository.selectServiceUsed();
    }

    public List<Customer> selectCustomerUsed() throws SQLException {
        return  serviceRepository.selectCustomerUsed();
    }

    public List<AttachService> selectAttachServiceUsed() throws SQLException {
        return  serviceRepository.selectAttachServiceUsed();
    }
}
