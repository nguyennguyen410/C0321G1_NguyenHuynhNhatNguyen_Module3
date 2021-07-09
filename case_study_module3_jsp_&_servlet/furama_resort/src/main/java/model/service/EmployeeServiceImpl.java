package model.service;

import model.bean.Employee;
import model.repository.EmployeeRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService{
    private EmployeeRepositoryImpl employeeRepository = new EmployeeRepositoryImpl();
    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        employeeRepository.insertEmployee(employee);
    }

    @Override
    public Employee selectEmployee(String employeeId) throws SQLException {
        return null;
    }

    @Override
    public List<Employee> selectAllEmployee() throws SQLException {
        return employeeRepository.selectAllEmployee();
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
        return employeeRepository.searchByName(employeeSearch);
    }
}
