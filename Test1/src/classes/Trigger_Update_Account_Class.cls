public class Trigger_Update_Account_Class {
    public static void updateContact(Map<Id,Account> oldMap,Map<Id,Account> newMap){
        Set<Id> recordIds=oldMap.keySet();
        List<Id> ids=new List<Id>();
        for(ID accId:recordIds){
            Account old=oldMap.get(accId);
            Account acc=newMap.get(accId);
            if(old.Phone!=acc.Phone){
                ids.add(accId);
            }
        }
        List<Contact> contact=[select otherPhone,MobilePhone,AccountId from Contact where AccountId in :ids];
        for(Contact con:contact){
            Id aid=con.AccountId;
            Account old=oldMap.get(aid);
            Account acc=newMap.get(aid);
            con.OtherPhone=acc.Phone;
            con.MobilePhone=old.Phone;
            }
        update contact;
        
    }
}