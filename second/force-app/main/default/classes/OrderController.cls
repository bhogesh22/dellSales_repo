public class OrderController {
    
@auraEnabled
    public static list<Order> getRelatedOrders(Id accId){ 
        List<Order> orderList = New List<Order>();
       system.debug('accId===>'+accId);
        orderList = [SELECT Id, Effectivedate, status, totalamount, name from Order where accountId  =: accId];
        System.debug('orderList >>>' + orderList);
        return orderList;
    }
}