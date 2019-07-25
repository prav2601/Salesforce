public class Apex_Page_Form {
    public Integer id {set;get;}
    public String name {set;get;}
    public String company {set;get;}
    public String skills {set;get;} 
    public String project {set;get;}
    
    public Apex_Page_Form(){
        id=496323;
        name='Praveen';
        company='Deloitte';
   }
    public void setProject(){
        IF(skills=='Java'){
            project='RI';
        }
        else{
            project='Anthem';
        }
    }
     public void setReset(){
        skills='';
         project='';
    }
}