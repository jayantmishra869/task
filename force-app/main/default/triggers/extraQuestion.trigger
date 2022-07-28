trigger extraQuestion on Contact (after insert, after update, after delete) 
{
   /*
    Integer l = [SELECT Count() FROM Contact WHERE AccountID != NULL];
    List<Account> la = [SELECT Name, Id, TotalContact__c FROM Account];
    for(Account a: la)
    {
        
        a.TotalContact__c = l;
    }
    Update la;*/
    List<Account> a = [SELECT Id FROM Account];
    List<Contact> c = [SELECT AccountId, Id FROM Contact];
    for(Account acc: a)
    {
        Integer Count = 0;
        for(Contact cc: c)
        {
            if(acc.Id == cc.AccountId)
            {
                Count = Count + 1;
                acc.TotalContact__c = Count;
            }
        }
    }
    update a;
}