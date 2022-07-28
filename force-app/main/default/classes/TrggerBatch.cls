global class TrggerBatch implements Database.Batchable<sObject>
{
    Map<id, Account> newMap = new Map<id, Account>();
    global TrggerBatch(Map<id, Account>newMap1)
    {
        newMap = newMap1;
    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator([SELECT id, Name FROM Account WHERE id IN :newMap.keySet()]);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        for(Account aa: scope)
        {
            aa.Name = aa.Name+1;
        }
        update scope;	
    }
    global void finish(Database.BatchableContext BC)
    {
        String[] sendingTo = new String[]{'jayantm869@gmail.com'}; 
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(sendingTo);
        email.setSubject('Welcome Mail');
        email.setPlainTextBody('Your Account has been created');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}