public class Extension_StandardSetController {
    public List<Customer__c> custList {set;get;}
    public Extension_StandardSetController(Apexpages.StandardSetController controller){
        String[] fields= new String[]{'Name__c','facbook__c','phone__c'};
            controller.addFields(fields);
      //  custList=(List<Customer__c>)controller.getRecords();
      custList=(List<Customer__c>)controller.getSelected();
    }
    
    public PageReference updateRecord(){
        for(Customer__c cust:custList){
            cust.facbook__c='www.facebook.com';
            cust.Phone__c='5478';            
        }
        update custList;
        PageReference p=new PageReference('/'+'a08?fcf=00B6F00000HnRTH');
        return p;
    }

}