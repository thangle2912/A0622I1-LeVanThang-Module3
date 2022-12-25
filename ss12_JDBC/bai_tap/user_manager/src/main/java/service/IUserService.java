package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    boolean add(User user);
    boolean delete(int id);
    boolean update(int id, String name, String email, String country);
    List<User> searchByCountry(String country);
}
