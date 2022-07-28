public class Assignment2 
{
    public static void q1()
    {
		List<AggregateResult> agg = [SELECT SUM(Amount) SumOfAmount, fiscal_year(CLoseDate) year from Opportunity WHERE StageName = 'Close won' AND OwnerID = :UserInfo.getUserId() group by fiscal_year(CloseDate)];
		System.debug(agg);       
    }
   
    public static void q2(String d1, String d2)
        
    {
        String[] s1 = d1.split('/');
        String[] s2 = d2.split('/');
        Date da = Date.newInstance(Integer.valueOf(s1[0]), Integer.valueOf(s1[1]), Integer.valueOf(s1[2]));
        Date db = Date.newInstance(Integer.valueOf(s2[0]), Integer.valueOf(s2[1]), Integer.valueOf(s2[2]));
        List<Opportunity> lo = [SELECT Name FROM Opportunity WHERE CloseDate > :da AND CloseDate < :db];
        System.debug(lo);
    }
    
    public static void q3()
    {
        List<Account> lq = [SELECT ID, Name, (SELECT Name FROM Opportunities), (SELECT Name FROM Contacts) FROM Account WHERE Name LIKE 'b%' ];
        System.debug(lq);
    
    	List<Opportunity> lo = [SELECT ID, Name, Account.Name, (SELECT ContactID FROM OpportunitycontactRoles) FROM Opportunity WHERE Name LIKE '%a'];
        System.debug(lo);
    }

	public static void q4()
    {
        List<List<sobject>> lsO = [FIND 'Test' RETURNING Opportunity( name WHERE CloseDate = this_fiscal_year), Account(name WHERE OwnerID = :UserInfo.getUserId())];
        System.debug(lsO);
    }
    
    public static void q5()
    {
        List<Account> lacc = [SELECT ID FROM Account where name like 'b%'];
        Map<ID, List<Contact>> cmap = new Map<ID, List<Contact>>();
        Map<ID, List<Opportunity>> mmap = new Map<ID, List<Opportunity>>();
      	for(Account acc :lacc)
        {
            mmap.put(acc.ID, [SELECT Name FROM Opportunity WHERE Account.id = :acc.id]);
           	cmap.put(acc.ID, [SELECT Name FROM Contact WHERE Account.id = :acc.id]);
        }
        System.debug(mmap);
        System.debug(cmap);
    }
    
    public static void q6()
    {
        
    }
}