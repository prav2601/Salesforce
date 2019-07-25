({
	callMe : function(component, event, helper) {
		var name=event.getParam('name');
        component.set("v.parentName",name);
	}
})