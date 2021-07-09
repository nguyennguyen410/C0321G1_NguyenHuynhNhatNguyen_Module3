package model.repository;

import model.bean.ContractDetail;

import java.sql.SQLException;

public interface ContractDetailRepository {
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException;
}
