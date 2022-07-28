public class UndeletedRecord 
{
	public static void q1()
    {
        Account a = new Account(Name = 'Jay', Phone = '(123)4567891');
        insert a;           
    }
    
    public static void q2()
    {
        Account a = [SELECT Name FROM Account WHERE Name LIKE 'j%'];
        Delete a;          
    }
    
    public static void q3()
    {
        List<sObject> a = [SELECT Name FROM Account WHERE isDeleted = True All Rows];
        System.debug(a);
    }
}