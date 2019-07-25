public class Account_Extension {
    public Account acc{set;get;}
    public List<Contact> conList{set;get;}
    
    public Account_Extension(ApexPages.StandardController controller){
        
        String[] fields =new String[]{'Name','Rating','Phone','Industry'};
            controller.addFields(fields);
        Id accid=controller.getId();
       acc=(Account)controller.getRecord();
        conList=[select email,firstName from Contact where AccountId=:accid];
        //conList=[select email,firstName from Contact];
        
        
    }
    
    public PageReference  sendEmail(){
        List<Messaging.SingleEmailMessage> emails=new List<Messaging.SingleEmailMessage>();
        for(Contact con:conList){
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            String[] toadd=new String[]{con.Email};
                msg.settoaddresses(toadd);
            msg.setSubject('Update  Account Details');
            String body='<b/>Hi'+con.FirstName+'your account details are below <br/>';
                body=body+'Thanks Sales Team';
            msg.setHtmlBody(body);
            emails.add(msg);
            
        }
        Messaging.sendEmail(emails);
        PageReference p=new PageReference ('/'+acc.Id);
        return p;
        
        
    }
    
    

}