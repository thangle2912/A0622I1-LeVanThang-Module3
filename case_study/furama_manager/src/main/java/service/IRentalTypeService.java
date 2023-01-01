package service;

import model.RentalType;

import java.util.List;

public interface IRentalTypeService {
    List<RentalType> findAll();
    boolean add(RentalType rentalType);
}
