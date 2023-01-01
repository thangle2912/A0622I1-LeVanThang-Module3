package model;

import java.util.Date;

public class Employee extends Person{
    private int educationDegreeId;
    private int position;
    private double salary;

    public Employee() {
    }

    public Employee(int id, String name, Date birthday, String phoneNumber, String email, String id_card, String address, int educationDegreeId, int position, double salary) {
        super(id, name, birthday, phoneNumber, email, id_card, address);
        this.educationDegreeId = educationDegreeId;
        this.position = position;
        this.salary = salary;
    }

    public int getEducationDegreeId() {
        return educationDegreeId;
    }

    public void setEducationDegreeId(int educationDegreeId) {
        this.educationDegreeId = educationDegreeId;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
}
