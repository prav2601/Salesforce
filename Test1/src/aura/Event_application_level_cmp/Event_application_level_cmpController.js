({
	call : function(component, event, helper) {
        var name=component.get("v.searcText");
        var event=$A.get("e.c:Event_application_level");
        event.setParam({"accName":name});
        event.fire();
		
	}
})