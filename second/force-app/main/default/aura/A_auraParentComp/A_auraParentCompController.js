({
    callAuraMethod : function(component, event, helper) {
        var childCmp = component.find("childComponent");
        var returnMsg = childCmp.GetMessageFromChild();
        component.set("v.parentAttribute",returnMsg);
    }
})