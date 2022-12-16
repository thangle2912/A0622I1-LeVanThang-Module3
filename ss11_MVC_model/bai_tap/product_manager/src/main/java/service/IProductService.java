package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    boolean add(Product product);
    boolean delete(int id);
    boolean update(int id, String name, float price, int amount, String category);
    List<Product> findByName(String name);
}
