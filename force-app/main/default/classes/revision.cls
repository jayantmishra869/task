public class revision 
{
	public static void q1()
    {
        List<AggregateResult> a = [SELECT CALENDAR_YEAR(CloseDate), SUM(Amount) FROM Opportunity WHERE StageName = 'Closed Won' AND StageName = 'Closed Lost' AND CreatedById = :UserInfo.getUserId() AND CloseDate = THIS_FISCAL_YEAR group by CALENDAR_YEAR(CloseDate)];
		System.debug(a);    
    }
    
    public static void q2()
    {
        List<Account> acc = [SELECT Id, (SELECT Id, Name FROM Opportunities) opportunity, (SELECT id, Name FROM Contacts) contact FROM Account WHERE Name LIKE 'S%'];
        System.debug(acc);
    }
    public static void q3()
    {
         Map<Id, List<Contact>> mmap = new Map<Id, List<Contact>>();
        List<Account> ls = [SELECT Name, Id FROM Account];
        List<Contact> lc = [SELECT Name, Id, AccountID FROM Contact];
        for(Account a: ls)
        {
            Integer count = 0;
            for(Contact c: lc)
            {
                if(c.AccountId == a.Id)
                {
                    Count = Count + 1;
                }
                if(Count > 2)
                {
                    System.debug(a.id+' -------- '+c.id);
                    break; 
                }
            }
        }
    }
}