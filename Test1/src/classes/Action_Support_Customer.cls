public class Action_Support_Customer {
    public List<SelectOption> custOptions {set;get;}
    public Map<String,List<String>> custMap{set;get;}
    public String selected {set;get;}
    public List<Customer__c> customers{set;get;}
    public List<SelectOption> payOptions{set;get;}
    public String paySelected{set;get;}
    public Payment__c payment{set;get;}
    public boolean flag{set;get;}
    
    
    
    
    public Action_Support_Customer(){
        flag=false;
        custOptions=new List<SelectOption>();
        payOptions=new List<SelectOption>();
        custMap=new Map<String,List<String>>();
        SelectOption op=new SelectOption('none','-None-');
        custOptions.add(op);
        payOptions.add(op);
        
        
        customers=[SELECT Name,(select Name from Payment__r) from  Customer__c];
       for(Customer__c cust:customers){
           List<String> payL=new List<String>();
                for(Payment__c pay:cust.Payment__r){
                	payL.add(pay.Name);
          }
            
            if(payL.size()>0){
                custMap.put(cust.Name, payL);
            }
            else{
                payL.add('none');
                custMap.put(cust.Name,payL);
                  
            }
        }
        Set<String> key=custMap.keySet();
        for(String s:key){
            SelectOption opt=new SelectOption(s,s);
            custOptions.add(opt);
            system.debug(s);
        }
    }
    
    
    public void paymentDetails(){
        flag=false;
        payOptions.clear();
        SelectOption n =new SelectOption('none','-None-');
        payOptions.add(n);
        
        if(selected!='none'){
            List<String> p=custMap.get(selected);
           	
            for(String s:p){
                SelectOption opty=new SelectOption(s,s);
            payOptions.add(opty);
            }
            
        }
    }
    
    public void showPayment(){
        flag=true;
        if(paySelected!='none'){
             payment=[select Name,Mode__c,Amount__c from Payment__c where Name=:paySelected];
        }
        else{
            flag=false;
        }
    }

}