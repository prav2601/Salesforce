public class SOQL_Account_Case {
    public List<Account> accounts {set;get;}
    public List<Case> cases {set;get;}

    public SOQL_Account_Case(){
        accounts=[select Name,Phone, (select Origin,Reason from Cases) from Account];
    }
}