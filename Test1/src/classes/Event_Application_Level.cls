public class Event_Application_Level {
    @AuraEnabled
    public static Account fetchAccount(String accname){
        Account acc=[select name,phone,industry from Account where name=:accname];
        return acc;
    }

}