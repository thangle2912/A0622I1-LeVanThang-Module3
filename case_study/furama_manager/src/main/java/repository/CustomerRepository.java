package repository;

import model.Customer;
import model.CustomerType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private final String SELECT_ALL = "select c.*,ct.ct_name as customer_type_name  from customer c join customer_type ct on c.ct_id = ct.ct_id ";
    private final String INSERT_INTO = "insert into customer(ct_id,c_name,c_birthday, c_gender,c_id_card,c_phone_number,c_email,c_address) values(?,?,?,?,?,?,?,?)";
    private final String DELETE_BY_ID = "DELETE FROM customer WHERE c_id = ?";
    private final String UPDATE_BY_ID ="UPDATE customer SET ct_id =?, c_name = ?, c_birthday =?,c_gender = ?,c_id_card=?,c_phone_number =?, c_email=?,c_address = ? WHERE c_id = ?";
    private final String SEARCH ="select c.*,ct.ct_name as customer_type_name  from customer c join customer_type ct on c.ct_id = ct.ct_id where c_name like ? and c_address  like ? and c_phone_number like ?";
    @Override
    public List<Customer> findAll() {
       List<Customer> customerList =new ArrayList<>();
       //connectDB
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id =resultSet.getInt("c_id");
                String name = resultSet.getString("c_name");
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date birthday = null;
                try {
                    birthday = format.parse(resultSet.getString("c_birthday"));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String phoneNumber = resultSet.getString("c_phone_number");
                String email = resultSet.getString("c_email");
                String idCard = resultSet.getString("c_id_card");
                String address = resultSet.getString("c_address");
                String customerTypeName = resultSet.getString("customer_type_name");
                int customerTypeId = resultSet.getInt("ct_id");
                boolean gender = resultSet.getBoolean("c_gender");
                CustomerType customerType = new CustomerType(customerTypeId,customerTypeName);
                Customer customer = new Customer(id,name,birthday,phoneNumber,email,idCard,address,gender,customerType);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setInt(1,customer.getCustomerType().getId());
            preparedStatement.setString(2,customer.getName());

            String birthdayString = customer.getBirthdayAdd();

            preparedStatement.setDate(3, java.sql.Date.valueOf(birthdayString));
            preparedStatement.setBoolean(4,customer.isGender());
            preparedStatement.setString(5,customer.getId_card());
            preparedStatement.setString(6,customer.getPhoneNumber());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());
            return preparedStatement.executeUpdate()>0;
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
    public boolean update(int id, String name, String birthday, String phoneNumber, String email, String idCard, String address, boolean gender, CustomerType customerType) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setInt(1,customerType.getId());
            preparedStatement.setString(2,name);
            String birthdayString = birthday;
            preparedStatement.setDate(3, java.sql.Date.valueOf(birthdayString));
            preparedStatement.setBoolean(4,gender);
            preparedStatement.setString(5,idCard);
            preparedStatement.setString(6,phoneNumber);
            preparedStatement.setString(7,email);
            preparedStatement.setString(8,address);
            preparedStatement.setInt(9,id);

            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> search(String nameSearch, String addressSearch, String phoneNumberSearch) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+nameSearch+"%");
            preparedStatement.setString(2,"%"+addressSearch+"%");
            preparedStatement.setString(3,"%"+phoneNumberSearch+"%");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id =resultSet.getInt("c_id");
                String name = resultSet.getString("c_name");
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date birthday = null;
                try {
                    birthday = format.parse(resultSet.getString("c_birthday"));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String phoneNumber = resultSet.getString("c_phone_number");
                String email = resultSet.getString("c_email");
                String idCard = resultSet.getString("c_id_card");
                String address = resultSet.getString("c_address");
                String customerTypeName = resultSet.getString("customer_type_name");
                int customerTypeId = resultSet.getInt("ct_id");
                boolean gender = resultSet.getBoolean("c_gender");
                CustomerType customerType = new CustomerType(customerTypeId,customerTypeName);
                Customer customer = new Customer(id,name,birthday,phoneNumber,email,idCard,address,gender,customerType);
                customerList.add(customer);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
