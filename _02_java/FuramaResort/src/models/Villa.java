package models;

public class Villa extends Services{
    private String roomCriterion;
    private String convenientDescription;
    private int areaPool;
    private int numberOfFloors;

    public Villa(String id, String name, int area, int rentPrice, int numberPeopleMax, String rentType, String roomCriterion, String convenientDescription, int areaPool, int numberOfFloors) {
        super(id, name, area, rentPrice, numberPeopleMax, rentType);
        this.roomCriterion = roomCriterion;
        this.convenientDescription = convenientDescription;
        this.areaPool = areaPool;
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

    public int getAreaPool() {
        return areaPool;
    }

    public void setAreaPool(int areaPool) {
        this.areaPool = areaPool;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    @Override
    public String toString() {
        return "Villa{" + super.toString() +
                "roomCriterion='" + roomCriterion + '\'' +
                ", convenientDescription='" + convenientDescription + '\'' +
                ", areaPool=" + areaPool +
                ", numberOfFloors=" + numberOfFloors +
                '}';
    }
}
