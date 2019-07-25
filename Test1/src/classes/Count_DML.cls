public class Count_DML {
    public Count_DML(){
        List<AggregateResult> result =[select count(Customer__C)cust from Payment__c];
        String S=String.valueOf(result[0].get('cust'));
        Integer I=Integer.valueOf(S);
        system.debug(I);
    
    if(I>2){
           Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.ERROR,'Payment should not be more than 2');
            Apexpages.addMessage(msg);
        system.debug(msg);
            
        }
    }
    

}