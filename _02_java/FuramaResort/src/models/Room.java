package models;

public class Room extends Services{
    private String serviceFreeAttach;

    public Room(String id, String name, int area, int rentPrice, int numberPeopleMax, String rentType, String serviceFreeAttach) {
        super(id, name, area, rentPrice, numberPeopleMax, rentType);
        this.serviceFreeAttach = serviceFreeAttach;
    }

    public String getServiceFreeAttach() {
        return serviceFreeAttach;
    }

    public void setServiceFreeAttach(String serviceFreeAttach) {
        this.serviceFreeAttach = serviceFreeAttach;
    }

    @Override
    public String toString() {
        return "Room{" + super.toString() +
                "serviceFreeAttach='" + serviceFreeAttach + '\'' +
                '}';
    }
}
