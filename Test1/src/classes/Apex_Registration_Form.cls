public class Apex_Registration_Form {
    public String selected {set;get;}
    public Integer count {set;get;}
    public void invoke(){
        if(selected=='Freshers'){
            count=1;
        }
        else if(selected=='Experienced'){
            count=2;
        }
        else{
            count=0;
        }
    }
    public void reset(){
        
    }
}