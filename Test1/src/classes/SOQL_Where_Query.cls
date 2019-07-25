public class SOQL_Where_Query {
    public String accName {set;get;}
    public String accIndustry {set;get;}
    public String query {set;get;}
    public List<Account> accounts {set;get;}
    
    
    
    public void populateData(){
        query='select Name,Industry from Account';
        if(accName!='' && accIndustry!=''){
            query=query+' '+'where Name =\''+ accName +'\''+' '+ 'and Industry=\'' + accIndustry+'\'';
        }
        accounts=Database.query(query);
       // else if (accName!='')
       //     query =query + 'where Name =\''+accName+'\'';
        
      //  else if (accIndustry!='')
        //    query =query +'where Industry=\''+accIndustry +'\'';
        
        
    }
    
}