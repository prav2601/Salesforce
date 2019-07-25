({
	invoke : function(component, event, helper) {
        var value=component.getEvent('myEvent');
        value.setParams({'name': 'Praveen Srivastav'});
        value.fire();
		
	}
})