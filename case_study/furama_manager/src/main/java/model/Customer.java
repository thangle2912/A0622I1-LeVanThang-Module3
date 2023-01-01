package model;

import java.util.Date;

public class Customer extends Person{

    private boolean gender;
    private CustomerType customerType;

    public CustomerType getCustomerType() {
        return customerType;
    }

    public void setCustomerType(CustomerType customerType) {
        this.customerType = customerType;
    }

    public Customer() {
    }

    public Customer(int id, String name, Date birthday, String phoneNumber, String email, String id_card, String address, boolean gender, CustomerType customerType) {
        super(id, name, birthday, phoneNumber, email, id_card, address);

        this.gender = gender;
        this.customerType = customerType;
    }

    public Customer( String name, Date birthday, String phoneNumber, String email, String id_card, String address, boolean gender, CustomerType customerType) {
        super( name, birthday, phoneNumber, email, id_card, address);

        this.gender = gender;
        this.customerType = customerType;
    }


    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
}
