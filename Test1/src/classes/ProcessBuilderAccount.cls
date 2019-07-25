public class ProcessBuilderAccount {

    
    @invocableMethod(label='DeleteAccount')
    public static void deleteaccount(){
      List<Account>  acc=[select Id from Account where CreatedDate=Today];
        delete acc;
    }

}