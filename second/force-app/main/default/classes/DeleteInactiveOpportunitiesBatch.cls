global class DeleteInactiveOpportunitiesBatch implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Define your SOQL query to select opportunities that meet the criteria
        String query = 'SELECT Id,Created_Date__c FROM Opportunity WHERE Created_Date__c < LAST_N_DAYS:30 ' +
                       'AND Id  IN (SELECT OpportunityId FROM OpportunityLineItem)';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Opportunity> scope) {
        // Delete the selected opportunities
        delete scope;
    }

    global void finish(Database.BatchableContext BC) {
        // Perform any post-processing logic if needed
    }
}