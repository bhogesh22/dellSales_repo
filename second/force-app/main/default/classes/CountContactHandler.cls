public class CountContactHandler {
    public static void CountContactHelper(List<contact> newcontact, List<contact> oldcontact){
        set<id> accIds= new set<id>();
        if(newcontact != null){
            for(Contact c : newcontact){
                if(c.AccountId!=null){
                    accids.add(c.accountid);
                }
            }      
        }
         
        if(oldcontact != null){
            for(Contact c : oldcontact){
                accids.add(c.accountid);
            }
        }
         
        List<Account> accList = [Select Id, Contacts_count__c, (Select id from Contacts) from Account where Id IN :accIds];
         
        if(accList!=null){
            for(Account acc : accList){
                acc.Contacts_count__c = acc.Contacts.size();
            } 
        }
         
        if(!accList.isEmpty()){
            update accList;
        }
    } 
}