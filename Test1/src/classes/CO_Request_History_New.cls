public class CO_Request_History_New {
    public boolean flag{set;get;}
    
    public CO_Request_History__c coreq{set;get;}
    public Double caseNum {set;get;}
    public Double coreqseq{set;get;}
    public String docId{set;get;}
    public String generateDate {set;get;}
    public String historySwitch {set;get;}
    public Integer indvid {set;get;}
    public String programCd {set ;get;}
   
    
    public CO_Request_History_New(){
        coreq=new CO_Request_History__c();
        
    }

    
    public PageReference saveAll(){
        
        coreq.Case_Number__c=caseNum;
        coreq.CO_REQ_SEQ__c=coreqseq;
        coreq.DOC_ID__c=docId;
        coreq.Generate_Date__c=system.today();
        coreq.History_Switch__c=historySwitch;
        coreq.Indv_Id__c=indvid;
        coreq.Program_CD__c=programCd;
        insert coreq;
        
        PageReference ref=new PageReference('/'+coreq.Id);
       ref.setRedirect(true);
        return ref;
        
    }
    public void reset(){
        caseNum=null;
        coreqseq=null;
        docId=null;
        generateDate='';
        historySwitch='';
        indvid=null;
        programCd=null;
        
    }
}