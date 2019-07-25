public class JSON_Serialize_Example_1 {
    
    public JSON_Serialize_Example_1(){
        
        
        List<Account> accounts=[select ID,Name,Industry from Account];
     
        List<Account> a=new List<Account>();
        for(Account acc:accounts){
            Account ac=new Account();
            ac.Name=acc.Name;
            ac.Id=acc.Id;
            ac.Industry=acc.Industry;
            a.add(ac);
             String result=JSON.serialize(ac);
            system.debug('JSON' + result);
         }
       
    }
    

}