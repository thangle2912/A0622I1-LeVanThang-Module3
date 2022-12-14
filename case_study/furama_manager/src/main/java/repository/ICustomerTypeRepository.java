package repository;

import model.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> findAll();
    boolean add(CustomerType customerType);
}
