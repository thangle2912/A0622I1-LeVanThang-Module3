package model;

public class House extends Facility{
    private String standardRoom;
    private String descriptionOtherConvenience;
    private int numberFloor;

    public House() {
    }

    public House(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String standardRoom, String descriptionOtherConvenience, int numberFloor) {
        super(id, name, area, cost, maxPeople, rentalType);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.numberFloor = numberFloor;
    }

    public House(String name, float area, double cost, int maxPeople, RentalType rentalType, String standardRoom, String descriptionOtherConvenience, int numberFloor) {
        super(name, area, cost, maxPeople, rentalType);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
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

    public int getNumberFloor() {
        return numberFloor;
    }

    public void setNumberFloor(int numberFloor) {
        this.numberFloor = numberFloor;
    }
}
