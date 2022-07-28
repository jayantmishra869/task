trigger batchAccount on Account (After insert) 
{
    Map<id, Account> mapAcc = new Map<id, Account>();

    if(Trigger.isAfter)
    {
        
        if(Trigger.isInsert)
        {
                    
            for(Account a:Trigger.New)
            {
                mapAcc.put(a.id, a);
            }
        }
    }
    if(mapAcc.size()>0)
    {
        database.executeBatch(new TrggerBatch(mapAcc));
    }
}