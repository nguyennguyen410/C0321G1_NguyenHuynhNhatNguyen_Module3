package model.service;

import model.bean.Contract;
import model.repository.ContractRepositoryImpl;

import java.sql.SQLException;

public class ContractServiceImpl implements ContractService {
    private ContractRepositoryImpl contractRepository = new ContractRepositoryImpl();
    @Override
    public void insertContract(Contract contract) throws SQLException {
        contractRepository.insertContract(contract);
    }
}
