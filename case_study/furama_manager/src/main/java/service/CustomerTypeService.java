package service;

import model.CustomerType;
import repository.CustomerTypeRepository;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeSevice{
    private CustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }

    @Override
    public boolean add(CustomerType customerType) {
        return false;
    }
}
