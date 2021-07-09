package model.repository;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeRepository {
    public void insertEmployee(Employee employee) throws SQLException;

    public Employee selectEmployee(String employeeId) throws SQLException;

    public List<Employee> selectAllEmployee() throws SQLException;

    public boolean deleteEmployee(String employeeId) throws SQLException;

    public boolean updateEmployee(Employee employee) throws SQLException;
}
