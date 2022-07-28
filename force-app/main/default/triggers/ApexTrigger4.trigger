trigger ApexTrigger4 on Opportunity (after update) 
{
    Map<Id, Opportunity> omap = new Map<Id, Opportunity>();
    omap = Trigger.Oldmap;
    for(Opportunity New1: Trigger.new)
    {
        Opportunity Old1 = new Opportunity();
        Old1 = omap.get(new1.Id);
        if(New1.Amount != Old1.Amount)
        {
            New1.Amount.addError('Amount Cannot be Changed');
        }
    }
}