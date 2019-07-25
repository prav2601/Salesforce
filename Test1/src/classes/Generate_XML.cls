public class Generate_XML {
    public String xmlString{set;get;}
    public Integer repeatVal{set;get;}
    public boolean flag{set;get;}
    public String custName{set;get;}
    public Integer custId{set;get;}
    public String custPolicy{set;get;}
    public String custAddress{set;get;}
    public String custPhone{set;get;}
    public Integer noOfPayment{set;get;}
    public Generate_XML_Wrapper wrapper{set;get;}
    public List<Generate_XML_Wrapper> wrapperList{set;get;}
    
    public Generate_XML(){
        wrapperList=new List<Generate_XML_Wrapper>();
        
    }
    
    public void generateXML(){
        Dom.Document doc=new Dom.Document();
        Dom.XmlNode root=doc.createRootElement('Customer', null,null);
        Dom.XmlNode child1=root.addChildElement('Name',null,null);
        child1.addTextNode(custName);
        Dom.XmlNode child2=root.addChildElement('Id', null,null);
        String cId=String.valueOf(custId);
        child2.addTextNode(cId);
        Dom.XmlNode child3=root.addChildElement('Policy', null,null);
        child3.addTextNode(custPolicy);
        Dom.XmlNode child4=root.addChildElement('Address', null,null);
        child4.addTextNode(custAddress);
        Dom.XmlNode child5=root.addChildElement('Phone', null,null);
        child5.addTextNode(custPhone);
        Dom.XmlNode child6=root.addChildElement('noofPayment', null,null);
        String noOfPay=String.valueOf(noOfPayment);
        child6.addTextNode(noOfPay);
        Dom.XmlNode child8=root.addChildElement('Payments', null,null);
        for(Generate_XML_Wrapper xmlWr:wrapperList){
            Dom.XmlNode child81=child8.addChildElement('Payment', null,null);
        Dom.XmlNode child811=child81.addChildElement('PayAmount',null,null);
        String payAmnt=String.valueOf(xmlWr.payAmount);
        child811.addTextNode(payAmnt);
        Dom.XmlNode child812=child81.addChildElement('Mode',null,null);
        child812.addTextNode(xmlWr.modeOfTransaction);
        }
        
        xmlString=doc.toXmlString();
        
        
        
    }
    
    
    public void addPayment(){
        
   
        Generate_XML_Wrapper wr=new Generate_XML_Wrapper();
        wr.modeOfTransaction=null;
        wr.payAmount=null;
        wrapperList.add(wr);
        
    }
   

}