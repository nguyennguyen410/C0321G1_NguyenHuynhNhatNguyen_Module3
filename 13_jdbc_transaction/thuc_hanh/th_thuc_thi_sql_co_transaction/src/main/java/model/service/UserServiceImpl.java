package model.service;

import model.bean.User;
import model.repository.UserRepositoryImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService{
    private UserRepositoryImpl userRepository = new UserRepositoryImpl();
    public List<User> sortByName() {
        return userRepository.sortByName();
    }
    public List<User> searchByCountry(String country){
        return userRepository.searchByCountry(country);
    }

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }


    @Override
    public User selectUser(int id) throws SQLException {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    public void addUserTransaction(){
        User user = new User("quan", "quan.nguyen@codegym.vn", "vn");

        int[] permision = {1, 2, 4};

        userRepository.addUserTransaction(user, permision);
    }

    public void testUseTran() {
        userRepository.insertUpdateUseTransaction();
    }

    public void testWithouttran() {
        userRepository.insertUpdateWithoutTransaction();
    }
}
