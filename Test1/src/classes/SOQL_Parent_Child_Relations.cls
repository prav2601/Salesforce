public class SOQL_Parent_Child_Relations {
    public List<Account> accounts {set;get;}
    public List<Contact> contact {set;get;}
   
    
    public  SOQL_Parent_Child_Relations (){
        accounts=[select Id,Name,Type,Phone from Account where Type='Customer - Direct'];
        contact=[select AccountId,Name,Account.Name,Account.Type from Contact where AccountId in:accounts];
       
    }

}