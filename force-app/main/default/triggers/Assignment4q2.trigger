trigger Assignment4q2 on Opportunity (before insert) 
{
    List<Account> acc = [SELECT Name, Id FROM Account];
    List<Opportunity> op = [SELECT Name, AccountID FROM Opportunity];
    for(Opportunity o: Trigger.new)
    {
        for(Account a: acc)
        {
            for(Opportunity opp: op)
            {
                if(a.id == o.AccountID && o.Name == opp.Name)
                {
                    o.Name = o.Name + ' Duplicate Opportunity';
                }
            }
    
        }
    }   
}