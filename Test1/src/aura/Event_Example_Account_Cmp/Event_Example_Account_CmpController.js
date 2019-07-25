({
	invoke : function(component, event, helper) {
		var name=component.find("name").get("v.value");
        var phone=component.find("phone").get("v.value");
        var rating=component.find("rating").get("v.value");
        var action=component.get("c.createAccount");
        action.setParams({"name":name,"phone":phone,"rating":rating});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result;
                result=response.getReturnedValue;
                
                if(result=='DML Execption'){
                    alert('DML Failed');
                }
                else{
                    alert('Account inserted');
                    
                }
            }
        })
        $A.enqueueAction(action);
	}
    
})