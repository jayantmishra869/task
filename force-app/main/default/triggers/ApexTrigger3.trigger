trigger ApexTrigger3 on Account (after insert) 
{
    Map<Id, Account> nMap = new Map<Id, Account>();
    nMap = Trigger.newMap;
    List<Contact> cList = [Select lastName FROM Contact WHERE AccountId in :nMap.keySet()];
    for(Contact c: cList)
    {
        Account a = nmap.get(c.AccountID);
        c.MailingCity = a.BillingState;
    }
    update clist;
}