public class Action_Support_Industry {
    public List<Account> accounts     {set;get;}
    public List<SelectOption> indOption{set;get;}
    public String selected {set;get;}
    public List<Contact> contacts{set;get;}
    
    
    
    
    public Action_Support_Industry(){
        indOption=new List<SelectOption>();
        SelectOption s=new SelectOption('none','-None-');
        indOption.add(s);
        Schema.DescribeFieldResult result=Account.Industry.getDescribe();
        List<Schema.PicklistEntry> values =result.getPickListValues();
        for(Schema.PicklistEntry value:values){
            SelectOption op=new SelectOption(value.getLabel(),value.getValue());
            indOption.add(op);
        }
        
    }
    
    public void showAccount(){
        
        accounts=[select Name,industry,Rating,Phone from Account where industry=:selected];
        for(Account acc:accounts){
            contacts=[select firstName,LastName from Contact where AccountId=:acc.Id];
        }
    }

}