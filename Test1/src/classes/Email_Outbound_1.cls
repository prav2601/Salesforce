public class Email_Outbound_1 {
    public void sendEmail(){
        List<Messaging.Email> emails =new List<Messaging.Email>();
        List<Opportunity> optyList=[select Id,ownerId, Name,CloseDate, StageName,Amount from Opportunity where CloseDate=TODAY];
        Set<Id> ownerId=new Set<Id>();
        for(Opportunity op:optyList){
            ownerId.add(op.ownerId);
        }
        List<User> users=[select id,firstName,lastName,email from User where id in:ownerId];
        Map<Id,user> mapUser=new Map<Id,user>();
        for(User u:users){
            mapUser.put(u.Id,u);
        }
        for(Opportunity o:optyList){
            User u=mapUser.get(o.OwnerId);
            String[] toadd=new String[]{u.Email};
                String[] cc=new String[]{'deepakdj26390@gmail.com'};
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            msg.setToAddresses(toadd);
            msg.setCcAddresses(cc);
            msg.setSubject('Opportunity Closed Notification');
            String body='<h2>Dear'+ u.firstName +u.LastName;
            body=body+'Your opportunity got closed details are:';
                body=body+o.Name + o.CloseDate+o.StageName+o.Amount;
            msg.setHtmlBody(body);
            emails.add(msg);
        }
        Messaging.sendEmail(emails);
    }
}