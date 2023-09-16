global class DeleteInactiveOpportunitiesSchedule implements Schedulable {
    global void execute(SchedulableContext SC) {
        // Create an instance of the batch class
        DeleteInactiveOpportunitiesBatch batch = new DeleteInactiveOpportunitiesBatch();
        
        // Start the batch job
        Database.executeBatch(batch);
    }
}