public class assignment3_Q10 
{
	public static void q10()
    {
        Savepoint sp1 = Database.setSavepoint();
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i < 50; i++)
        {
            Account a = new Account(Name = 'B '+i);
            accList.add(a);
        }
        Database.SaveResult[] result = Database.insert(accList, false);
        
        Integer Count = 0;
        for(Database.SaveResult x: result)
        {
            if(x.isSuccess())
            {
                Count = Count + 1;
            }
        }
        if(Count <= 80)
        {
            Database.rollback(sp1);
        }
    }
    public static void d()
    {
        List<Account> la = [SELECT Name FROM Account WHERE Name LIKE 'A%'];
        delete la;
    }
}