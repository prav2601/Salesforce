public class Co_Request_History {
    public boolean flag {set;get;}
    public boolean flag1 {set;get;}
    public String option {set;get;}
    public List<CO_Request_History__c> co_req_hist {set;get;}
    
    public Co_Request_History(){
        flag=false;
        flag1=false;
    }
    
    
    public PageReference callCorrespondence(){
        if(option=='Correspondence'){
            flag=true;
            PageReference p = new PageReference('/apex/Co_Request_History');
            p.setRedirect(true);
            return p;
        }
        else{
            flag=false;
            return null;
        }
        
    }
    
    public void go(){
        flag1=true;
        
        co_req_hist=[select Id,Case_Number__c,CO_REQ_SEQ__c,DOC_ID__c,Indv_Id__c from CO_Request_History__c ];
    }
    
    public PageReference returnViewPage(){
        
             PageReference ref=new PageReference('https://opentextexstream-dev-ed.my.salesforce.com/');
        return ref;
       }
       
    
    
    
    
}