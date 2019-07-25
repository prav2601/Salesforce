public class Inbound_Example implements Messaging.InboundEmailHandler{
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result=new Messaging.InboundEmailResult();
       
        
        // Create new Lead
        try{
            
        Lead ld=new Lead();
       ld.Email=env.fromAddress;
        ld.LastName=email.fromName;
        
        ld.Company='Self';
        ld.Status='Open';
        ld.Industry='Health';
        insert ld;
        result.success=true;
        }
        catch(Exception e){
           result.success=false; 
        }
        return result;
    }

}