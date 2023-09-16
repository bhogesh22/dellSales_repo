({
	setEventParam : function(component, event, helper) {
		var cdata = component.get('v.data');
        var appEvent = $A.get("e.c:E_ae");
        appEvent.setParams({
            "message" : cdata
        });
        appEvent.fire();
	}
})