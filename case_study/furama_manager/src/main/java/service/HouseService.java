package service;

import model.House;
import model.RentalType;
import repository.HouseRepository;

import java.util.List;

public class HouseService implements IHouseService{
    private HouseRepository houseRepository = new HouseRepository();
    @Override
    public List<House> findAll() {
        return houseRepository.findAll();
    }

    @Override
    public boolean add(House house) {
        return houseRepository.add(house);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String standardRoom, String descriptionOtherConvenience, int numberFloor) {
        return houseRepository.update(id,name,area,cost,maxPeople,rentalType,standardRoom,descriptionOtherConvenience,numberFloor);
    }
}
