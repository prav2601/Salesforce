({
	call : function(component, event, helper) {
        var result=component.get("c.getAccount");
        result.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var setvalue=response.getReturnValue();
                component.set("v.accounts",setvalue);
            }
            
        });
        $A.enqueueAction(result);
		
	}
})