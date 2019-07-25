public class Wrapper_Class_Account {
    public List<Wrapper_Class> accounts {set;get;}
    public Wrapper_Class wrapper {set;get;}
    
    public Wrapper_Class_Account(){
        accounts =new List<Wrapper_Class>();
        wrapper=new Wrapper_Class();
        add();
        
    }
	
    public void add(){
        wrapper.acc=new Account();
        wrapper.cont=new Contact();
        accounts.add(wrapper);
        
    }
}