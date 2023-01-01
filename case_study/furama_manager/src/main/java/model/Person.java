package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class Person {
    private int id;
    private String name;
    private Date birthday;
    private String phoneNumber;
    private String email;
    private String id_card;
    private String address;


    public Person() {
    }

    public Person(int id, String name, Date birthday, String phoneNumber, String email, String id_card, String address) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.id_card = id_card;
        this.address = address;
    }
    public Person( String name, Date birthday, String phoneNumber, String email, String id_card, String address) {
        this.name = name;
        this.birthday = birthday;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.id_card = id_card;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthdayFormat() {
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        String birthdayString = format.format(this.birthday);
        return birthdayString;
    }

    public String getBirthdayAdd(){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String birthdayString = format.format(this.birthday);
        return birthdayString;
    }
    public Date getBirthday() {
        return this.birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId_card() {
        return id_card;
    }

    public void setId_card(String id_card) {
        this.id_card = id_card;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
