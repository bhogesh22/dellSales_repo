trigger AccountInsertEmailTrigger on Account (after insert) {
    // Collect the newly inserted account records
    List<Account> newAccounts = new list<account>();

    // Iterate through the new accounts
    for (Account newAccount : Trigger.new) {
        // Get the name of the newly inserted account
        String accountName = newAccount.Name;

        // Construct the email content
        String emailSubject = 'New Account Created';
        String emailBody = 'An account has been created and the name is "' + accountName + '".';

        // Set the email recipient (System Admin's email address)
        String adminEmail = 'system.admin@example.com'; // Replace with the actual email address

        // Send the email
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{adminEmail});
        email.setSubject(emailSubject);
        email.setPlainTextBody(emailBody);
        Messaging.sendEmail(new List<Messaging.Email>{email});
    }
}