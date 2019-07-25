public class Schema_Example1 {
    public Map<String,Object> resMap{set;get;}
    public List<String> fieldName {set;get;}
    public Schema_Example1(){
        resMap=new Map<String,Object>();
        Schema.DescribeSObjectResult result=Account.SobjectType.getDescribe();
        resMap.put('Label',result.getLabel());
        resMap.put('Local Name', result.getLocalName());
        resMap.put('Name', result.getName());
                resMap.put('SoBject', result.getSObjectType());
                 resMap.put('Custom',result.isCustom());
        resMap.put('CustomSettings',result.isCustomSetting());
        resMap.put('Read',result.isAccessible());
        resMap.put('Edit',result.isUpdateable());
        resMap.put('Delete',result.isDeletable());
        resMap.put('Undelete',result.isUndeletable());
        resMap.put('Create',result.isCreateable());
        resMap.put('key',result.getKeyPrefix());
        
                
   }
    
    public void getField(){
        Schema.DescribeSObjectResult result=Account.SobjectType.getDescribe();
        Map<String,Schema.SObjectField> fldMap=result.fields.getMap();
        
        
       Set<String> keys =fldMap.keySet();
      // 4. add all the keys to fieldNames list 
      fieldName=new List<String>(keys);
    }
    
    public void getChild(){
        
    }

}