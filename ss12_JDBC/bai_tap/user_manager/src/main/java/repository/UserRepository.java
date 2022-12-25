package repository;

import model.User;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository{

    private final String SELECT_ALL = "select * from users order by name asc";
    private final String INSERT_USER = "call insert_user(?,?,?)";

    private final String UPDATE_BY_ID = "UPDATE users SET name = ?, email = ?,country =? WHERE id = ?";
    private final String DELETE_BY_ID = "DELETE FROM users WHERE id =?";
    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        //connect DB

        Connection connection = BaseRepository.getConnectDB();

        //tạo câu truy vấn

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");

                User user = new User(id, name, email,country);
                userList.add(user);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userList;
    }

    @Override
    public boolean add(User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
//            CallableStatement
            CallableStatement callableStatement =connection.prepareCall(INSERT_USER);
            callableStatement.setString(1,user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3,user.getCountry());
//            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
//            preparedStatement.setString(1,user.getName());
//            preparedStatement.setString(2,user.getEmail());
//            preparedStatement.setString(3,user.getCountry());

            return callableStatement.executeUpdate()>0;
            // nếu insert được thì có tác động tới 1 dòng, khi đó preparedStatement.executeUpdate() trả về 1
            //và return trả về true
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1,id);

            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(int id, String name, String email, String country) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,email);
            preparedStatement.setString(3,country);
            preparedStatement.setInt(4,id);

            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> searchByCountry(String nameCountry) {
        List<User> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                if(nameCountry=="") {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    User user = new User(id, name, email, country);
                    list.add(user);
                }else{
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    User user = new User(id, name, email, country);
                    if(country.toLowerCase().contains(nameCountry)){
                        list.add(user);
                    }
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }
}
