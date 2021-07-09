package model.repository;

import model.bean.ContractDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContractDetailRepositoryImpl implements ContractDetailRepository{
    private static final String INSERT_CONTRACT_DETAIL = "INSERT INTO contract_detail values (?, ?, ?, ?);";
    @Override
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_CONTRACT_DETAIL);
                preparedStatement.setInt(1, contractDetail.getContractDetailId());
                preparedStatement.setInt(2, contractDetail.getContractId());
                preparedStatement.setInt(3, contractDetail.getAttachServiceId());
                preparedStatement.setInt(4, contractDetail.getQuantity());
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }

        }
    }
}
