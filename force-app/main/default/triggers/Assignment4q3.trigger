trigger Assignment4q3 on Account (after Delete) 
{
    List<Account_backup_c__c> listAccountBackup = new List<Account_backup_c__c>();
   //List<Account> la = [SELECT MasterRecordID FROM Account WHERE MasterRecordID != All Rows];
    for(Account acc: Trigger.old)
    {
        if(acc.MasterRecordId != null)
        {
            //System.debug('andr hu');
            //Account s = new Account(Name = acc.name ,Phone = acc.Phone);
            Account_backup_c__c aa = new Account_backup_c__c(Name = acc.Name);
            listAccountBackup.add(aa);
        }
        Insert listAccountBackup;
    }
}