package service;


import model.RentalType;
import model.Room;

import java.util.List;

public interface IRoomService {
    List<Room> findAll();
    boolean add(Room room);
    boolean delete(int id);
    boolean update(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String facilityFree);

}
