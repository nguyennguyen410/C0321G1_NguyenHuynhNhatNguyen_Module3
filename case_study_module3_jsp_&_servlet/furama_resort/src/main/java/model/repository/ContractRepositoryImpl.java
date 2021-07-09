package model.repository;

import model.bean.Contract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContractRepositoryImpl implements ContractRepository{
    private static final String INSERT_CONTRACT = "INSERT INTO contract values (?, ?, ?, ?, ?, ?, ?, ?);";
    @Override
    public void insertContract(Contract contract) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_CONTRACT);
                preparedStatement.setInt(1, contract.getContractId());
                preparedStatement.setString(2, contract.getContractStartDate());
                preparedStatement.setString(3, contract.getContractEndDate());
                preparedStatement.setDouble(4, contract.getContractDeposit());
                preparedStatement.setDouble(5, contract.getContractTotalMoney());
                preparedStatement.setInt(6, contract.getEmployeeId());
                preparedStatement.setString(7, contract.getCustomerId());
                preparedStatement.setString(8, contract.getServiceId());

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
