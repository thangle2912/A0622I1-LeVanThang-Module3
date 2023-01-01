package service;

import model.RentalType;
import model.Villa;
import repository.VillaRepository;

import java.util.List;

public class VillaService implements IVillaService{
    private VillaRepository villaRepository = new VillaRepository();
    @Override
    public List<Villa> findAll() {
        return villaRepository.findAll();
    }

    @Override
    public boolean add(Villa villa) {
        return villaRepository.add(villa);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String standardRoom, String descriptionOtherConvenience, double areaPool, int numberFloor) {
        return villaRepository.update(id,name,area,cost,maxPeople,rentalType,standardRoom,descriptionOtherConvenience,areaPool,numberFloor);
    }
}
