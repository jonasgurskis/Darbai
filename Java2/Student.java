public class Student {
    private String Name;
    private String Lastname;
    private String Group;
    public Subject Subjects;
    public Student (String name, String lastname, String group, String[] subject, String marks, double credits) {
        Name = name;
        Lastname = lastname;
        Group = group;
        Subjects = new Subject(subject, marks, credits);
    }
    public String getName() {
        return Name;
    }
    public String getLastname() {
        return Lastname;
    }
    public String getGroup() {
        return Group;
    }
    public void setName (String newName) {
        Name = newName;
    }
    public void setLastname(String newLastname) {
        Lastname = newLastname;
    }
    public void setGroup(String newGroup) {
        Group = newGroup;
    }
}
