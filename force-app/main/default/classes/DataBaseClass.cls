public class DataBaseClass 
{
	public static void q1()
    {
        List<Account> a = new List<Account>();
        for(integer i = 0; i < 2; i++)
        {
            Account d = new Account(Name = 'io'+i, Phone = '(123)4567890');
            a.add(d);
        }
        Database.insert(a);
    }
    
    public static void q2()
    {
        List<Account> la =[SELECT Name, Phone FROM Account WHERE Name LIKE 'io%'];
        Database.delete(la);
        System.debug(la);
    }
    
    public static void q3()
    {
        List<Account> la = [SELECT Name, Phone FROM Account WHERE Name LIKE 'io%' AND isDeleted=true All Rows];
        Database.emptyRecycleBin(la);
    }
    
    public static void q4()
    {
        Integer i1 = Database.Countquery('SELECT Count() FROM Account WHERE Name LIKE' + ' a%');
        System.debug(i1);
    }
}