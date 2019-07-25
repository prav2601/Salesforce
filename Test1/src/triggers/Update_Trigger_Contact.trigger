trigger Update_Trigger_Contact on Contact (before update) {
    Map<Id,Contact> oldMap=Trigger.oldMap;
    Map<Id,Contact> newMap=Trigger.newMap;
    Set<Id> ids=oldMap.keySet();
    
    for(Id con:ids){
        Contact oldCon=oldMap.get(con);
        Contact newCon=newMap.get(con);
        if(oldCon.Department!=newCon.Department){
            newCon.Description='New Department';
        }
    }

}