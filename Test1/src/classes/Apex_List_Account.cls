public class Apex_List_Account {
    public String name {set;get;}
    public String phone {set;get;}
    public String rating {set;get;}
    public String industry {set;get;}
    public List<Account> accounts {set;get;}
    Account acc1 {set;get;}
    Account acc2 {set;get;}
    public Apex_List_Account(){
        accounts=new List<Account>();
        acc1=new Account();
        acc2=new Account();
        
        
    }
    public void addEle(){
        acc1.Name=name;
        acc1.Phone=phone;
        acc1.Rating=rating;
         acc1.Industry=industry;
        acc2.Name=name;
        acc2.Phone=phone;
        acc2.Rating=rating;
         acc2.Industry=industry;
        accounts.add(acc1);
        accounts.add(acc2);
       
    }
    public void resetEle(){
         acc1.Name=null;
        acc1.Phone=null;
        acc1.Rating=null;
         acc1.Industry=null;
       
    }
    
}