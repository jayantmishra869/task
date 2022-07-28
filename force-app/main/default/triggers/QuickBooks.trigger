trigger QuickBooks on Account (After insert) 
{
	if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            String jsonString = json.serialize(Trigger.New);
            QuickBookCustomerCreate.create(jsonString);
        }
        /*else if(Trigger.isUpdate)
        {
            String jsonString = json.serialize(Trigger.New);
            QuickBookCustomerCreate.create(jsonString);
        }*/
    }
}