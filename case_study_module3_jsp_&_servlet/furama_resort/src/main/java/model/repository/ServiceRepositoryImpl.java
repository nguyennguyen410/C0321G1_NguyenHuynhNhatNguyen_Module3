package model.repository;

import model.bean.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ServiceRepositoryImpl implements ServiceRepository {
    private static final String INSERT_SERVICE = "INSERT INTO service values (?,?,?,?,?,?,?,?,?,?,?);";
    @Override
    public void insertService(Service service) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_SERVICE);
                preparedStatement.setString(1, service.getServiceId());
                preparedStatement.setString(2, service.getServiceName());
                preparedStatement.setInt(3, service.getServiceArea());
                preparedStatement.setDouble(4, service.getServiceCost());
                preparedStatement.setInt(5, service.getServiceMaxPeople());
                preparedStatement.setInt(6, service.getRentTypeId());
                preparedStatement.setInt(7, service.getServiceTypeId());
                preparedStatement.setString(8, service.getStandardRoom());
                preparedStatement.setString(9, service.getDescriptionOtherConvenience());
                preparedStatement.setDouble(10, service.getPoolArea());
                preparedStatement.setInt(11, service.getNumberOfFloor());
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
