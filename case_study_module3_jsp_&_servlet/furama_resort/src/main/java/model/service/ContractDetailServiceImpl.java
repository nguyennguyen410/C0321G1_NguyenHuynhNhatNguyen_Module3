package model.service;

import model.bean.ContractDetail;
import model.repository.ContractDetailRepositoryImpl;

import java.sql.SQLException;

public class ContractDetailServiceImpl implements ContractDetailService{
    private ContractDetailRepositoryImpl contractDetailRepository = new ContractDetailRepositoryImpl();
    @Override
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException {
        contractDetailRepository.insertContractDetail(contractDetail);
    }
}
