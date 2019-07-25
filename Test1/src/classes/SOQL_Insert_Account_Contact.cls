public class SOQL_Insert_Account_Contact {
   public Account acc {set;get;}
   public List<Contact> contactList {set;get;}
    
    public SOQL_Insert_Account_Contact(){
        acc=new Account();
        contactList=new List<Contact>();
		addContact();            
    }
    public void addContact(){
        Contact c=new Contact();
        contactList.add(c);
    }
    public PageReference create(){
        PageReference  p;
        Integer count=[select count() from Account where Name=:acc.Name];
        if(count>0){
            Apexpages.Message msg=new Apexpages.Message(Apexpages.Severity.ERROR,'Duplicate Account Exit');
           	Apexpages.addMessage(msg);
        }
        else{
            insert acc;
            for(Contact cont:contactList){
                cont.AccountId=acc.Id;
            }
            insert contactList;
            p=new PageReference('/'+acc.Id);
        }
        return p;
    }
}