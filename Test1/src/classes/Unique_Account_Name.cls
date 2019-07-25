public class Unique_Account_Name {
    public Map<ID,List<Opportunity>> oMap {set;get;}
    public List<Opportunity> opty {set;get;}
    
    public Unique_Account_Name(){
        oMap=new Map<ID,List<Opportunity>>();
        fetchOpportunity();
        for(Opportunity op:opty){
           	  if(op.Account.Name=='Edge Communications' || op.Account.Name=='GenePoint')
              {
                Boolean flag=oMap.containsKey(op.AccountId);
                if(flag==false){
                    List<Opportunity> o=new List<Opportunity>();
                    o.add(op);
                    oMap.put(op.AccountId, o);
                }
                else{
                    List<Opportunity> o=oMap.get(op.AccountId);
                    o.add(op);
                    oMap.put(op.AccountId, o);
                    
                }  
          }  
        }
    }
    
    public void fetchOpportunity(){
        opty=new List<Opportunity>();
        opty=[select Account.Name,Name from  Opportunity];
        for(Opportunity o:opty)
        {
            System.debug(o);
        }
    }
    
}