({
	handleClick : function(component, event, helper) {
        var payload = {
            messageOne: component.get('v.message')
        };
        component.find("bmc").publish(payload);
	}
})