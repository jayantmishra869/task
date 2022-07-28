trigger ApexTrigger5 on Lead (before insert) 
{
    for(Lead l: Trigger.new)
    {
        l.Rating = 'warm';
    }
}