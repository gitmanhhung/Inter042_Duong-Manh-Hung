package controllers;

import commons.CheckData;
import models.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class MainController {

    // Delimiter used in CSV file
    private static final String COMMA_DELIMITER = ",";
    private static final String NEW_LINE_SEPARATOR = "\n";
    private static final String CHECK_ID_ROOM = "^SV+[RO]+[-]\\d{4}$";
    private static final String CHECK_ID_VILLA = "^SV+[VL]+[-]\\d{4}$";
    private static final String CHECK_ID_HOUSE = "^SV+[HO]+[-]\\d{4}$";
    private static final String CHECK_NAME = "^[A-Z][a-z]{0,}+$";
    private static final String CHECK_AREA = "^[3-9][0-9]{0,}|[.][0-9]{0,2}]$";
    private static final String CHECK_RENT_PRICE = "^[0-9][0-9]{0,}|[.][0-9]{0,2}]$";
    private static final String CHECK_SERVICE_ATTACK = "(MASSAGE)|(KARAOKE)|(DRINK)|(FOOD)|(CAR)";
    private static final String CHECK_RENT_TYPE = "(DAY)|(MONTH)|(YEAR)|(HOUR)";
    private static final String CHECK_ROOM_CRITERION = "^[1-5]$";
    private static final String CHECK_NUMBER_OF_FLOOR = "^[0-9]{1,}$";



    public static void main(String[] args) {
        displayMainMenu();

    }
    private static String GetStr() {
        DataInputStream stream = new DataInputStream (System.in);
        try {
            return stream.readLine();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }

    public static void displayMainMenu(){
        System.out.println("\n1.Add New Services");
        System.out.println("2.Show Services");
        System.out.println("3.Add New Customer");
        System.out.println("4.Show Information of Customer");
        System.out.println("5.Add New Booking");
        System.out.println("6.Show Information of Employee");
        System.out.println("7.Exit");
        switch(Integer.valueOf(GetStr()))
        {
            case 1 :
                addNewServies();
                break;
            case 2 :
                showServies();
                break;
            case 3 :
                addNewCustomer();
                break;
            case 4 :
                break;
            case 5 :
                break;
            case 6 :
                break;
            case 7 :
                break;
        }
    }
    public static void showServies(){
        System.out.println("\n1.Show all Villa");
        System.out.println("2.Show all House");
        System.out.println("3.Show all Room");
        System.out.println("4.Show All Name Villa Not Duplicate");
        System.out.println("5.Show All Name House Not Duplicate");
        System.out.println("6.Show All Name Name Not Duplicate");
        System.out.println("7.Back to menu");
        System.out.println("8.Exit");
        switch(Integer.valueOf(GetStr()))
        {
            case 1 :
                showAllVilla();
                displayMainMenu();
                break;
            case 2 :
                showAllHouse();
                displayMainMenu();
                break;
            case 3 :
                showAllRoom();
                displayMainMenu();
                break;
            case 4 :
                displayMainMenu();
                break;
            case 5 :
                break;
            case 6 :
                break;
            case 7 :
                break;
            case 8 :
                break;
        }
    }
    public static void addNewServies(){

        System.out.println("\n1.Add New Villa");
        System.out.println("2.Add New House");
        System.out.println("3.Add New Room");
        System.out.println("4.Back to menu");
        System.out.println("5.Exit");
        switch(Integer.valueOf(GetStr()))
        {
            case 1 :
                addNewVilla();
                addNewServies();
                break;
            case 2 :
                addNewHouse();
                addNewServies();
                break;
            case 3 :
                addNewRoom();
                addNewServies();
                break;
            case 4 :
                displayMainMenu();
                break;
            case 5 :
                break;
        }
    }

    public static void addNewVilla(){
        CheckData checkData = new CheckData();

        String fileName = "C:\\Users\\Admin\\Desktop\\Inter042_Nguyen-Van-Tam\\FuramaResort\\src\\data\\Villa.csv";

        System.out.println("Nhập theo mẫu SVHO-YYYY với Y là các số 0-9 ex(SVHO-0001)");
        System.out.println("ID: ");
        String id = GetStr();
        checkData.checkString(id, CHECK_ID_HOUSE);

        System.out.println("Tên dịch vụ phải viết hoa ký tự đầu");
        System.out.println("Name: ");
        String name = GetStr();
        checkData.checkString(name, CHECK_NAME);

        System.out.println("Diện tích phải là số thực lớn hơn 30");
        System.out.println("Area: ");
        int area = (int) Float.parseFloat(GetStr());
        checkData.checkString(String.valueOf(area), CHECK_AREA);

        System.out.println("Giá thuê phải là số dương");
        System.out.println("Rent pirce: ");
        int rentPrice = (int) Float.parseFloat(GetStr());
        checkData.checkString(String.valueOf(rentPrice), CHECK_RENT_PRICE);

        System.out.println("Sô người tối đa > 0 và < 20");
        System.out.println("Number People Max:");
        int numberPeopleMax = Integer.parseInt(GetStr());
        boolean check1 = true;
        do {
            if(numberPeopleMax > 0 && numberPeopleMax < 20){
                check1 = false;
            } else{
                System.out.println("Nhập lại");
                numberPeopleMax = Integer.parseInt(GetStr());
            }
        } while(check1);

        System.out.println("kiểu thuê phải nằm trong: YEAR, MONTH, DAY, HOUR");
        System.out.println("Rent Type:");
        String rentType = GetStr();
        checkData.checkString(rentType, CHECK_RENT_TYPE);

        System.out.println("Nhập số 1-5 (được tính theo sao)");
        System.out.println("Room Criterion: ");
        String roomCriterion = GetStr();
        checkData.checkString(roomCriterion, CHECK_ROOM_CRITERION);

        System.out.println("Convenient Description:");
        String convenientDescription = GetStr();

        System.out.println("Diện tích phải là số thực lớn hơn 30");
        System.out.println("Area Pool:");
        int areaPool = Integer.parseInt(GetStr());
        checkData.checkString(String.valueOf(areaPool), CHECK_AREA);

        System.out.println("Nhập số nguyên");
        System.out.println("Number Of Floors:");
        int numberOfFloors = Integer.parseInt(GetStr());
        checkData.checkString(String.valueOf(numberOfFloors), CHECK_ROOM_CRITERION);



        Villa villa = new Villa(id, name, area, rentPrice, numberPeopleMax, rentType, roomCriterion, convenientDescription, areaPool, numberOfFloors);

        // Create a new list of Country objects
        List<Villa> villas = new ArrayList<>();
        villas.add(villa);

        FileWriter fileWriter = null;

        try {
            fileWriter = new FileWriter(fileName, true);
            // Write a new Country object list to the CSV file
            for (Villa villa1 : villas) {
                fileWriter.append(villa1.getId());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(villa1.getName());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(villa1.getArea()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(villa1.getRentPrice()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(villa1.getNumberPeopleMax()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(villa1.getRentType());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(villa1.getRoomCriterion());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(villa1.getConvenientDescription());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(villa1.getAreaPool()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(villa1.getNumberOfFloors()));
                fileWriter.append(NEW_LINE_SEPARATOR);
            }

            System.out.println("Create House service success !!!");

        } catch (Exception e) {
            System.out.println("Error in CsvFileWriter !!!");
            e.printStackTrace();
        } finally {
            try {
                fileWriter.flush();
                fileWriter.close();
            } catch (IOException e) {
                System.out.println("Error while flushing/closing fileWriter !!!");
                e.printStackTrace();
            }
        }



        System.out.println("ID: " + villa.getId());
        System.out.println("Name: " + villa.getName());
        System.out.println("Area: " + villa.getArea());
        System.out.println("Rent pirce: " + villa.getRentPrice());
        System.out.println("Number People Max:" + villa.getNumberPeopleMax());
        System.out.println("Rent Type: " + villa.getRentType());
        System.out.println("Room Criterion: " + villa.getRoomCriterion());
        System.out.println("Convenient Description: " + villa.getConvenientDescription());
        System.out.println("Area Pool: " + villa.getAreaPool());
        System.out.println("Number Of Floors: " + villa.getNumberOfFloors());
    }
    public static void addNewHouse(){

        CheckData checkData = new CheckData();

        String fileName = "C:\\Users\\Admin\\Desktop\\Inter042_Nguyen-Van-Tam\\FuramaResort\\src\\data\\House.csv";

        System.out.println("Nhập theo mẫu SVHO-YYYY với Y là các số 0-9 ex(SVHO-0001)");
        System.out.println("ID: ");
        String id = GetStr();
        checkData.checkString(id, CHECK_ID_HOUSE);

        System.out.println("Tên dịch vụ phải viết hoa ký tự đầu");
        System.out.println("Name: ");
        String name = GetStr();
        checkData.checkString(name, CHECK_NAME);

        System.out.println("Diện tích phải là số thực lớn hơn 30");
        System.out.println("Area: ");
        int area = (int) Float.parseFloat(GetStr());
        checkData.checkString(String.valueOf(area), CHECK_AREA);

        System.out.println("Giá thuê phải là số dương");
        System.out.println("Rent pirce: ");
        int rentPrice = (int) Float.parseFloat(GetStr());
        checkData.checkString(String.valueOf(rentPrice), CHECK_RENT_PRICE);

        System.out.println("Sô người tối đa > 0 và < 20");
        System.out.println("Number People Max:");
        int numberPeopleMax = Integer.parseInt(GetStr());
        boolean check1 = true;
        do {
            if(numberPeopleMax > 0 && numberPeopleMax < 20){
                check1 = false;
            } else{
                System.out.println("Nhập lại");
                numberPeopleMax = Integer.parseInt(GetStr());
            }
        } while(check1);

        System.out.println("kiểu thuê phải nằm trong: YEAR, MONTH, DAY, HOUR");
        System.out.println("Rent Type:");
        String rentType = GetStr();
        checkData.checkString(rentType, CHECK_RENT_TYPE);

        System.out.println("Nhập số 1-5 (được tính theo sao)");
        System.out.println("Room Criterion: ");
        String roomCriterion = GetStr();
        checkData.checkString(roomCriterion, CHECK_ROOM_CRITERION);

        System.out.println("Convenient Description:");
        String convenientDescription = GetStr();
        System.out.println("Nhập số nguyên");
        System.out.println("Number Of Floors:");
        int numberOfFloors = Integer.parseInt(GetStr());
        checkData.checkString(String.valueOf(numberOfFloors), CHECK_ROOM_CRITERION);

        House house = new House(id, name, area, rentPrice, numberPeopleMax, rentType, roomCriterion, convenientDescription, numberOfFloors);

        // Create a new list of Country objects
        List<House> houses = new ArrayList<>();
        houses.add(house);

        FileWriter fileWriter = null;

        try {
            fileWriter = new FileWriter(fileName, true);

            // Write a new Country object list to the CSV file
            for (House house1 : houses) {
                fileWriter.append(house1.getId());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(house1.getName());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(house1.getArea()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(house1.getRentPrice()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(house1.getNumberPeopleMax()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(house1.getRentType());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(house1.getRoomCriterion());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(house1.getConvenientDescription());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(house1.getNumberOfFloors()));
                fileWriter.append(NEW_LINE_SEPARATOR);
            }
            System.out.println("Create House service success !!!");

        } catch (Exception e) {
            System.out.println("Error in CsvFileWriter !!!");
            e.printStackTrace();
        } finally {
            try {
                fileWriter.flush();
                fileWriter.close();
            } catch (IOException e) {
                System.out.println("Error while flushing/closing fileWriter !!!");
                e.printStackTrace();
            }
        }
        System.out.println("ID: " + house.getId());
        System.out.println("Name: " + house.getName());
        System.out.println("Area: " + house.getArea());
        System.out.println("Rent pirce: " + house.getRentPrice());
        System.out.println("Number People Max:" + house.getNumberPeopleMax());
        System.out.println("Rent Type: " + house.getRentType());
        System.out.println("Room Criterion: " + house.getRoomCriterion());
        System.out.println("Convenient Description: " + house.getConvenientDescription());
        System.out.println("Number Of Floors: " + house.getNumberOfFloors());
    }
    public static void addNewRoom(){
        CheckData checkData = new CheckData();
        String fileName = "C:\\Users\\Admin\\Desktop\\Inter042_Nguyen-Van-Tam\\FuramaResort\\src\\data\\Room.csv";

        System.out.println("Nhập theo mẫu SVRO-YYYY với Y là các số 0-9 ex(SVRO-0001)");
        System.out.println("ID: ");
        String id = GetStr();
        checkData.checkString(id, CHECK_ID_ROOM);

        System.out.println("Tên dịch vụ phải viết hoa ký tự đầu");
        System.out.println("Name: ");
        String name = GetStr();
        checkData.checkString(name, CHECK_NAME);

        System.out.println("Diện tích phải là số thực lớn hơn 30");
        System.out.println("Area: ");
        int area = (int) Float.parseFloat(GetStr());
        checkData.checkString(String.valueOf(area), CHECK_AREA);

        System.out.println("Giá thuê phải là số dương");
        System.out.println("Rent pirce: ");
        int rentPrice = (int) Float.parseFloat(GetStr());
        checkData.checkString(String.valueOf(rentPrice), CHECK_RENT_PRICE);

        System.out.println("Sô người tối đa > 0 và < 20");
        System.out.println("Number People Max:");
        int numberPeopleMax = Integer.parseInt(GetStr());
        boolean check1 = true;
        do {
            if(numberPeopleMax > 0 && numberPeopleMax < 20){
                check1 = false;
            } else{
                System.out.println("Nhập lại");
                numberPeopleMax = Integer.parseInt(GetStr());
            }
        } while(check1);

        System.out.println("kiểu thuê phải nằm trong: YEAR, MONTH, DAY, HOUR");
        System.out.println("Rent Type:");
        String rentType = GetStr();
        checkData.checkString(rentType, CHECK_RENT_TYPE);

        System.out.println("dịch vụ đi kèm phải nằm trong :MASSAGE, KARAOKE, FOOD, DRINK, CAR");
        System.out.println("Service Free Attach: ");
        String serviceFreeAttach = GetStr();
        checkData.checkString(serviceFreeAttach, CHECK_SERVICE_ATTACK);

        Room room = new Room(id, name, area, rentPrice, numberPeopleMax, rentType, serviceFreeAttach);
        List<Room> rooms = new ArrayList<>();
        rooms.add(room);

        FileWriter fileWriter = null;

        try {
            fileWriter = new FileWriter(fileName, true);

            // Write a new Country object list to the CSV file
            for (Room room1 : rooms) {
                fileWriter.append(room1.getId());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(room1.getName());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(room1.getArea()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(room1.getRentPrice()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(String.valueOf(room1.getNumberPeopleMax()));
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(room1.getRentType());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(room1.getServiceFreeAttach());
                fileWriter.append(NEW_LINE_SEPARATOR);
            }

            System.out.println("Create Room service success !!!");

        } catch (Exception e) {
            System.out.println("Error in CsvFileWriter !!!");
            e.printStackTrace();
        } finally {
            try {
                fileWriter.flush();
                fileWriter.close();
            } catch (IOException e) {
                System.out.println("Error while flushing/closing fileWriter !!!");
                e.printStackTrace();
            }
        }
        System.out.println("ID: " + room.getId());
        System.out.println("Name: " + room.getName());
        System.out.println("Area: " + room.getArea());
        System.out.println("Rent pirce: " + room.getRentPrice());
        System.out.println("Number People Max:" + room.getNumberPeopleMax());
        System.out.println("Rent Type: " + room.getRentType());
        System.out.println("Service Free Attach: " + room.getServiceFreeAttach());

    }

    public static void showAllRoom(){
        BufferedReader br = null;
        try {
            String line;
            br = new BufferedReader(new FileReader("C:\\Users\\Admin\\Desktop\\Inter042_Nguyen-Van-Tam\\FuramaResort\\src\\data\\Room.csv"));

            // How to read file in java line by line?
            while ((line = br.readLine()) != null) {
                showRoom(parseCsvLine(line));
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null)
                    br.close();
            } catch (IOException crunchifyException) {
                crunchifyException.printStackTrace();
            }
        }
    }
    public static void showAllVilla(){
        BufferedReader br = null;
        try {
            String line;
            br = new BufferedReader(new FileReader("C:\\Users\\Admin\\Desktop\\Inter042_Nguyen-Van-Tam\\FuramaResort\\src\\data\\Villa.csv"));

            // How to read file in java line by line?
            while ((line = br.readLine()) != null) {
                showVilla(parseCsvLine(line));
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null)
                    br.close();
            } catch (IOException crunchifyException) {
                crunchifyException.printStackTrace();
            }
        }
    }
    public static void showAllHouse(){
        BufferedReader br = null;
        try {
            String line;
            br = new BufferedReader(new FileReader("C:\\Users\\Admin\\Desktop\\Inter042_Nguyen-Van-Tam\\FuramaResort\\src\\data\\House.csv"));

            // How to read file in java line by line?
            while ((line = br.readLine()) != null) {
                showHouse(parseCsvLine(line));
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null)
                    br.close();
            } catch (IOException crunchifyException) {
                crunchifyException.printStackTrace();
            }
        }
    }

    public static List<String> parseCsvLine(String csvLine) {
        List<String> result = new ArrayList<String>();
        if (csvLine != null) {
            String[] splitData = csvLine.split(COMMA_DELIMITER);
            for (int i = 0; i < splitData.length; i++) {
                result.add(splitData[i]);
            }
        }
        return result;
    }
    private static void showRoom(List<String> room) {
        System.out.println("ID: " + room.get(0));
        System.out.println("Name: " + room.get(1));
        System.out.println("Area: " + room.get(2));
        System.out.println("Rent pirce: " + room.get(3));
        System.out.println("Number People Max:" + room.get(4));
        System.out.println("Rent Type: " + room.get(5));
        System.out.println("Room Criterion: " + room.get(6));;
        System.out.println("==================================");
    }
    private static void showVilla(List<String> villa){
        System.out.println("ID: " + villa.get(0));
        System.out.println("Name: " + villa.get(1));
        System.out.println("Area: " + villa.get(2));
        System.out.println("Rent pirce: " + villa.get(3));
        System.out.println("Number People Max:" + villa.get(4));
        System.out.println("Rent Type: " + villa.get(5));
        System.out.println("Room Criterion: " + villa.get(6));;
        System.out.println("Convenient Description: " + villa.get(7));
        System.out.println("Area Pool: " + villa.get(8));
        System.out.println("Number Of Floors: " + villa.get(9));
        System.out.println("==================================");
    }
    private static void showHouse(List<String> house){
        System.out.println("ID: " + house.get(0));
        System.out.println("Name: " + house.get(1));
        System.out.println("Area: " + house.get(2));
        System.out.println("Rent pirce: " + house.get(3));
        System.out.println("Number People Max:" + house.get(4));
        System.out.println("Rent Type: " + house.get(5));
        System.out.println("Room Criterion: " + house.get(6));;
        System.out.println("Convenient Description: " + house.get(7));
        System.out.println("Number Of Floors: " + house.get(8));
        System.out.println("==================================");
    }

    public static void addNewCustomer(){

        String fileName = "C:\\Users\\Admin\\Desktop\\Inter042_Nguyen-Van-Tam\\FuramaResort\\src\\data\\Customer.csv";

        System.out.println("Name: ");
        String name = GetStr();

        System.out.println("Birth Day: ");
        String birthDay = GetStr();

        System.out.println("Gender: ");
        String gender = GetStr();

        System.out.println("ID Card: ");
        String idCard = GetStr();

        System.out.println("Number Phone:");
        String numberPhone = GetStr();

        System.out.println("Email:");
        String email = GetStr();

        System.out.println("Customer Type: ");
        String customerType = GetStr();

        System.out.println("Address: ");
        String address = GetStr();

        System.out.println("Services: ");
        String services = GetStr();

        Customer customer = new Customer(name,
                birthDay,
                gender,
                idCard,
                numberPhone,
                email,
                customerType,
                address,
                services);
        List<Customer> customers = new ArrayList<>();
        customers.add(customer);

        FileWriter fileWriter = null;

        try {
            fileWriter = new FileWriter(fileName, true);

            // Write a new Country object list to the CSV file
            for (Customer customer1 : customers) {
                fileWriter.append(customer1.getName());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(customer1.getBirthDay());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(customer1.getGender());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(customer1.getIdCard());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(customer1.getNumberPhone());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(customer1.getEmail());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(customer1.getCustomerType());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append(customer1.getAddress());
                fileWriter.append(COMMA_DELIMITER);

                fileWriter.append((CharSequence) customer1.getServices());
                fileWriter.append(NEW_LINE_SEPARATOR);
            }

            System.out.println("Create Room service success !!!");

        } catch (Exception e) {
            System.out.println("Error in CsvFileWriter !!!");
            e.printStackTrace();
        } finally {
            try {
                fileWriter.flush();
                fileWriter.close();
            } catch (IOException e) {
                System.out.println("Error while flushing/closing fileWriter !!!");
                e.printStackTrace();
            }
        }
        System.out.println("Name: " + customer.getName());
        System.out.println("Birth Day: " + customer.getBirthDay());
        System.out.println("Gender: " + customer.getGender());
        System.out.println("ID Card: " + customer.getIdCard());
        System.out.println("Number Phone:" + customer.getNumberPhone());
        System.out.println("Email: " + customer.getEmail());
        System.out.println("Customer Type: " + customer.getCustomerType());
        System.out.println("Address: " + customer.getAddress());
        System.out.println("Service: " + customer.getServices());
    }

}
