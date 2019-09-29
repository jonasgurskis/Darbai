import java.util.Scanner;
public class Subject {
    private String[] Subject;
    private String Marks;
    private double Credits;
    private double Average;

    public Subject(String[] subject, String marks, double credits) {
        Subject = subject;
        Marks = marks;
        Credits = credits;
    }

    public String[] getSubject() {
        return Subject;
    }

    public String getMarks() {
        return Marks;
    }

    public double getCredits() {
        return Credits;
    }

    public double getAverage() {
        return Average;
    }

    public void setSubject(String[] newSubject) {
        Subject = newSubject;
    }

    public void setMarks(String newMarks) {
        Marks = newMarks;
    }

    public void setCredits(double newCredits) {
        Credits = newCredits;
    }

    public void setAverage(double newAverage) {
        Average = newAverage;
    }

    public double calAverage() {
        return Average / Credits;
    }
}



