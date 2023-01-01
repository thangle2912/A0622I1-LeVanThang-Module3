package service;

import model.House;
import model.RentalType;

import java.util.List;

public interface IHouseService {
    List<House> findAll();
    boolean add(House house);
    boolean delete(int id);
    boolean update(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String standardRoom, String descriptionOtherConvenience, int numberFloor);

}
