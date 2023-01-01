package model;

public class Room extends Facility{
    private String facilityFree;

    public Room() {
    }

    public Room(int id, String name, float area, double cost, int maxPeople, RentalType rentalType, String facilityFree) {
        super(id, name, area, cost, maxPeople, rentalType);
        this.facilityFree = facilityFree;
    }

    public Room(String name, float area, double cost, int maxPeople, RentalType rentalType, String facilityFree) {
        super(name, area, cost, maxPeople, rentalType);
        this.facilityFree = facilityFree;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }
}
