global class BatchLead implements Database.Batchable<sObject>, Schedulable
{
    integer count=0;
    integer dup = 0;
    integer total=0;
	global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([SELECT Name,AnnualRevenue from Lead]);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> lList)
    {
        System.debug('lList-'+lList);
        List<Lead> llList = lList;
        for(Lead l: lList)
        {
            count=0;
            for(Lead ll: llList)
            {
                
                if(l.Name == ll.Name)
                {
                    count=count+1;
                    total=total+1;
                     if(count >= 2)
                	{
                    	dup=dup+1;
                	}
                }
            }
        }
        System.debug(count);
        System.debug('duplicate= '+dup/2);
        System.debug('Total Leads= '+total);
    }
    
    
    global void finish(Database.BatchableContext bc)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAdd = new String[]{'jayantm869@gmail.com'};
        mail.setToAddresses(toAdd);
        mail.setSubject('Batch Job Completed');
        mail.setPlainTextBody('Hey, Batch job Done duplicate = '+dup/2+'Number of total Lead Count= '+total);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
    
    global void execute(SchedulableContext sc)
    {
        BatchLead lub = new BatchLead();
        Database.executeBatch(lub);
    }
}