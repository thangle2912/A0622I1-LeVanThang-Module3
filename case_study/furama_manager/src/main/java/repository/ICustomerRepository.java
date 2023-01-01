package repository;

import model.Customer;
import model.CustomerType;

import java.util.Date;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    boolean add(Customer customer);
    boolean delete(int id);
    boolean update(int id, String name, String birthday, String phoneNumber, String email, String idCard, String address, boolean gender, CustomerType customerType);
    List<Customer> search(String name,String address,String phoneNumber);
}
