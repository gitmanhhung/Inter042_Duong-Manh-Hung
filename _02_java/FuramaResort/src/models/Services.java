package models;

public abstract class Services {
    private String id;
    private String name;
    private int area;
    private int rentPrice;
    private int numberPeopleMax;
    private String rentType;

    public Services(String id, String name, int area, int rentPrice, int numberPeopleMax, String rentType) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.rentPrice = rentPrice;
        this.numberPeopleMax = numberPeopleMax;
        this.rentType = rentType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(int rentPrice) {
        this.rentPrice = rentPrice;
    }

    public int getNumberPeopleMax() {
        return numberPeopleMax;
    }

    public void setNumberPeopleMax(int numberPeopleMax) {
        this.numberPeopleMax = numberPeopleMax;
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    @Override
    public String toString() {
        return "Services{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", area=" + area +
                ", rentPrice=" + rentPrice +
                ", numberPeopleMax=" + numberPeopleMax +
                ", rentType='" + rentType + '\'' +
                '}';
    }



}
