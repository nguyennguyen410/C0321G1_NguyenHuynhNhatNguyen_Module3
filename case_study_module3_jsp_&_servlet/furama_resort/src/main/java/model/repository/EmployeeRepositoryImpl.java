package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    private static final String INSERT_EMPLOYEES = "INSERT INTO employee values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee";
    private static final String SEARCH_EMPLOYEE = "select * from employee where employee_name=?";
    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_EMPLOYEES);
                preparedStatement.setInt(1, employee.getEmployeeId());
                preparedStatement.setString(2, employee.getEmployeeName());
                preparedStatement.setString(3, employee.getEmployeeBirthday());
                preparedStatement.setString(4, employee.getEmployeeIdCard());
                preparedStatement.setDouble(5, employee.getEmployeeSalary());
                preparedStatement.setString(6, employee.getEmployeePhone());
                preparedStatement.setString(7, employee.getEmployeeEmail());
                preparedStatement.setString(8, employee.getEmployeeAddress());
                preparedStatement.setInt(9, employee.getPositionId());
                preparedStatement.setInt(10, employee.getEducationDegreeId());
                preparedStatement.setInt(11, employee.getDivisionId());
                preparedStatement.setString(12, employee.getUsername());

                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }

        }
    }

    @Override
    public Employee selectEmployee(String employeeId) throws SQLException {
        return null;
    }

    @Override
    public List<Employee> selectAllEmployee() throws SQLException {
        List<Employee> employees = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int employeeId = rs.getInt("employee_id");
                    String employeeName = rs.getString("employee_name");
                    String employeeBirthday = rs.getString("employee_birthday");
                    String employeeIdCard = rs.getString("employee_id_card");
                    double employeeSalary = rs.getDouble("employee_salary");
                    String employeePhone = rs.getString("employee_phone");
                    String employeeEmail = rs.getString("employee_email");
                    String employeeAddress = rs.getString("employee_address");
                    int positionId = rs.getInt("position_id");
                    int educationDegreeId = rs.getInt("education_degree_id");
                    int divisionId = rs.getInt("division_id");
                    String username = rs.getString("username");
                    employees.add(new Employee(employeeId,employeeName,employeeBirthday,employeeIdCard,employeeSalary,
                            employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,username));
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }
        }
        return employees;
    }

    @Override
    public boolean deleteEmployee(String employeeId) throws SQLException {
        return false;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return false;
    }

    public List<Employee> searchByName(String employeeSearch) throws SQLException {
        List<Employee> employees = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE);
                preparedStatement.setString(1, employeeSearch);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int employeeId = rs.getInt("employee_id");
                    String employeeName = rs.getString("employee_name");
                    String employeeBirthday = rs.getString("employee_birthday");
                    String employeeIdCard = rs.getString("employee_id_card");
                    double employeeSalary = rs.getDouble("employee_salary");
                    String employeePhone = rs.getString("employee_phone");
                    String employeeEmail = rs.getString("employee_email");
                    String employeeAddress = rs.getString("employee_address");
                    int positionId = rs.getInt("position_id");
                    int educationDegreeId = rs.getInt("education_degree_id");
                    int divisionId = rs.getInt("division_id");
                    String username = rs.getString("username");
                    employees.add(new Employee(employeeId,employeeName,employeeBirthday,employeeIdCard,employeeSalary,
                            employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,username));
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }
        }
        return employees;
    }
}
