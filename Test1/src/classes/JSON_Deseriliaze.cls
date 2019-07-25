public class JSON_Deseriliaze {
    public String jsonToString;
    
    
    public JSON_Deseriliaze(){
        jsonToString='{"status":"Success","Code":200,"student":[{"name":"Praveen","Gender":"M"},{"name":"Priyanka","Gender":"F"}]}';
        JSONParser jp=JSON.createParser(jsonToString);
        while(jp.nextToken()!=null){
            if(jp.getText()=='status'){
                jp.nextToken();
                if(jp.getText()=='Success'){
                    while(jp.nextToken()!=null){
                        if(jp.getText()=='Student'){
                            jp.nextToken();
                           List<Student__c> students =(List<Student__c>)jp.readValueAs(List<Student__c>.class);
                			System.debug('Students===>'+students);
                        }
                    }
                }
            }
        }
    }

}