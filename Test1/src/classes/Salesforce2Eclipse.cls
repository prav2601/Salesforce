public Class Salesforce2Eclipse{
    public void printHello(){
        List<Contact> con=[select id, name from Contact];
    }
}