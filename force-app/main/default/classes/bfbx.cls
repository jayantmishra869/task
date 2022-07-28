public class bfbx {
    public static void hello(List<Account> abc){
	List<Opportunity> op =[SELECT Name, AccountID FROM Opportunity where accountId != null];
    List<Opportunity> n = new List<Opportunity>();
    List<Account> la = new List<Account>();
    for(Account acc:abc)
    {
        Integer Count = 0;
        for(Opportunity o: op)
        {
            if(acc.Id == o.AccountId)
            {
                Count = Count+1;
            }
        }
        if(Count == 0)
        {           
            System.debug('hi00');
            la.add(acc);
            Opportunity opp = new Opportunity(Name =acc.Name+ ' First',stagename='prospecting',closedate=Date.today().addDays(30), AccountId = acc.Id);
            n.add(opp);
        }  
    }
        insert n;
    }
}