package model.repository;

import model.bean.Contract;

import java.sql.SQLException;

public interface ContractRepository {
    public void insertContract(Contract contract) throws SQLException;
}
