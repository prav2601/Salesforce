public class ApexControllerInvoke {
    @AuraEnabled
    public static List<Account> getAccount(){
        List<Account> acc=[select Name,Industry,Phone from Account];
        return acc;
    }

}