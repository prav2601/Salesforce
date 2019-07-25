public class Account_List {
    public List<Account> accounts {set;get;}
    
    public Account_List(){
        accounts=[select Name,Phone,Type from Account];
    }
}