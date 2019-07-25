public class XML_Customer_withPayment {
    public String xmlString{set;get;}
    public XML_Customer_withPayment(){
        List<Customer__c> customers=[select Id,Name__c,city__c,Phone__c,Status__c,Manager__c,Email__c,(select Id,Amount__c,Mode__c,Customer__c from Payment__r) from Customer__c where status__c='Removed'];
       Dom.Document doc= new Dom.Document();
        Dom.XmlNode root=doc.createRootElement('Customers', null,null);
        for(Customer__c cust:customers){
            Dom.XmlNode cust1=root.addChildElement('Customer', null,null);
           // cust1.setAttribute('Name', cust.Name__c); this code is to set  attribute and value in same line
            Dom.XmlNode child1=cust1.addChildElement('Name', null,null);
            child1.addTextNode(cust.Name__c);
            Dom.XmlNode child2=cust1.addChildElement('City', null,null);
            if(cust.City__c!=null){
                 child2.addTextNode(cust.City__c);
            }
           
            Dom.XmlNode child3=cust1.addChildElement('Phone', null,null);
            if(cust.Phone__c!=null){
                child3.addTextNode(cust.Phone__c);
            }
            
             Dom.XmlNode child4=cust1.addChildElement('Status', null,null);
            if(cust.Status__c!=null){
                child4.addTextNode(cust.Status__c);
            }
            Dom.XmlNode child5=cust1.addChildElement('Manager', null,null);
            if(cust.Manager__c!=null){
                String managerId=String.valueOf(cust.Manager__c);
                 child5.addTextNode(managerId);
            }
           
            Dom.XmlNode child6=cust1.addChildElement('Email', null,null);
            if(cust.Email__c!=null){
                child6.addTextNode(cust.Email__c);
            }
            if(cust.Payment__r.size()>0){
                for(Payment__c pay:cust.Payment__r){
                    Dom.XmlNode child7=cust1.addChildElement('Payment',null,null);
                    Dom.XmlNode child71=child7.addChildElement('Amount', null,null);
                    if(pay.Amount__c!=null){
                        String amount=String.valueOf(pay.Amount__c);
                    	child71.addTextNode(amount);

                    }
                    Dom.XmlNode child72=child7.addChildElement('Mode', null,null);
                    if(pay.Mode__c!=null){
                        child72.addTextNode(pay.Mode__c);
                    }
                    
                }
                
            }
            
            
            
            
        }
        
        xmlString =doc.toXmlString();
    }
}