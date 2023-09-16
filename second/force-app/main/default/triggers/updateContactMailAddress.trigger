trigger updateContactMailAddress on Account (before insert) {
    for(account acc1 : Trigger.new){
        account acc2 = Trigger.oldMap.get(acc1.Id);
        contact con;
        if(acc1.BillingStreet != acc2.BillingStreet && acc1.BillingCIty != acc2.BillingCity && acc1.BillingState != acc2.BillingState && acc1.BillingCountry != acc2.BillingCountry && acc1.BillingPostalCode != acc2.BillingPostalCode)
        {
            acc1.BillingStreet = con.MailingStreet; 
            acc1.BillingCIty = con.MailingCity ;
            acc1.BillingState = con.MailingState;
            acc1.BillingCountry = con.MailingCountry; 
            acc1.BillingPostalcode = con.MailingPostalCode;
        }
        
    }
}