import java.util.Arrays;
import java.util.Scanner;
public class Main {
    public static void main (String[] argss) {

        Scanner scan = new Scanner(System.in);

        Student S1 = new Student("None","none", "none", new String[]{"none","None"},"10", 10);

        System.out.print("Student Name: ");
        String SName = scan.next();
        S1.setName(SName);

        System.out.print("Student Lastname: ");
        String SLastname = scan.next();
        S1.setLastname(SLastname);

        System.out.print("Student Group: ");
        String SGroup = scan.next();
        S1.setGroup(SGroup);

        String SMarks = "";
        System.out.print("How many subjects: ");
        int SubNumber = scan.nextInt();
        String[] SSubjects = new String[SubNumber];
        for (int i = 0; i < SubNumber; i++)
        {
            SMarks += "[ ";
            System.out.print("Student Subject #" + i + " :");
            SSubjects[i] = scan.next();
            System.out.print("How many Marks: ");
            int StudMarks = scan.nextInt();
            int[][] Marks = new int[SubNumber][StudMarks];
            for (int j = 0; j < StudMarks; j++)
            {
                System.out.print(SSubjects[i] + " Mark #" + j + " :");
                Marks[i][j] = scan.nextInt();
                SMarks += Marks[i][j]+", ";
            }//Mark loop
            SMarks = SMarks + "] ";
        }//Subjects loop
        S1.Subjects.setSubject(SSubjects);
        S1.Subjects.setMarks(SMarks);

        int str = SMarks.length();
        double Average = 0;
        //str = str.replaceAll("\\D+","");
        for (int k = 0; k < str; k++) {
            char character = SMarks.charAt(k);
            if (Character.isDigit(character)) {
                Average += Character.getNumericValue(character);
            }
        }
        S1.Subjects.setAverage(Average);
        System.out.print("How many Credits: ");
        double SCredits = scan.nextInt();
        S1.Subjects.setCredits(SCredits);

        System.out.print("Name: " + S1.getName() + " Lastname: " + S1.getLastname() + " Group: " + S1.getGroup() + " Subject: " + Arrays.toString(S1.Subjects.getSubject()) + " Marks: " +  S1.Subjects.getMarks() + " Credits: " + S1.Subjects.getCredits() + " Student Average: " + S1.Subjects.calAverage());
    }
}
