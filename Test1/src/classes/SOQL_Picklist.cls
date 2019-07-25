public class SOQL_Picklist {
    public Integer noOfRecords {set;get;}
    public List<Account> account {set;get;}
    
    public SOQL_Picklist(){
        account =[select Id,Name,Phone from Account ALL ROWS];
    }
    
    public void DataRepeat(){
        
        account =[select Id,Name,Phone from Account limit:noOfRecords];
    }
}