public class ContactController{
    @AuraEnabled
    public static List <contact> fetchContacts() {
        //Qyery 10 accounts
        List<contact> conList = [SELECT Id, firstName,
                                     Phone,email  from contact LIMIT 10];
        //return list of accounts
        return conList;
    }
}