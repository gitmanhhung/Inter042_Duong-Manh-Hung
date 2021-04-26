package models;

public class House extends Services{

    private String roomCriterion;
    private String convenientDescription;
    private int numberOfFloors;

    public House(String id, String name, int area, int rentPrice, int numberPeopleMax, String rentType, String roomCriterion, String convenientDescription, int numberOfFloors) {
        super(id, name, area, rentPrice, numberPeopleMax, rentType);
        this.roomCriterion = roomCriterion;
        this.convenientDescription = convenientDescription;
        this.numberOfFloors = numberOfFloors;
    }

    public String getRoomCriterion() {
        return roomCriterion;
    }

    public void setRoomCriterion(String roomCriterion) {
        this.roomCriterion = roomCriterion;
    }

    public String getConvenientDescription() {
        return convenientDescription;
    }

    public void setConvenientDescription(String convenientDescription) {
        this.convenientDescription = convenientDescription;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    @Override
    public String toString() {
        return "House{" + super.toString() +
                "roomCriterion='" + roomCriterion + '\'' +
                ", convenientDescription='" + convenientDescription + '\'' +
                ", numberOfFloors=" + numberOfFloors +
                '}';
    }
}
