public class Outbound_Email_Lead {
    public void sendEmail(){
        List<Lead> leadlist=[select id,Name,Email,Company from Lead where createdDate=TODAY];
        
        for(Lead lead:leadlist){
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
          //  String[] emailadd=new String[]{lead.Email};
                List<String> emailA=new List<String>();
            emailA.add(lead.Email);
            msg.setToAddresses(emailA);
            msg.setSubject('Lead Record Details');
            String body='<h2> Dear :</h2>'+lead.Name+' Your Company is '+lead.Company;
            msg.setHtmlBody(body);
            List<Messaging.Email> emailsend=new List<Messaging.Email>{msg};
                Messaging.sendEmail(emailsend);
           
        }
        
    }

}