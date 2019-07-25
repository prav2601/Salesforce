trigger Customer_TRigger on Customer__c (before  insert) {
	//Trigger_Task_1.sendManagerApproval(Trigger.OldMap,Trigger.newMap);
	//
	//Trigger_Task_1.shareRecordWithManager(Trigger.newMap,Trigger.oldMap);
    
 //  Trigger_Task_1.deleteRecordWithManager(Trigger.newMap,Trigger.oldMap);
  //  
 // Trigger_Task_1.deleteCustomer(Trigger.oldMap);
 // 
// Trigger_Task_1.checkDuplicateCustomer(Trigger.New);
}