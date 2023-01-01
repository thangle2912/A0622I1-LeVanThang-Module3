package service;

import model.Customer;
import model.CustomerType;
import repository.CustomerRepository;

import java.util.Date;
import java.util.List;

public class CustomerService implements ICustomerService{
    private CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public boolean add(Customer customer) {
        return customerRepository.add(customer);
    }

    @Override
    public boolean delete(int id) {
        return customerRepository.delete(id);
    }

    @Override
    public boolean update(int id, String name, String birthday, String phoneNumber, String email, String idCard, String address, boolean gender, CustomerType customerType) {
        return customerRepository.update(id,name,birthday,phoneNumber,email,idCard,address,gender,customerType);
    }

    @Override
    public List<Customer> search(String name, String address, String phoneNumber) {
        return customerRepository.search(name,address,phoneNumber);
    }
}
