({
	getEventParam : function(component, event, helper) {
		var EvtMsg = event.getParam("message");
        component.set('v.ParentText',EvtMsg);
	}
})