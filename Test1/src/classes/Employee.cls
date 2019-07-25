public class Employee {
	public String studentName;
    public String collegeName;
    public Decimal fees;
    public String course;
    
    public Employee(String name, String clgName, String crs ){
        studentName=name;
        collegeName=clgName;
        course=crs;
    }
    public void calculate(){
        if(course=='CSE'){
            fees=50000;
        }
        else {
            fees=4000;
        }
        system.debug('StudentName :'+studentName);
        system.debug('CollegeName :'+collegeName);
        system.debug('Course :'+course);
        system.debug('fees :'+fees);
    }
}