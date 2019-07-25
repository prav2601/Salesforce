public class Schedule_Delete_Lead implements Schedulable {
    public void execute(SchedulableContext sc){
        List<Lead> lead =[select id from Lead where createddate =TODAY];
        delete lead; 
    }
    
    
}