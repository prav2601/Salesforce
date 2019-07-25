trigger Trigger_Task on Payment__c (after delete) {
    
   // if(isInsert==true){
    //    Trigger_Task_1.addPaymentAmount(Trigger.New);
    //    
    //    
    //
    //if(isDelete==true){
    //    Trigger_Task_1.deletePayment(Trigger.oldMap);
   // }
   // if(isUpdate==true){
       // Trigger_Task_1.updatePayment(Trigger.oldMap,Trigger.newMap);
    //}
    //
    Trigger_Task_1.sendPaymentDetails(Trigger.Old);
    
}