public with sharing class AccountController02 {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountData() {
        return [SELECT Id, Name, Phone,AccountNumber, AnnualRevenue, contacts_count__c FROM Account ];
    }
}