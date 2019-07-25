public class Lightning_InsertOperation {
    @AuraEnabled
    public static String insertData(Contact con){
        String status;
        try{
            insert con;
            status='Insertion success';
        }
        catch(Exception e){
            status='Falied' +e.getMessage();
            
        }
        return status;
    }

}