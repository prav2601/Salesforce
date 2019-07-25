public class Exstream_EWS_Salesforce {
    public String xmlString{set;get;}
    
    public String engineMsg{set;get;}
    public String custName {set;get;}
    public String company{set;get;}
    public String filterXML {set;get;}
    public String output{set;get;}
    public blob test{set;get;}
    
    
    public void generateXML(){
        Dom.Document doc=new Dom.Document();
        dom.XmlNode root=doc.createRootElement('Customer', null,null);
        
        
        
        dom.XmlNode child1= root.addChildElement('Name', null, null);
        child1.addTextNode(custName);
 
        dom.XmlNode child2=root.addChildElement('Company', null,null);
 	    child2.addTextNode(company);
        xmlstring = doc.toXmlString();
     filterXML=   xmlString.substringAfter('UTF-8"?>');
        
        
       
 
    }
    public void callEngineService(){
        
            hpexstreamServicesEngine.engineOption eo = new hpexstreamServicesEngine.engineOption();
        eo.name='RUNMODE';
        eo.value='LOCAL';
        hpexstreamServicesEngine.driverFile df = new hpexstreamServicesEngine.driverFile();
        df.driver='<![CDATA['+filterXML+']]>';
        system.debug(df.driver);
        df.fileName='DD:Input';
        hpexstreamServicesEngine.ewsComposeRequest ecr = new hpexstreamServicesEngine.ewsComposeRequest();
        ecr.driver=df;
        ecr.driverEncoding='UTF-8';
        ecr.includeHeader=true;
        ecr.includeMessageFile=true;
        ecr.engineOptions = new hpexstreamServicesEngine.engineOption[]{eo};
            ecr.pubFile='Salesforce.pub';
        hpexstreamServicesEngine.EngineServicePort esp = new hpexstreamServicesEngine.EngineServicePort();
        hpexstreamServicesEngine.ewsComposeResponse response = esp.compose(ecr);
        hpexstreamServicesEngine.engineOutput e=response.files[0];
        engineMsg=response.engineMessage;
        output=e.fileOutput;
       test= EncodingUtil.base64Decode(output);
        Document a=new Document();
        a.FolderId='00l6F000003Kcw1';
        a.Name='ABC.pdf';
        a.Body=test;
        insert a;
        
        
    }
    
    
}