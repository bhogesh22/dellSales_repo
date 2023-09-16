trigger PopulateShippingAddress on Account (before insert,before update) {
    for (Account acc : Trigger.new) {
        acc.ShippingStreet = acc.BillingStreet;
        acc.ShippingCity = acc.BillingCity;
        acc.ShippingState = acc.BillingState;
        acc.ShippingCountry = acc.BillingCountry;
        
    }
}