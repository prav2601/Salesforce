({
    callMe : function(component, event, helper) {
        var name=event.getParam("accName");
        var action=component.get("c.fetchAccount");
        action.setParams({"accname":name});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.acc",result);
            }else{
                console.log('ERROR');
            }
        });
        $A.enqueueAction(action);
}
 })