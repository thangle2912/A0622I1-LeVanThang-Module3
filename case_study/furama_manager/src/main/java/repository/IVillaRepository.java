package repository;

import model.RentalType;
import model.Villa;

import java.util.List;

public interface IVillaRepository {
    List<Villa> findAll();
    boolean add(Villa villa);
    boolean delete(int id);
    boolean update(int id, String name, float area, double cost, int maxPeople, RentalType rentalType,String standardRoom,String descriptionOtherConvenience,double areaPool,int numberFloor);
}
