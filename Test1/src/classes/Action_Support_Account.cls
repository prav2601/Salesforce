public class Action_Support_Account {
    public String selected        {set;get;}
     public List<Account> accounts    {set;get;}
    
    
    public  Action_Support_Account(){
        accounts=new List<Account>();
        if(selected=='AllAccounts'){
            accounts=[SELECT BillingState,Name,Phone,Rating,Site,Type FROM Account];
        }
        else{
            accounts=[SELECT BillingState,Name,Phone,Rating,Site,Type FROM Account where Type =:selected];
        }
        
        
    }
    
}