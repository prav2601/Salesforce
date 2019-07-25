public class XML_Examples {
    
    public String xmlstring {set;get;}
    public XML_Examples(){
        Dom.Document doc=new Dom.Document();
        Dom.XmlNode root=doc.createRootElement('HealthCoverageDetails',null, null);
        Dom.XmlNode child1=root.addChildElement('displayFlag', null, null);
        child1.addTextNode('true');
        Dom.XmlNode child2=root.addChildElement('healthCoverageAppDate', null, null);
        child2.addTextNode('12/03/2019');
        Dom.XmlNode child3=root.addChildElement('HealthCoverageStaticSection',null, null);
        Dom.XmlNode child31=child3.addChildElement('individualName', null, null);
        child31.addTextNode('Praveen Srivastav');
        Dom.XmlNode child32=child3.addChildElement('medicaidId', null, null);
        child32.addTextNode('Praveen Srivastav');
        Dom.XmlNode child33=child3.addChildElement('individualElgDetails', null, null);
        Dom.XmlNode child331=child33.addChildElement('benefitPeriod', null,null);
        child331.addTextNode('31/09/2019');
        Dom.XmlNode child332=child33.addChildElement('benefitName', null,null);
        child332.addTextNode('Priyanka');
        Dom.XmlNode child333=child33.addChildElement('Decision', null,null);
        child333.addTextNode('Aprroved');
        Dom.XmlNode child334=child33.addChildElement('relevantAmt', null,null);
        child334.addTextNode('345');
        Dom.XmlNode child34=child3.addChildElement('individualElgDetails', null, null);
        Dom.XmlNode child341=child34.addChildElement('benefitPeriod', null,null);
        child341.addTextNode('31/09/2019');
        Dom.XmlNode child342=child34.addChildElement('benefitName', null,null);
        child342.addTextNode('Priyank SOn');
        Dom.XmlNode child343=child34.addChildElement('Decision', null,null);
        child343.addTextNode('Aprroved');
        Dom.XmlNode child344=child34.addChildElement('relevantAmt', null,null);
        child344.addTextNode('345');
        xmlstring=doc.toxmlString();
        
    }

}