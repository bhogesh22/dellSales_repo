@isTest
public class updateAccountBatchTest {
@isTest
 public static void testExecutionSuccess(){
// 1. Create bulk accounts
list<account> accList = new list<account>();
     for(integer i=0;i<5;i++){
 account acc = new account();
acc.name=' TestAccount  ' ;
acc.Phone= ' 768768768 ' +i;
acc.NumberOfEmployees=120;
acc.AccountNumber= ' 7686987987 ' +i;
accList.add(acc);
     }
insert accList;
// 2. Run the batch
test.startTest();
updateAccountBatch btch= new updateAccountBatch();
database.executeBatch(btch) ;
test.stopTest();
//3. Query the accounts and verify
list<account> accResultLst =[select id, name, prime_account__c from account where name= 'TestAccount' and prime_account__c =true] ;
system.assertEquals(5,accResultLst.size());
              }
}