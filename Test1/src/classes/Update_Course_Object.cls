public class Update_Course_Object {
    public List<Course_Wrapper> courseList{set;get;}
    public Boolean selectHeader{set;get;}
    
    public  Update_Course_Object()
    {
        courseList=new List<Course_Wrapper>();
        List<Course__c> course=[select Course_Name__c,Course_Intake_Stage__c,Course_Closing_Date__c from Course__c where Course_Intake_Stage__c=60];
        for(Course__c c:course){
            Course_Wrapper cw=new Course_Wrapper();
            cw.course=c;
            cw.flag=false;
            courseList.add(cw);
        }
        
        
    }
    public void deleteRecord(){
        if(selectHeader==true){
            List<Course__c> course=new List<Course__c>();
            for(Course_Wrapper c:courseList){
                course.add(c.course);
                c.flag=true;
                
            }
            delete course;
            courseList.clear();
        }
        else{
            List<Course__c> course1=new List<Course__c>();
            for(Course_Wrapper c:courseList){
                if(c.flag==true){
                    course1.add(c.course);
                }
            }
            delete course1;
             courseList.clear();
            List<Course__c> course=[select Course_Name__c,Course_Intake_Stage__c,Course_Closing_Date__c from Course__c where Course_Intake_Stage__c=60];
            for(Course__c c:course){
                Course_Wrapper cw=new Course_Wrapper();
                cw.course=c;
                cw.flag=false;
                courseList.add(cw);
            }
           
        }
        
    }
    
    
    
    
    public class Course_Wrapper{
        public Course__c course {set;get;}
        public Boolean flag{set;get;}
    }
}