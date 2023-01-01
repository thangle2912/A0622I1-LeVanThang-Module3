package service;

import model.RentalType;
import repository.RentalTypeRepository;

import java.util.List;

public class RentalService implements IRentalTypeService{
    private RentalTypeRepository rentalTypeRepository = new RentalTypeRepository();
    @Override
    public List<RentalType> findAll() {
        return rentalTypeRepository.findAll();
    }

    @Override
    public boolean add(RentalType rentalType) {
        return false;
    }
}
