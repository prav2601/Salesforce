public class Retrieve_Leads_Data {
    public List<Lead> leads {set;get;}
    public Lead lead {set;get;}
    public String email {set;get;}
    public String company {set;get;}
    public Retrieve_Leads_Data()
    {
        leads=new List<Lead>();
        lead=new Lead();
       // add();
    }
    public void add(){
        //lead.Name='Deepak';
        lead.Email=email;
        lead.Company=company;
        leads.add(lead);
    }
}