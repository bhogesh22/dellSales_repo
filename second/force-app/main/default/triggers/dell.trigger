trigger dell on Dell_customer__c (before insert) {
 
    if(trigger.isBefore){
        if(trigger.isInsert){
            for(Dell_customer__c dell : trigger.new){
                if(dell.email__c==null){
                    dell.email__c.adderror('email details required');
                }
      }
        }
    }
}