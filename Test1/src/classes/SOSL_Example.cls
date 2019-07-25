public class SOSL_Example {
    public List<Account> account{set;get;}
    public List<Contact> contact {set;get;}
    public List<String> accfield {set;get;}
    public List<String> confield {set;get;}
    
    public SOSL_Example(){
        List<List<Sobject>> result=[FIND 'Andy' IN ALL FIELDS RETURNING Account(Name,Industry), Contact(firstName,lastName,department)];
        account=result[0];
        contact=result[1];
        accfield=new List<String>{'name','industry'};
            confield=new List<String>{'firstName','lastName','department'};  
    }
}