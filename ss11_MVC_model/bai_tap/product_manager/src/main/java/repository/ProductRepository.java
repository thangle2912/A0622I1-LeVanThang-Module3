package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "SamSung A11", 3050000, 12, "SamSung"));
        productList.add(new Product(2, "SamSung A12", 4100000, 10, "SamSung"));
        productList.add(new Product(3, "Nokia ss", 7900000, 18, "Nokia"));
        productList.add(new Product(4, "BPhone aa", 6300000, 12, "BPhone"));
        productList.add(new Product(5, "SamSung A15", 8020000, 22, "SamSung"));
        productList.add(new Product(6, "Iphone 14 ProMax", 2010000, 32, "Iphone"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public boolean add(Product product) {
        return productList.add(product);
    }

    @Override
    public boolean delete(int id)
    {
        for(Product product:productList){
            if (product.getId()==id){
                productList.remove(product);
                return true;
            }
        }
       return false;
    }

    @Override
    public boolean update(int id, String name, float price, int amount, String category) {

        Product product = productList.get(id-1);
        product.setProduct(name,price,amount,category);
        return true;
    }


    @Override
    public List<Product> findByName(String name) {
        List<Product> productListSearch = new ArrayList<>();

        for (Product product:productList){
            String nameSearch = name.toLowerCase();
            String nameProduct = product.getName().toLowerCase();
            if(nameProduct.contains(nameSearch)){
                productListSearch.add(product);
            }
        }

        return productListSearch;
    }
}
