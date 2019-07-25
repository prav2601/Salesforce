public class SendEmailToAllRecordsInLeadObj {
    public void sendEmailToAllLeads()
    {
        List<Lead> listOfLeads = [select FirstName,LastName,Phone,Email,Industry from Lead where CreatedDate = TODAY];
        
        List<Messaging.Email> listOfEmailMessages = new List<Messaging.Email>();
        
        
        
        for(Lead leadRecord:listOfLeads)
        {
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
           List<String> listOfEmailAddresses = new List<String>();
            System.debug('Email Ids:'+listOfEmailAddresses);
            emailMsg.setSubject('Lead Notification Alert');
                              
            String body = 'Dear '+leadRecord.FirstName+' '+leadRecord.LastName+',';
            body=body+'Was browsing through LinkedIn. Looks like you and I are both in '+leadRecord.Industry+'.';
            emailMsg.setHtmlBody(body);
            
            listOfEmailAddresses.add(leadRecord.Email);
            emailMsg.setToAddresses(listOfEmailAddresses);
                                             System.debug('Email Ids:'+listOfEmailAddresses);
            listOfEmailMessages.add(emailMsg);
            Messaging.sendEmail(listOfEmailMessages);
         }
    }

}