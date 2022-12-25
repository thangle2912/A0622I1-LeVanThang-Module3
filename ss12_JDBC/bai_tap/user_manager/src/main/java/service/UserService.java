package service;

import model.User;
import repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private UserRepository userRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public boolean delete(int id) {
        return userRepository.delete(id);
    }

    @Override
    public boolean update(int id, String name, String email, String country) {
        return userRepository.update(id,name,email,country);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userRepository.searchByCountry(country);
    }
}
