public class Project1_Lead_Custom_Page {
    public Lead lead{set;get;}
    public ApexPages.StandardController stdcontroller;
    public AssignmentRule AR{set;get;}
    
    public Project1_Lead_Custom_Page(ApexPages.StandardController controller){
        stdcontroller=controller;
       this.lead=(Lead)controller.getRecord();
        //fetch the assignment rule 
        AR =new AssignmentRule();
        AR=[SELECT Active,Id,Name FROM AssignmentRule where Name='New Lead'];
        
    }
    
    public PageReference saveAll(){
     
        //The Database.DMLOptions class can provide extra information during a transaction; 
        //for example, specifying the truncation behaviour of fields or assignment rule information
        if(this.lead.Email==''){
        Apexpages.Message ap=new Apexpages.Message(Apexpages.Severity.ERROR,'Email Field should not be blank');
            Apexpages.addMessage(ap);
        }
        Database.DMLOptions dml=new Database.DMLOptions();
        dml.AssignmentRuleHeader.assignmentRuleId=AR.Id;
        lead.setOptions(dml);
            insert lead;
        
        
		return new PageReference('/'+lead.Id);       
    }
    
    public PageReference saveNew(){
        Database.DMLOptions dml=new Database.DMLOptions();
        dml.AssignmentRuleHeader.assignmentRuleId=AR.Id;
        lead.setOptions(dml);
            insert lead;
       
		PageReference p=new PageReference('/apex/Project1_Lead_Custom_Page?retURL=%2F00Q%2Fo&save_new=1&sfdc.override=1');
        p.setRedirect(true);
        return p;
    }
    
     

}