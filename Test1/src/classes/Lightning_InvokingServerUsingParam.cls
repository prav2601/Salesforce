public class Lightning_InvokingServerUsingParam {
    
   @AuraEnabled
    public static List<Account> getAccount(String accIndustry,String rating){
      List<Account>  accList=[select Name,Industry,Phone,Rating from Account where Industry=:accIndustry  and Rating=:rating];
        return accList;
    }

}