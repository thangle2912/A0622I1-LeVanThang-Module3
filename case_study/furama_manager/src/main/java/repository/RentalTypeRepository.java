package repository;

import model.RentalType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentalTypeRepository implements IRentalTypeRepository {
    private final String SELECT_ALL = "select * from rental_type";

    @Override
    public List<RentalType> findAll() {
        List<RentalType> rentalTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("rt_id");
                String name = resultSet.getString("rt_name");
                RentalType rentalType = new RentalType(id, name);

                rentalTypeList.add(rentalType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentalTypeList;
    }

    @Override
    public boolean add(RentalType rentalType) {
        return false;
    }
}
