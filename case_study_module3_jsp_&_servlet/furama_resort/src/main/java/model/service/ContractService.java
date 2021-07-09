package model.service;

import model.bean.Contract;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface ContractService {
    public void insertContract(Contract contract) throws SQLException;

}
