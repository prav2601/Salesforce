public class Trigger_Task_1 {
    public static void addPaymentAmount(List<Payment__c> newPayments){
        if(newPayments.size() > 0)
        {
            Map<Id,Decimal> custMap =new Map<Id,Decimal>();
            for(Payment__c payments:newPayments){
                
                Id custId=payments.Customer__c;
                if(custMap.containskey(custId)){
                    Decimal amount=custMap.get(custId);
                    amount=amount+payments.Amount__c;
                    custMap.put(custId,amount);
                }
                else{
                    custMap.put(custId,payments.Amount__c);
                }
            }
            Set<Id> ids=custMap.keySet();
            List<Customer__c> customers=[select Id,Total_Amount__c from Customer__c where Id in:ids];
            for(Customer__c cust:customers){
                // cust.Total_Amount__c=0;
                Decimal amount=custMap.get(cust.Id);
                cust.Total_Amount__c=cust.Total_Amount__c+amount;
            }
            update customers;
        }
    }
    
    public static void deletePayment(Map<Id,Payment__c> oldMap){
        Map<Id,Decimal> custMap=new Map<Id,Decimal>();
        for(Payment__c pay:oldMap.values()){
            Id custId=pay.Customer__c;
            Boolean flag=custMap.containsKey(custId);
            if(flag==true){
                Decimal amount=custMap.get(custId);
                amount=amount-pay.Amount__c;
                custMap.put(custId,amount);
            }
            else{
                custMap.put(custId,pay.Amount__c);
            }
        }
        Set<Id> ids=custMap.keySet();
        List<Customer__c> customers=[select Id,Total_Amount__c from Customer__c where Id in:ids];
        for(Customer__c cust:customers){
            Decimal amount=custMap.get(cust.Id);
            cust.Total_Amount__c=cust.Total_Amount__c-amount;
        }
        update customers;
        
    }
    
    public static void updatePayment(Map<Id,Payment__c> oldMap,Map<Id,Payment__c> newMap){
        Map<Id,Decimal> custMap=new Map<Id,Decimal>();
        set<Id> paymentId=newMap.keySet();
        for(Payment__c pay:newMap.values()){
            Id custId=pay.Customer__c;
            Boolean flag=custMap.containskey(custId);
            for(Id key:paymentId){
                Payment__c oldPay=oldMap.get(key);
                Payment__c newPay=newMap.get(key);
                
                if(flag==true){
                    Decimal amount=custMap.get(custId);
                    if(oldPay.Amount__c!=newPay.Amount__c){
                        amount=amount+newPay.Amount__c;
                        custMap.put(custId,amount);
                    }
                    
                }
                else{
                    if(oldPay.Amount__c!=newPay.Amount__c){
                        
                        custMap.put(custId,newPay.Amount__c);
                    }
                }
            }
            
            
            
            
            
            
        }
        
        Set<Id> ids=custMap.keySet();
        List<Customer__c> customers=[select Id,Total_Amount__c from Customer__c where id in:ids];
        for(Customer__c cust: customers){
            Decimal amount =custMap.get(cust.Id);
            cust.Total_Amount__c=cust.Total_Amount__c+amount;
        }
        update customers;
    }
    
    
    public static void sendManagerApproval(Map<Id,Customer__c> oldMap,Map<Id,Customer__c> newMap){
        Set<Id> custIds=oldMap.keySet();
        List<Customer__c> customers=new List<Customer__c>();
        for(ID key:custIds){
            Customer__c oldCust=oldMap.get(key);
            Customer__c newCust=newMap.get(key);
            if(oldCust.Active__c!=newCust.Active__c){
                customers.add(newCust);
                Approval.ProcessSubmitRequest request =new Approval.ProcessSubmitRequest();
                request.setObjectId(key);
                request.setProcessDefinitionNameOrId('Customer_De_Activated');
                Id currentUserId=Userinfo.getUserId();
                System.debug('Id of the user submitting the record is:'+currentUserId);
                request.setsubmitterid(currentUserId);
                Id[] approverId=new Id[]{newCust.Manager__c};
                    System.debug('Id of the user approving the record is:'+approverId);
                request.setNextApproverIds(approverId);
                Approval.ProcessResult result =Approval.process(request);
                System.debug(result.isSuccess());
            }
        }
    }
    
    
    public static void shareRecordWithManager(Map<Id,Customer__c> newMap,Map<Id,Customer__c> oldMap){
        
        Set<Id> ids=oldMap.keySet();
        List<Customer__Share> share =new List<Customer__Share>();
        List<Customer__Share> share1 =new List<Customer__Share>();
        
        User u=[select id from User where firstName='Clerk'];
        for(Id key:ids){
            
            Customer__c oldCust=oldMap.get(key);
            Customer__c newCust=newMap.get(key);
            if(oldCust.Status__c!=newCust.Status__c){
                if(newCust.Status__c=='Approved'){
                    
                    Customer__Share cs=new Customer__Share();
                    cs.ParentId=key;
                    cs.UserOrGroupId=u.Id;
                    cs.Accesslevel='Edit';
                    cs.Rowcause='Manual';
                    // customers.add(newCust);  
                    share.add(cs);
                }
                
            }
            
        }
        // update customers;
        insert share;
        // delete share1;
        
        
    }
    
    public static void deleteRecordWithManager(Map<Id,Customer__c> newMap,Map<Id,Customer__c> oldMap){
        
        Set<Id> ids=oldMap.keySet();
        
        List<Customer__Share> share1 =new List<Customer__Share>();
        
        User u=[select id from User where firstName='Clerk'];
        for(Id key:ids){
            
            Customer__c oldCust=oldMap.get(key);
            Customer__c newCust=newMap.get(key);
            if(oldCust.Status__c!=newCust.Status__c){
                
                if(newCust.Status__c=='Removed'){
                    List<Customer__share> custShare=[select id from Customer__share where ParentId in:ids];
                    system.debug(custShare);
                    
                    Database.Delete(custShare, false);
                    
                }
            }
            
        }
        // update customers;
        // insert share;
        
        
        
    }
    
    public static void deleteCustomer(Map<Id,Customer__c> oldMap){
        Set<Id> custId=oldMap.keySet();
        for(Id key:custId){
            Customer__c oldCust=oldMap.get(key);
            if(oldCust.Status__c=='Active'){
                oldCust.addError('You can not delete the customer while status is Active');
            }
            
        }
    }
    
    public static void deletePaymentwithRespectiveCustomer(Map<Id,Customer__c> oldMap){
        
        Set<Id> custId=oldMap.keySet();
        List<Id> inactive=new List<Id>();
        List<Payment__c> pay=new List<Payment__c>();
        for(Id key:custId){
            Customer__c oldCust=oldMap.get(key);
            if(oldCust.Active__c==true){
                inactive.add(key);
                
            }
        }
        List<Payment__c> payList=[select id from Payment__c where customer__c in:inactive];
        delete payList;
        
        
    }
    
    public static void checkDuplicateCustomer(List<Customer__c> newCustomer){
        List<Customer__c> customers=[select Name__c,Email__c,Id from Customer__c];
        
        for(Customer__c cust:customers){
            for(Customer__c custNew:newCustomer){
                if(cust.Email__c==custNew.Email__c && cust.Name__c==custNew.Name__c){
                    custNew.addError('Duplicate customer');
                }
            }
        }
    }
    
    public static void sendPaymentDetails(List<Payment__c> payList){
        Set<Id> ids=new Set<Id>();
        
        
        for(Payment__c pay:payList){
         List<Payment__c> paynew =   [select id,Customer__c from Payment__c where Customer__c =:pay.Customer__c];
         //   if(pay.IsDeleted==true){
            for(Payment__c newpay:paynew){
                 Id id=newpay.Customer__c;
                ids.add(id);
            }
               
          //  }
        }
        
       List<Payment__c> paymentList=[select Id,Amount__c,Mode__c,Customer__r.Email__c,Customer__r.Name__c from Payment__c where Customer__c in:ids];
          List<Messaging.Email> emails =new List<Messaging.Email>();
        for(Payment__c pay:paymentList){
          Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
            String[] toadd =new String[]{pay.Customer__r.Email__c};
            msg.settoaddresses(toadd);
            msg.setSubject('Payment Delet Info');
            String body='Dear '+pay.Customer__r.Name__c;
            body=body+'<br/> Your Payment Details are <br/> Transaction Amount :'+pay.Amount__c +'<br/>Transaction Mode :'+pay.Mode__c+'<br/> Thanks <br/>Sales Team';
            msg.setHtmlBody(body);
            emails.add(msg);
        }
        Messaging.sendEmail(emails);
        
            
        }
        
        
        
    }