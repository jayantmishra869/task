trigger Trigger2 on Opportunity (after update) 
{
    for(Opportunity Old1 :Trigger.Old)
    {
        for(Opportunity New1 :Trigger.New)
        {
            if(Old1.Id == New1.Id && Old1.Amount != New1.Amount)
            {
                New1.addError('Cannot be Changed');
            }
        }
    }
}