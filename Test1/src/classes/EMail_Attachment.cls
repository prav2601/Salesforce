public class EMail_Attachment {
    public void sendEmailTemplate(){
    EmailTemplate et=[select Id from EmailTemplate where name='Email_Attachement'];
        Lead con=[select Id,LeadSource,Name from Lead where Email='psri260192@gmail.com'];
    Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        msg.setTemplateId(et.Id);
        msg.setWhatId(con.Id);
       // this is required only for user object msg.setSaveAsActivity(false);
        msg.setTargetObjectId(con.Id);
        Messaging.Email[] emails=new Messaging.Email[]{msg};
            Messaging.sendEmail(emails);
        
    }
    public void sendattachement(){
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        String[] toadd=new String[]{'psri260192@gmail.com','deepakdj26390@gmail.com'};
            msg.setToAddresses(toadd);
        Document d=[select Id, body from Document where name='Email_Attachement'];
        Messaging.EmailFileAttachment eft=new Messaging.EmailFileAttachment();
        eft.setFileName('March-April_Statement.pdf');
        eft.setBody(d.body);
        Messaging.EmailFileAttachment[] files=new Messaging.EmailFileAttachment[]{eft};
            msg.setFileAttachments(files);
        msg.setSubject('Monthly statment');
        
        msg.setPlainTextBody('This is two month statment');
        msg.setSenderDisplayName('icic@bank.com');
        Messaging.Email[] emails=new Messaging.Email[]{msg};
            Messaging.sendEmail(emails);
        
    }
}