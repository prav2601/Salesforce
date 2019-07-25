public class Lead_Assignment_rule {
    
    public Lead_Assignment_rule(){
        Lead ld=new Lead();
        ld.City='Delhi';
        ld.Email='alead@gmail.com';
        ld.LastName='Parker';
        ld.Company='Wipro';
        ld.Status='Open';
        insert ld;
        system.debug(ld);
    }

}