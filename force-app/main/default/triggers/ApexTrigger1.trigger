trigger ApexTrigger1 on Account (before insert) 
{
    for(Account a: Trigger.New)
    {
        a.NumberOfEmployees = 365;
    }
}