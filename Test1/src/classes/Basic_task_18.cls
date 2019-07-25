global class Basic_task_18 implements Database.Batchable<sobject> {
    global  Database.QueryLocator start(Database.BatchableContext bc){
        String query='select Id,Name,OwnerID from Account where Ownerid in (select Id from User where profile.name='+ '\''+'System Administrator'+'\''+')';
           return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<Account> scope){
        List<Account> acclist=new List<Account>();
        User u=[select Id,Name from User where profile.Name='Clerk'];
        for(Account acc:scope)
        {
            acc.ownerId=u.Id;
            acclist.add(acc);
        }
        update acclist;
        
    }
    global void finish(Database.BatchableContext bc){
        
    }
    
    
    

}