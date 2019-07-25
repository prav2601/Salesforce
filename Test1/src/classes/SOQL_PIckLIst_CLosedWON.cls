public class SOQL_PIckLIst_CLosedWON {
     
    public List<Opportunity> opty {set;get;}
    String name ='closed Won';
    
    public SOQL_PIckLIst_CLosedWON(){
        opty =[select name,stageName, Amount from Opportunity where stageName=:name ];
    }

}