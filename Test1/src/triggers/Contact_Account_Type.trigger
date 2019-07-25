trigger Contact_Account_Type on Contact (before insert) {
    
    
        List<Contact> conList=Trigger.New;
        Contact con=conList.get(0);
        system.debug(con);
       // Id accountId=con.AccountId;
        Set<Id> ids=new Set<Id>();
        for(Contact con:conList){
            ids.add(con.AccountId);
        }
        
       // Account acc=[select Id,Name, Type,phone from Account where id =:accountId];
       List<Account> acc=[select Id,Name, Type,phone from Account where id in:ids];
    for(Account a:acc){
        for(Contact con:conList){
            if(con.AccountId==a.Id){
                con.OtherPhone=a.Phone;
            }
        }
    }
       //con.OtherPhone=acc.Phone;
       // system.debug(con.OtherPhone);
        
        
    
    
    
}