package service;


import model.RentalType;
import model.Room;
import repository.RoomRepository;

import java.util.List;

public class RoomService implements IRoomService{
    private RoomRepository roomRepository = new RoomRepository();
    @Override
    public List<Room> findAll() {
        return roomRepository.findAll();
    }

    @Override
    public boolean add(Room room) {
        return roomRepository.add(room);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String facilityFree) {
        return roomRepository.update(id,name,area,cost,maxPeople,rentalType,facilityFree);
    }
}
