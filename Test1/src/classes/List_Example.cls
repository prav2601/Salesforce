public class List_Example {
    public String name {set;get;}
    public String phone {set;get;}
    public String industry {set;get;}
    
    List<Account> accounts {set;get;}
    Account acc1 {set;get;}
    
    
    public List_Example(){
        accounts=new List<Account>();
        
    }
    public void addEle(){
        acc1=new Account();
        accounts.add(acc1);
        
    }
    

}