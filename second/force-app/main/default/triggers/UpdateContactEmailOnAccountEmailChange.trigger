trigger UpdateContactEmailOnAccountEmailChange on Account (after update) {
    // Collect all Account IDs whose email has been updated
    Set<Id> updatedAccountIds = new Set<Id>();
    for (Account updatedAccount : Trigger.new) {
        Account oldAccount = Trigger.oldMap.get(updatedAccount.Id);
        if (oldAccount.email__c != updatedAccount.email__c) {
            updatedAccountIds.add(updatedAccount.Id);
        }
    }
    
    if (!updatedAccountIds.isEmpty()) {
        List<Contact> contactsToUpdate = new List<Contact>();
        
        // Query related Contacts with their Account IDs
        for (Contact relatedContact : [SELECT Id, Email, AccountId FROM Contact WHERE AccountId IN :updatedAccountIds]) {
            relatedContact.Email = Trigger.newMap.get(relatedContact.AccountId).email__c;
            contactsToUpdate.add(relatedContact);
        }
        
        // Update the Contacts
        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
        }
    }
}