public class Apex_Account_Contact {
	public String name {set;get;}
    public String phone {set;get;}
    public String rating {set;get;}
    public String industry {set;get;}
    public String lastName {set;get;}
    public String firstName {set;get;}
    public String email {set;get;}
    public List<Account> accounts {set;get;}
    public List<Contact> contact {set;get;}
    public Account acc {set;get;}
    public Contact cont {set;get;}
    
    public Apex_Account_Contact(){
        accounts =new List<Account>();
        contact =new List<Contact>();
        acc=new Account();
        cont=new Contact();
    }
    public void addaccount(){
      acc.Name=name;
        acc.Phone=phone;
        acc.Rating=rating;
        acc.Industry=industry;
        accounts.add(acc);
 }
    public void addcontact(){
        
       cont.FirstName=firstName;
        cont.LastName=lastName;
        cont.Email=email;
        contact.add(cont);
     
         }
}