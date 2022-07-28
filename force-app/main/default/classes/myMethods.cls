public class myMethods 
{
	public static void function()
    {
        Set<Account> s1 = new Set<Account>();
        
	    Account a1 = new Account(Name = 'Amazon', NumberOfEmployees = 20000);
        Account a2 = new Account(Name = 'Walmart', NumberOfEmployees = 20000);
        Account a3 = new Account(Name = 'Amazon', NumberOfEmployees = 20000);
        Account a4 = new Account(Name = 'Amazon');
           
        s1.add(a1);
        s1.add(a2);
        s1.add(a3);
        s1.add(a4);
        s1.add(new Account(Name = 'Lmazon', NumberOfEmployees = 20000));
        System.debug(s1);
        
    }
}