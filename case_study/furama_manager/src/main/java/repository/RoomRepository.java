package repository;

import model.House;
import model.RentalType;
import model.Room;
import model.Villa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomRepository implements IRoomRepository{
    private final String SELECT_ROOM = "select f.*,ft.ft_name as facility_type_name,rt.rt_name as rental_type_name from facility f join facility_type ft on f.ft_id = ft.ft_id join rental_type rt on f.rt_id = rt.rt_id where ft.ft_name='Room'";
    private final String INSERT_INTO = "insert into facility(f_name,f_area,f_cost,f_max_people,f_facility_free,rt_id,ft_id) values(?,?,?,?,?,?,?)";
    private final String UPDATE_BY_ID="update facility set f_name = ?,f_area=?,f_cost=?,f_max_people=?,f_facility_free=?,rt_id=? where f_id =? ";

    @Override
    public List<Room> findAll() {
        List<Room> roomList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROOM);
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
                String facilityFree = resultSet.getString("f_facility_free");
                Room room = new Room(id,name,area,cost,maxPeople,rentalType,facilityFree);
                roomList.add(room);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return roomList;
    }

    @Override
    public boolean add(Room room) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,room.getName());
            preparedStatement.setInt(2, (int) room.getArea());
            preparedStatement.setDouble(3, room.getCost());
            preparedStatement.setInt(4, room.getMaxPeople());
            preparedStatement.setString(5, room.getFacilityFree());
            preparedStatement.setInt(6,room.getRentalType().getId());
            preparedStatement.setInt(7,3);
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
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String facilityFree) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1,name);
            preparedStatement.setInt(2, (int) area);
            preparedStatement.setDouble(3, cost);
            preparedStatement.setInt(4, maxPeople);
            preparedStatement.setString(5,facilityFree);;
            preparedStatement.setInt(6,rentalType.getId());
            preparedStatement.setInt(7,id);
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
