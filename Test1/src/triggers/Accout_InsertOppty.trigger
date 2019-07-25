trigger Accout_InsertOppty on Account (after insert) {
  public   List<Account> accList {set;get;}
    
    public void Accout_InsertOppty(){
        accList=Trigger.New;
        for(Account acc:accList){
            if(acc.Industry=='Energy' && acc.Type=='Other'){
                Opportunity op=new Opportunity();
                op.AccountId=acc.Id;
                op.Name='New Opp';
                op.CloseDate=system.today();
                op.StageName='Closed-Won';
                insert op;
            }
        }
    }
}