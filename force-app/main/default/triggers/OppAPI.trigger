trigger OppAPI on Opportunity (after insert) 
{
    if(Trigger.isafter)
    {
        if(Trigger.isInsert)
        {
            String jsonString = json.serialize(Trigger.NEW);
            //OppAPIclass.currency(jsonString);
            StripeAPIpayment.pay(jsonString);
        }
    }
}