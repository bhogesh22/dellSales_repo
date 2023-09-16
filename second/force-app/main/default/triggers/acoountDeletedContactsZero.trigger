trigger acoountDeletedContactsZero on Contact (after delete) {
    set<id> accid = new set<id>();
    for (contact co :trigger.old){
        accid.add(co.accountId);
    } 
    list<contact> conlist = [select id, name from contact where AccountId In:accid];
    if(conlist.size()<=0)
    {
        Account ac = [select Id,name from account where id IN:accid ];
        delete ac;
        
    }
}