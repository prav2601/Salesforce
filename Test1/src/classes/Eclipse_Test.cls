public with sharing class Eclipse_Test {
	
	public void fetch(){
		List<Account> acc=[select id, name from Account];
	}
    
}