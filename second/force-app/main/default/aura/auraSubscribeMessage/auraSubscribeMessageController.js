({
	handleMessage: function(component, event, helper) {
        if (event != null && event.getParams() !=null) {
            let params = event.getParams();
            var resp = JSON.stringify(params);
            var respMsgOne = (JSON.parse(resp)).messageOne;
            component.set("v.subscriberMsg",respMsgOne);
        }
	}
})