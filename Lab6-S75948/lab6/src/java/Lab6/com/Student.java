package Lab6.com;

import java.util.regex.*;

public class Student {

    private String stuno;
    private String name;
    private String program;

    public Student() {
    }

    public String getStuno() {

        Pattern pt = Pattern.compile("[A-Z0-9]*");
        Matcher mt = pt.matcher(this.stuno);

        boolean bl = mt.matches();

        if(bl){
            return stuno;
        }
        else{
            return "Invalid Format";
        }
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }
}       