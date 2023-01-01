package model;

public class Villa extends Facility {
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double areaPool;
    private int numberFloor;

    public Villa() {
    }

    public Villa(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String standardRoom, String descriptionOtherConvenience, double areaPool, int numberFloor) {
        super(id, name, area, cost, maxPeople, rentalType);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.areaPool = areaPool;
        this.numberFloor = numberFloor;
    }

    public Villa(String name, float area, double cost, int maxPeople, RentalType rentalType, String standardRoom, String descriptionOtherConvenience, double areaPool, int numberFloor) {
        super(name, area, cost, maxPeople, rentalType);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.areaPool = areaPool;
        this.numberFloor = numberFloor;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getAreaPool() {
        return areaPool;
    }

    public void setAreaPool(double areaPool) {
        this.areaPool = areaPool;
    }

    public int getNumberFloor() {
        return numberFloor;
    }

    public void setNumberFloor(int numberFloor) {
        this.numberFloor = numberFloor;
    }
}
