public class XMLCreation {
    public String xmlString{set;get;}
    Course__c course;
    
    public XMLCreation(){
        course=new Course__c();
        Integer i;
        Dom.Document doc=new dom.Document();
       Dom.XmlNode root=doc.createRootElement('CorrespondenceRequest', null, null);
        for(i=0;i<=5;i++){
            
       
        Dom.XmlNode child=root.addChildElement('AgeOutNotice', null,null);
        Dom.XmlNode child1=child.addChildElement('individualFirstName', null, null);
        child1.addTextNode('Praveen');
        Dom.XmlNode child2=child.addChildElement('individualLastName', null, null);
        child2.addTextNode('Srivastav');
             }
        xmlString=doc.toXmlString();
        course.Contact_Person__c='Praveen';
        course.Course_Start_Date__c=system.today();
        course.Course_Intake_Stage__c=60;
        course.XmlString__c=xmlString;
    }
    
    public void insertData(){
        insert course;
    }

}