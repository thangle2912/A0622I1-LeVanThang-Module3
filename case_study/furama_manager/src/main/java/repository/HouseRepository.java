package repository;


import model.House;
import model.RentalType;
import model.Villa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HouseRepository implements IHouseRepository{

    private final String SELECT_HOUSE = "select f.*,ft.ft_name as facility_type_name,rt.rt_name as rental_type_name from facility f join facility_type ft on f.ft_id = ft.ft_id join rental_type rt on f.rt_id = rt.rt_id where ft.ft_name='House';\n";
    private final String INSERT_INTO = "insert into facility(f_name,f_area,f_cost,f_max_people,f_standard_room,f_description_other_convenience,f_floors,rt_id,ft_id) values(?,?,?,?,?,?,?,?,?)";
    private final String UPDATE_BY_ID = "update facility set f_name = ?,f_area=?,f_cost=?,f_max_people=?,f_standard_room=?,f_description_other_convenience=?,f_floors=?,rt_id=? where f_id =? ";
    @Override
    public List<House> findAll() {
        List<House> houseList = new ArrayList<>();

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HOUSE);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("f_id");
                String name =resultSet.getString("f_name");
                float area = resultSet.getFloat("f_area");
                double cost = resultSet.getDouble("f_cost");
                int maxPeople =resultSet.getInt("f_max_people");
                int rentalTypeId = resultSet.getInt("rt_id");
                String rentalTypeName = resultSet.getString("rental_type_name");
                RentalType rentalType = new RentalType(rentalTypeId,rentalTypeName);
                String standardRoom = resultSet.getString("f_standard_room");
                String descriptionOtherConvenience = resultSet.getString("f_description_other_convenience");
                int numberFloor = resultSet.getInt("f_floors");
                House house = new House(id,name,area,cost,maxPeople,rentalType,standardRoom,descriptionOtherConvenience,numberFloor);
                houseList.add(house);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return houseList;
    }

    @Override
    public boolean add(House house) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,house.getName());
            preparedStatement.setInt(2, (int) house.getArea());
            preparedStatement.setDouble(3, house.getCost());
            preparedStatement.setInt(4, house.getMaxPeople());
            preparedStatement.setString(5, house.getStandardRoom());
            preparedStatement.setString(6, house.getDescriptionOtherConvenience());
            preparedStatement.setInt(7,house.getNumberFloor());
            preparedStatement.setInt(8,house.getRentalType().getId());
            preparedStatement.setInt(9,2);
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String standardRoom, String descriptionOtherConvenience, int numberFloor) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1,name);
            preparedStatement.setInt(2, (int) area);
            preparedStatement.setDouble(3, cost);
            preparedStatement.setInt(4, maxPeople);
            preparedStatement.setString(5,standardRoom);
            preparedStatement.setString(6, descriptionOtherConvenience);
            preparedStatement.setInt(7,numberFloor);
            preparedStatement.setInt(8,rentalType.getId());
            preparedStatement.setInt(9,id);
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
