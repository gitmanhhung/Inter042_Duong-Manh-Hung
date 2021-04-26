package commons;

import java.util.Scanner;
import java.util.regex.Pattern;

public class CheckData {

    private static final String CHECK_ERROR = "ERROR !!! PLEASE AGAIN ENTER:";

    public String checkString(String input, String partern){
        boolean check = true;
        Scanner scan = new Scanner(System.in);
        do {
            if(Pattern.matches(partern, input)){
                check = false;
            } else{
                System.out.println(CHECK_ERROR);
                input = scan.nextLine();
            }
        } while(check);
        return input;
    }
}
