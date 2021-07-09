package model.service;

import model.bean.Contract;
import model.bean.ContractDetail;

import java.sql.SQLException;

public interface ContractDetailService {
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException;
}
