public class futureClass {
public static void CreateUser(){
list<profile> pr = [select id, name from profile where name= 'sales user'];
user us =new user ();
us.ProfileId=pr[0].id;
us .firstname=' Hari ' ;
us .lastname= ' Priya ' ;
us .Username= ' haripriya55555@gmail.com ' ;
us .Email= ' haripriya12345@gmail.com ' ; 
us .Alias= 'hapap' ;
us.TimeZoneSidKey= ' Asia/Kolkata ' ;
us .LocaleSidKey= ' en_US ' ;
us .EmailEncodingKey= 'UTF-8'  ;
us .LanguageLocaleKey= ' en_US ' ;
insert us;
    futureClass.CreateAnAccount();
}   
 
@future
    public static void CreateAnAccount(){
Account acc = new account();
acc.Name= 'rrrr ' ;
acc.phone= '1000' ;
insert acc;
    }
 }