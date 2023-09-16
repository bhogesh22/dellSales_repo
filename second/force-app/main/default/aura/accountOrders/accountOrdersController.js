({
    init: function(component, event, helper) {
        component.set('v.OrderColumns',[
            {label : 'order Id', fieldName: 'name',type: 'text'},
            {label : 'order amount', fieldName: 'total Amount',type: 'number'},
            {label : 'created date', fieldName: 'EffectiveDate',type: 'date'}
        ]);
        
        console.log('accId >>>' + component.get('v.recordId'));
        var action = component.get("c.getRelatedOrders");
        console.log('action >>>' + action);
        action.setParams({
            accId:component.get('v.recordId')
        });
        action.setCallback(this, function(responce){
            console.log('response >>>' + responce.getReturnValue());
            if(responce.getState() === 'SUCCESS'){
                component.set('v.OrdersData',responce.getReturnValue());
            }else{
                console.log('Transaction failed');
                
            }
        })
        $A.enqueueAction(action);
        
    }
})