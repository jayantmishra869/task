trigger SlackTrigger on Opportunity (after insert) 
{
    if(Trigger.isafter)
    {
        if(Trigger.isInsert)
        {
            String jsonString = json.serialize(Trigger.NEW);
            SlackAPI.d(jsonString);
        }
    }
}