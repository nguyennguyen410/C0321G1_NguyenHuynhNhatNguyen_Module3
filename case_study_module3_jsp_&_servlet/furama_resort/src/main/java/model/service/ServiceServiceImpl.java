package model.service;

import model.bean.Service;
import model.repository.ServiceRepositoryImpl;

import java.sql.SQLException;

public class ServiceServiceImpl implements ServiceService{
    private ServiceRepositoryImpl serviceRepository = new ServiceRepositoryImpl();
    @Override
    public void insertService(Service service) throws SQLException {
        serviceRepository.insertService(service);
    }
}
