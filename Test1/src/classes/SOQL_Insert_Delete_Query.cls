public class SOQL_Insert_Delete_Query {
    public List<Account> accounts {set;get;}
    public List<Contact> contactList {set;get;}
   
    
    public SOQL_Insert_Delete_Query(){
        accounts=[select Name,Phone,Type, (select Name,Phone,Email from Contacts) from Account];
        for(Account acc:accounts){
            List<Contact> mylist=acc.contacts;
            if(mylist.size()>0){
                contactList.addAll(mylist);
              
            }
           
        }
       
            
    }
    
   
}