public class Page_Message {
    public String name {set;get;}
    public String city {set;get;}
    public Page_Message(){
Apexpages.Message msg1 =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Success message');
        Apexpages.Message msg2=new Apexpages.Message(Apexpages.Severity.ERROR,'Message Error');
        Apexpages.addMessage(msg1);
        Apexpages.addMessage(msg2);
        
}
    public void submit1(){
            if(name!=null){
                Apexpages.Message msg3=new Apexpages.Message(Apexpages.Severity.WARNING,'Name should not be blank');
                Apexpages.addMessage(msg3);
            }
            if(city!=null){
                Apexpages.Message msg4=new Apexpages.Message(Apexpages.Severity.ERROR,'City should not be blank');
                Apexpages.addMessage(msg4);
            }
            
        }
}