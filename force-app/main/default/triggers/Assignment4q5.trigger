trigger Assignment4q5 on Opportunity (After insert) 
{
   /* List<Opportunity> o = [SELECT Name, Amount, AccountId, Id, Account.Id ,Account.Rating, Account.CustomerPriority__c FROM Opportunity WHERE AccountId != null];
    for(Opportunity op: o)
    {
        if(op.Amount > 10000)
        {
            op.Account.rating = 'Hot';
            op.Account.CustomerPriority__c = 'High';
        }
    }
    update o;   */
    List<Account> a = [SELECT Name, ID, Rating, CustomerPriority__c FROM Account];
    for(Opportunity o: Trigger.New)
    {
        for(Account aa: a)
        {
            if(o.AccountId == aa.Id && o.Amount > 20000)
            {
                aa.rating = 'Hot';
                aa.CustomerPriority__c = 'High';
            }
        }
        update a;
    }
}