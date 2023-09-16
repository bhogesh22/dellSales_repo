public class AccountController {
   public static map<id, contact> getAllAccounts(){
map<id,contact> mapAcc= new map<id,contact>();
       for(account acc: [select id, name, (select id,name from contacts) from account]){
mapAcc.put(acc.Id,acc.contacts);
       }
return mapAcc;
    }
    }