global class updateAccountBatch implements Database.Batchable<sObject> {
    
   global Database.QueryLocator start(Database.BatchableContext BC) {
             String query = 'select id,name,prime_account__c,numberofemployees from account';
             return Database.getQueryLocator(query);
}
    
        global void execute(Database.BatchableContext BC, List<account> acclist) {
        list<account> accUpdateList = new list<account>();
         for(account acc : acclist) {
         if(acc.numberofemployees>100) {
               acc.prime_account__c = true;
         }
         
               accUpdateList.add(acc);
         }
    
     if(accUpdateList.size()>0) Update accUpdateList;
  }
    
     global void finish (Database.BatchableContext BC) {
         // notification
        }
}