trigger ll on Opportunity (before insert, before update)
{
    if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
            helperClass.beforeins(trigger.new);
        }
        if(trigger.isUpdate)
        {
            helperClass.beforeup(trigger.new);
        }
    }
}