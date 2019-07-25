global class Batch_Lead_Example implements Database.Batchable<sobject>{
    List<Lead> leadlist=new List<Lead>();
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        
       return  null;
        
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        Lead lead1=new Lead();
        lead1.LastName='Singh';
        lead1.Company='TCS';
        lead1.Status='Open';
        lead1.FirstName='Vivek';
        
        Lead lead2=new Lead(LastName='Pandey',FirstName='Sashi',Company='Infy',Status='Closed');
         Lead lead3=new Lead(LastName='Mishra',FirstName='Vinit',Company='Accenture',Status='Hold');
        scope.add(lead1);
        scope.add(lead2);
        scope.add(lead3);
        database.insert(scope,false);
        
    }
    global void finish(Database.BatchableContext bc){
        List<Messaging.Email> emails=new List<Messaging.Email>();
        for(Lead l:leadlist){
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        List<String> email=new List<String>();
        email.add('psri260192@gmail.com');
        msg.setToAddresses(email);
        msg.setSubject('New Lead Added');
        String body='Dear HOD, Following Leads are added:';
            body=body+'Name: '+l.FirstName+' '+l.LastName;
            body=body+'Company: '+l.Company;
            body=body+'Status: '+l.Status;
         msg.setHtmlBody(body);
            emails.add(msg);
            }
        Messaging.sendEmail(emails);
        
        
        
    }

}