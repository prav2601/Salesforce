public class Retrieve_DataWO_ManuallyEnteredRecord {
    public List<Account> accounts {set;get;} 
    public Account acc {set;get;} 
    
    public Retrieve_DataWO_ManuallyEnteredRecord(){
        accounts=new List<Account>();
        
    }
    public void add(){
        List<Account> ac=new List<Account>();
        ac=[select name from Account];
       // accounts=[select name from Account];
        
        Integer counter=0;
        for(Account a:ac)
        {
            if(Math.mod(counter, 2)!=0)
            {
             	accounts.add(ac.get(counter));
            	System.debug(accounts);   
            }
            
            counter=counter+1;
         
    }
    
}
}