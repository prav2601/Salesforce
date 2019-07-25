public class Apex_List {
    public String name {set;get;}
    public String phone {set;get;}
    public String rating {set;get;}
    public List<String> names {set;get;}
    
    public Apex_List(){
        names=new List<String>();
    }
    public void add(){
        name='Praveen';
        phone='8095534932';
        rating='A';
        names.add(name);
        names.add(phone);
        names.add(rating);
        
    }
    public void reset(){
        names=new List<String>();
    }
    
    
}