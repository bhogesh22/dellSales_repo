trigger caseTrigger on Case (before insert) {
set<id> accSet = new set<id>();
 if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
for(case con:trigger.new){
accSet.add(con.accountId);
}
    }
if(trigger.isDelete) {
for(case con:trigger.old){
accSet.add(con.accountId);
}
}
list<account> accList = [select id,name,contacts_count__c,(select id from cases)from account where id IN:accset];
list<account> accUpdateList = new list<account>();
for(account acc:accList){
acc.contacts_count__c = acc.cases.size();
accUpdateList.add(acc) ;
}
Update accUpdateList;
}