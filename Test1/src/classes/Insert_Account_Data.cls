public class Insert_Account_Data {
    public List<Account> listOfaccount{set;get;}
    public Blob csvfile{set;get;}
    public List<String> csvfileSplit;
    public List<String> listfieldValue{set;get;}
    public Boolean flag{set;get;}
    public Map<String, Integer> listfieldMap;
     String csvread;
    Account acc;
    String fieldValue;
    Integer fieldName;
    
    
    public Insert_Account_Data(){
        listOfaccount=new List<Account>();
        csvfileSplit=new List<String>();
        listfieldValue=new List<String>();
        listfieldMap=new Map<String,Integer>();
        flag=false;
    }    
    public void readFile(){
       csvread=csvfile.toString();
        readcsvFile();
    }
    
    public void readcsvFile(){
        flag=true;
        listOfaccount.clear();

      csvfileSplit=  csvread.split('\n');
        String[] csvFieldName=csvfileSplit[0].split(',');
        for(Integer i=0;i<csvFieldName.size();i++){
            listfieldMap.put(csvFieldName[i], i);
            listfieldValue.add(csvFieldName[i].trim());
        }
        for(Integer i=1;i<csvfileSplit.size();i++){
                   acc =new Account();
            string[] csvrecordData=csvfileSplit[i].split(',');
            for(String csvData:csvFieldName){
                fieldName=listfieldMap.get(csvData);
                fieldValue=csvrecordData[fieldName];
                acc.put(csvData.trim(),fieldValue.trim());
            }
            listOfaccount.add(acc);
        }
        
        
        
    }
    
    public void saveData(){
        insert listOfaccount;
        Apexpages.Message msg= new Apexpages.Message(Apexpages.Severity.CONFIRM,'Record got inserted successfully');
        Apexpages.addMessage(msg);
    }
    
   
        
  

}