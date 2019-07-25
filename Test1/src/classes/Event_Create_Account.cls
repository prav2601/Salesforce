public class Event_Create_Account {
    @AuraEnabled
    public static String createAccount(String name,String phone,String rating){
        String result;
        try{
            Account acc=new Account();
            acc.Name =name;
        acc.Phone=phone;
        acc.Rating=rating;
        insert acc;
            system.debug(acc);
            result=''+ acc.Id;
        }
        catch(Exception e){
            result='DML Execption';
        }
        return result;
        
    }
    
    @AuraEnabled
    public static String createContact(String lastName,String firstName,String accountId){
        String result;
        try{
            Contact con=new Contact();
            con.AccountId=accountId;
            con.LastName=lastName;
            con.FirstName=firstName;
            insert con;
            result=''+con.Id;
            
        }
        catch (Exception e){
            result ='DML Contact insert failed';
        }
        return result;
    }

}