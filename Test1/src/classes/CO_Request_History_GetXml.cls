public class CO_Request_History_GetXml {
    public CO_Request_History__c reqHist{set;get;}
    public String xmlString{set;get;}
    
    public CO_Request_History_GetXml(ApexPages.StandardController controller){
       String[] fields =new String[]{'Case_Number__c','CO_REQ_SEQ__c','DOC_ID__c','Generate_Date__c','History_Switch__c','Indv_Id__c','Program_CD__c'};
            controller.addFields(fields);
        reqHist=(CO_Request_History__c)controller.getRecord();
    }
    
    public void getXML(){
        Dom.Document doc=new Dom.Document();
        Dom.XmlNode root=doc.createRootElement('RICorrespondence', null, null);
        Dom.XmlNode root1=root.addChildElement('AgeOutNotice', null, null);
        Dom.XmlNode child1=root1.addChildElement('CaseNumber', null, null);
        String caseNum=String.valueOf(reqHist.Case_Number__c);
        child1.addTextNode(caseNum);
         Dom.XmlNode child2=root1.addChildElement('CoReqSeq', null, null);
        String coreqseq=String.valueOf(reqHist.CO_REQ_SEQ__c);
        child2.addTextNode(coreqseq);
         Dom.XmlNode child3=root1.addChildElement('DocId', null, null);
      if(reqHist.DOC_ID__c!=null){
            child3.addTextNode(reqHist.DOC_ID__c);
        }
        else{
            child3.addTextNode('');
        }
        
         Dom.XmlNode child4=root1.addChildElement('GenerateDate', null, null);
        String generateDate=String.valueOf(reqHist.Generate_Date__c);
       if(generateDate!=null){
            child4.addTextNode(generateDate);
        }
        else{
            child4.addTextNode('');
        }
        
        Dom.XmlNode child5=root1.addChildElement('HistroySwitch', null, null);
         if(reqHist.History_Switch__c!=null){
           child5.addTextNode(reqHist.History_Switch__c);
        }
        else{
            child5.addTextNode('');
        }
        
        
         Dom.XmlNode child6=root1.addChildElement('Indvid', null, null);
         String indvId=String.valueOf(reqHist.Indv_Id__c);
        if(indvId!=null){
           child6.addTextNode(indvId);
        }
        else{
            child6.addTextNode('');
        }
        
       
         Dom.XmlNode child7=root1.addChildElement('ProgramCd', null, null);
      
        if(reqHist.Program_CD__c!=null){
            child7.addTextNode(reqHist.Program_CD__c);
        }
        else{
            child7.addTextNode('');
        }
       
         
        
        xmlString =doc.toXmlString();
        
    }

}