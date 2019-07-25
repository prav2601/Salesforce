trigger UPdate_trigger_Account on Account (after update) {
   
    
    Trigger_Update_Account_Class.updateContact(Trigger.oldMap,Trigger.newMap);
    
    
}