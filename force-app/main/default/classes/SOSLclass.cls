public class SOSLclass 
{
	public static void sosl1()
    {
        List<List<sObject>> l1 = [FIND 'john' RETURNING Opportunity, Contact];
        System.debug(l1);
        
        List<List<sObject>> l2 = [FIND 'john' RETURNING Opportunity(Amount), Contact(firstName, lastName)];
        System.debug(l2);
        
        // How Access Record in Apex returned by SOSL
        
        List<Opportunity> oppList = l2[0];
        
        for(Opportunity o: oppList)
        {
            System.debug(o.Amount);
        }
        
        List<Contact> conList = l2[1];
        
        for(Contact c: conList)
        {
            System.debug(c.firstName);
            System.debug(c.lastName);
        }
    }
    Public static void sosl2()
    {
        List<List<sObject>> sl = [FIND 'john' RETURNING Account, Contact];
        List<Account> la = sl[0];
        
        for(Account a: la)
        {
            System.debug(a);
        }
        List<Contact> lc = sl[1];
        
        for(Contact c: lc)
        {
            System.debug(c);
        }
    }
    // Name Field
    public static void sosl3()
    {
        List<List<sObject>> lo = [FIND 'Univ*' RETURNING Account(Name, BillingCountry), Contact(firstName)];
        List<Account> la1 = lo[0];
        for(Account a: la1)
        {
            System.debug(la1); // Accessing First list
            System.debug(la1[0].Name); // Accessing First Record
        }
        List<Contact> loc = lo[1];
        
        for(Contact c: loc)
        {
            System.debug(c);
        }
    }
}