global class  UpdateVipCustomerBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {

         

    Id devRecordTypeId = Schema.SObjectType.lead.getRecordTypeInfosByName().get('new1').getRecordTypeId();
        
        
        String query = 'SELECT Id, email__c, vip_customer__c FROM Dell_customer__c WHERE CreatedDate >= 2020-01-21T00:00:00Z';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Dell_customer__c> scope) {
        Set<String> uniqueEmails = new Set<String>();
        

        for (Dell_customer__c dell : scope) {
            if (!uniqueEmails.contains(dell.email__c)) {
                uniqueEmails.add(dell.email__c);
                dell.vip_customer__c = true; 
            }
        }
        
        update scope; 
    }
    
    global void finish(Database.BatchableContext BC) {

    }
}