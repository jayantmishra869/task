public class oppz 
{
	public static void dz()
    {
        List<Account> acc = [SELECT Name,id FROM Account];
        List<Opportunity> opp = [SELECT Name, AccountId FROM Opportunity];
        List<Contact> con = [SELECT Name, AccountId FROM Contact];
        List<Account> aacc = new List<Account>();
        List<Opportunity> oo = new List<Opportunity>();
        System.debug('Old Acc= '+acc);
        System.debug('Old Acc Length= '+acc.size());
        for(Account a: acc)
        {
            for(Contact c: con)
            {
                if(a.id == c.AccountId)
                {
                    aacc.add(a);
                }
            }
        }
        System.debug('New Acc= '+aacc);
        System.debug('New Acc Length= '+aacc.size());
        System.debug('Old Opp= '+opp);
        System.debug('Old Opp Length= '+opp.size());
        for(Account aa: aacc)
        {
            for(Opportunity o: opp)
            {
                if(aa.id == o.AccountId && o.AccountId != null)
                {
                    oo.add(o);
                }
            }
        }
        System.debug('New Oop= '+oo);
        System.debug('New Opp Length= '+oo.size());
        
    }
}