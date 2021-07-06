package model.repository;

import model.bean.Customer;
import model.bean.Service;

import java.sql.SQLException;

public interface ServiceRepository {
    public void insertService(Service service) throws SQLException;
}
