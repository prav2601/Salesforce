trigger RestrictChildRecord on Payment__c (before insert) {
    
    
        List<Payment__c> paylist=Trigger.New;
    	
        Map<Id,List<Payment__c>> payMap=new Map<Id,List<Payment__c>>();
   	 List<Payment__c> paymentList=new List<Payment__c>();
        for (Payment__c pay:paylist){
            Id custId=pay.Customer__c;
            Boolean flag=payMap.containsKey(custId);
            if(flag==true){
                List<Payment__c> existingPay =payMap.get(custId);
                existingPay.add(pay);
         }
            else{
                Payment__c payment=new Payment__c();
                payment.Amount__c=pay.Amount__c;
                payment.Customer__c=custId;
                payment.Mode__c=pay.Mode__c;
                paymentList.add(pay);
                payMap.put(custId, payList);
            }
                
        }

    Set<Id> customerId=payMap.keySet();
    
    List<AggregateResult> result= [select Customer__c,count(Mode__c)cust from Payment__c where Customer__c in:customerId group by Customer__c];
    //List<Payment__c> pList=[select Customer__c, count(Mode__c)cust  from Payment__c where Customer__c in:customerId group by Customer__c];
    for(Payment__c eachpayment:paylist){
        for(AggregateResult res:result){
         Id paymentCustomerid=eachpayment.Customer__c;
        Id custId=(Id)res.get('Customer__c');
        Integer customercount=(Integer)res.get('cust');
            if(paymentCustomerid==custId){
                if(customercount>2){
                    eachpayment.addError('Payment Should not be more than 2 for each customer');
                }
            }
        
        
    }
    }
    
    
    }