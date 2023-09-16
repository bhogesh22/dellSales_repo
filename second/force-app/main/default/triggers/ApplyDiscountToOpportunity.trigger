trigger ApplyDiscountToOpportunity on OpportunityLineItem (after insert, after update) {
// Map to hold Opportunity Ids and their corresponding line item count
Map<Id, Integer> opportunityLineItemCountMap = new Map<Id, Integer>();

// Collect Opportunity Ids and count line items
for (OpportunityLineItem oli : Trigger.new) {
    if (!opportunityLineItemCountMap.containsKey(oli.OpportunityId)) {
        opportunityLineItemCountMap.put(oli.OpportunityId, 1);
    } else {
        opportunityLineItemCountMap.put(oli.OpportunityId, opportunityLineItemCountMap.get(oli.OpportunityId) + 1);
    }
}

// Calculate and apply discounts
List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
for (Id oppId : opportunityLineItemCountMap.keySet()) {
    Opportunity opp = new Opportunity(Id = oppId);
    Integer lineItemCount = opportunityLineItemCountMap.get(oppId);
    Decimal discountPercentage = null;
    
    if (lineItemCount == 1) {
        discountPercentage = 0.1;
    } else if (lineItemCount == 2) {
        discountPercentage = 0.2;
    } else if (lineItemCount >= 3) {
        discountPercentage = 0.3;
    }
    
    // Calculate the final price after discount
    Decimal finalPrice = opp.Amount * (1 - discountPercentage);
    opp.Final_Price__c = finalPrice;
    
    opportunitiesToUpdate.add(opp);
}

// Update Opportunities with final price
update opportunitiesToUpdate;
}