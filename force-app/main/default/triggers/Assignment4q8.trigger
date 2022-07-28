trigger Assignment4q8 on Opportunity (before update) 
{
    List<Task> t = [SELECT Id, WhoId, WhatId From Task];
    for(Opportunity op: Trigger.New)
    {
        for(Task tk: t)
        {
            if(op.Id == tk.WhatId)
            {   
                continue;
            }
            else
            {
                if(op.StageName != 'Closed Won' && op.StageName !='Closed Lost')
                {
                    op.addError('You can’t change the stage until any task is related to it.');
                }
            }
        }
    }
}