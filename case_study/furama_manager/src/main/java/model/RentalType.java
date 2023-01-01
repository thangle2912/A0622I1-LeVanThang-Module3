package model;

public class RentalType {
    private int id;
    private String name;

    public RentalType() {
    }

    public RentalType(int id) {
        this.id = id;
    }

    public RentalType(int id, String name) {
        this.id = id;
        this.name = name;
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
}
