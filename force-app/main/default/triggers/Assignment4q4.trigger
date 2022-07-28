trigger Assignment4q4 on Account (before Delete) 
{
    for(Account a: Trigger.old)
    {
        Opportunity oq = [SELECT Name, AccountId FROM Opportunity WHERE AccountId = :a.Id];
        if(oq.AccountId == a.Id)
        {
            a.addError('Nahi hoga delete bhai ye Account opportunity se linked hai');
        }
    }    
}