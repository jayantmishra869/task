public class DML 
{
	public static void q1()
    {
     	List<Account> la = New List<Account>();
        
        for(Integer i=0; i < 5; i++)
        {
            Account a = new Account(Name = 'Test '+i, Phone = '1122');
            la.add(a);
        }
        update la;
    }
    
    public static void q2()
    {
        List<Account> la = [SELECT Name, Phone FROM Account WHERE Phone = '1%'];
        for(Account a: la)
        {
            a.Phone = '888';
        }
        upsert la;
    }
    public static void q3()
    {
        List<Account> la = [SELECT Name FROM Account WHERE Name LIKE 'Test%'];
        Delete la;
    }
    
    public static void q4()
    {
        List<Account> accList = [SELECT Name FROM Account WHERE Name LIKE 'Merg%' LIMIT 3];
        Account a = accList[0];
        Account b = accList[1];
        Account c = accList[2];
        
        List<Account> mergeList = new List<Account>();
        mergeList.add(accList[1]);
        mergeList.add(accList[2]);
        
        Database.merge(a, mergeList, false);
        System.debug(mergeList);
    }
}