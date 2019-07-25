public class JSON_CreateGenerator_Example {
	
    List<Account> accountList=[select Name,Phone from Account];
   
    
    
    
    public  void JSONCreator(){
        JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        
        
        js.writeStartObject();
       js.writeFieldName('Accounts');
        js.writeStartArray();
        
        js.writeStartObject();
        js.writeFieldName('Account');
            js.writeStartObject();
            js.writeStringField('Name','Praveen');
            js.writeStringField('Phone','80966546');
            js.writeNumberField('EmpId',100);
            js.writeEndObject();
       js.writeEndObject();
        js.writeStartObject();
        js.writeFieldName('Account');
            js.writeStartObject();
            js.writeStringField('Name','SHubham');
            js.writeStringField('Phone','80966546234');
            js.writeNumberField('EmpId',102);
            js.writeEndObject();
       js.writeEndObject();
        js.writeStartObject();
        js.writeFieldName('Account');
            js.writeStartObject();
            js.writeStringField('Name','Priyanka');
            js.writeStringField('Phone','80966425');
            js.writeNumberField('EmpId',101);
            js.writeEndObject();
       js.writeEndObject();
        js.writeEndArray();
        js.writeEndObject();
 }
    
    public void createJSONusingLoop(){
        JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        js.writeFieldName('RICorrespondence');
        js.writeEndObject();
       js.writeStartObject();
        js.writeFieldName('Metadata');
        js.writeStartObject();
        js.writeStringField('TemplateID', 'IES-IES669');
        js.writeStringField('noticeTitle', 'Medicaid Termination Notice');
        js.writeStringField('MailCentre Details', 'DHS');
        js.writeStringField('BarcodeTemplateID', 'COREN-IES-IES669');
        js.writeEndObject();
        js.writeEndObject();
        Js.writeStartObject();
        js.writeFieldName('CorrespondenceRequest');
        js.writeStartObject();
        js.writeFieldName('TemplateMetadata');
        js.writeStartObject();
        js.writeStringField('NoticeTemplateID', 'OR-ENR-05 (Rev.12/21/2016) RI UHIP IES');
        js.writeStringField('LanguageCd', 'EN');
        js.writeStringField('caseAppNumber', '548588');
        js.writeStringField('caseAppFlag', 'A');
        js.writeStringField('printMode', 'O');
        js.writeStringField('attachBabelPageFlag', 'true');
        js.writeStringField('dhs121TemplateID', 'Form Number: OHHS - 121 Revised 11/29/2016');
        js.writeEndObject();
        js.writeEndObject();
        
        js.writeFieldName('HeaderFooterInfo');
        js.writeStartObject();
        js.writeStringField('Date', '12/12/2019');
        js.writeStringField('CaseNumber', '1234');
        js.writeStringField('caseAppNumber', '446');
        js.writeStringField('CorrespondenceNumber', '123436');
        js.writeFieldName('ReturnAddress');
        js.writeStartObject();
        js.writeStringField('AddressLine1', 'P.O. BOX 8709');
        js.writeStringField('AddressLine2', 'CRANSTON, RI 02920-8787');
        js.writeStringField('AddressLine3', '');
        js.writeStringField('OfficeName', 'STATE OF RHODE ISLAND');
        js.writeEndObject();
        js.writeStringField('HtcuOnline', 'www.healthyrhode.ri.gov');
        js.writeStringField('HtcuOnline1', 'www.eohhs.ri.gov');
        js.writeStringField('HtcuByPhone', '(855) 712-9158');
        js.writeFieldName('HtcuAddress');
        js.writeStartObject();
        js.writeStringField('AddressLine1', 'P.O. BOX 8709');
        js.writeStringField('AddressLine2', 'CRANSTON, RI 02920-8787');
       js.writeStringField('OfficeName', 'STATE OF RHODE ISLAND');
        js.writeEndObject();
        js.writeStringField('HtcuByPerson','http://www.dhs.ri.gov/tabid/835/Default.aspx');
        js.writeStringField('HtcuHsriOnlyText', 'For questions about affordable health coverage, call HealthSource RI at 1-855-840-4774');
        js.writeStringField('MCINumber', '108659');
        js.writeFieldName('AppealRightsCommonType');
        js.writeStartObject();
        js.writeStringField('ArOnlineUrlAddress', 'www.HealthSourceRI.com');
        js.writeStringField('ArphoneNumber', '(855) 712-9158');
        js.writeStringField('ArAddressForMailOrFax', 'HZD MAILROOM,74 WEST ROAD STE 700,CRANSTON RI 02920-8411');
        js.writeEndObject();
        js.writeStringField('NoticeIndicator', 'MT');
        js.writeStringField('BablePhone', '342356');
            
        js.writeEndObject();
        js.writeFieldName('RecipientInfo');
        js.writeStartObject();
        js.writeStringField('RecipientName', 'Gqamjymopdjlqr BFCFBECDEDFCAFDDABDA');
        js.writeFieldName('RecipientAddress');
        js.writeStartObject();
        js.writeStringField('AddressLine1', '9 Yale Ave');
        js.writeStringField('AddressLine1', 'Providence, RI 02908');
       js.writeEndObject();
        js.writeStringField('RecipientType', 'HOH');
        js.writeEndObject();
        js.writeEndObject();
         // js.writeEndObject();
     
        
       js.writeStartObject();
        js.writeFieldName('Accounts');
         js.writeStartArray();
        for(Account acc:accountList){
            js.writeStartObject();
            js.writeFieldName('Account');
            js.writeStartObject();
            js.writeStringField('Name', acc.Name);
            js.writeStringField('Phone',acc.Phone);
           
            js.writeEndObject();
            js.writeEndObject();
            
        }
       
        js.writeEndArray();
        js.writeEndObject();
        String result=js.getAsString();
        System.debug(result);
    }
    
}