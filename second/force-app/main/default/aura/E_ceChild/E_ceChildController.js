({
	setEventParam : function(component, event, helper) {
		var cdata = component.get('v.data');
        var cmpEvent = component.getEvent("CmpEvent");
        cmpEvent.setParams({
            "message" : cdata
        });
        cmpEvent.fire();
	}
})