package model.service;

import model.bean.Customer;
import model.bean.Service;

import java.sql.SQLException;

public interface ServiceService {
    public void insertService(Service service) throws SQLException;
}
