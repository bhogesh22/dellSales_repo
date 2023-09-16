trigger AccountTrigger on Account (before delete,after insert) {
 if(trigger.isdelete) {
        for(account acc : trigger.old){
            if(acc.active_status__c == true) {
                acc.addError('cant process');
                    }
        }
    } 
    if (trigger.isinsert){
list<contact> conList = new list<contact>();
for(account acc:trigger.new){
 contact con= new contact();
con . FirstName=acc . name ;
con . LastName=acc . accountnumber ; 
con . AccountId=acc . Id ;
con . default__c=true;
conList . add(con); 
}
insert conList;
}
}