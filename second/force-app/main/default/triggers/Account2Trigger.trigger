Trigger Account2Trigger on Account(after insert, after update, after delete, after undelete){
     if (trigger.isinsert || trigger.isupdate){
list<contact> conList = new list<contact>();
list<emailMessage> emailList = new list<emailMessage>();
for(account acc:trigger.new){ 
contact con= new contact();
con . FirstName=acc . name ;
con . LastName=acc . accountnumber ;
con . Accountid=acc . Id;
conList . add(con);
emailMessage msg = new emailMessage();
msg.Subject= ' Account Creation ' ;
msg.TextBody=' An account has been created successfully' ;
 msg.ToAddress= acc.email__c; 
     emailList.add(msg) ; 
}
insert conList;
insert emailList;
}
    }