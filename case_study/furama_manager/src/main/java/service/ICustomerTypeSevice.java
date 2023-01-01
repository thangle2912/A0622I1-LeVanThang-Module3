package service;

import model.CustomerType;

import java.util.List;

public interface ICustomerTypeSevice {
    List<CustomerType> findAll();
    boolean add(CustomerType customerType);
}
