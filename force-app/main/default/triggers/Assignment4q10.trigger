trigger Assignment4q10 on OpportunityLineItem (before insert) 
{
    List<OpportunityLineItem> oli = [SELECT name, UnitPrice FROM OpportunityLineItem];
    List<Product2> pro = [SELECT Description FROM Product2];
    for(OpportunityLineItem o : oli)
    {
        if(o.UnitPrice > 10000)
        {
            for(Product2 p : pro)
            {
                if(p.Id == o.Product2Id)
                {
                    o.Description = p.Description;
                }
            }
        }
        else
        {
            o.addError('Cannot add product in opportunity because price is less than 10000');
        }
    }
}