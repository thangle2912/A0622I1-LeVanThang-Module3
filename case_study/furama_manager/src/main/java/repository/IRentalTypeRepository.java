package repository;


import model.RentalType;

import java.util.List;

public interface IRentalTypeRepository {
    List<RentalType> findAll();
    boolean add(RentalType rentalType);
}
