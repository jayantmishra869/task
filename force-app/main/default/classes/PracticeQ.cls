public class PracticeQ 
{
	public static void q1()
    {
        List<Opportunity> lo = [SELECT Name, Amount FROM Opportunity WHERE Amount > 0 ORDER BY Amount DESC];
        System.debug('List = '+lo);
		
		System.debug('Secound Largest = '+lo[1]);        
    }
    
    public static void q2()
    {
        List<Opportunity> lo = [SELECT Name, Amount FROM Opportunity ORDER BY Amount];
        System.debug('List = '+lo);
		
		System.debug('Smallest Amount = '+lo[0]);
    }
    
    public static void q3(date d1)
    {
         
        Date e = d1.addDays(7);
        Opportunity lo = new Opportunity(Name = 'yoyoyo', CloseDate = e, StageName = 'Closed Won');
        insert lo;
    }
    
    public static void q4()
    {
        // List<OpportunitylineItem> lo = [SELECT Name, FROM OpportunitylineItem WHERE Name = 'Edge SLA' AND pricebook2.Name];
        
        OpportunitylineItem lo = [SELECT Opportunity.Name, Product2.Name, Opportunity.Pricebook2.Name FROM OpportunitylineItem WHERE Opportunity.Name = 'Edge SLA'];
        
        System.debug(lo);
    }
    
    public static void q5() // Store opportunity, contact related to Account in map
    {
        	Account a = [SELECT Name FROM Account limit 1];
        
            Map<ID,list<List<sObject>>> mmap = new Map<ID, list<List<sObject>>>();
        
            //LOOP START
        		List<List<sobject>> op=new List<List<sobject>>();
                List<Opportunity> o=[select name from opportunity where accountId =:a.id];
                op.add(o);
                List<contact> c=[select name from contact where accountId=:a.id];
                op.add(c);
            	mmap.put(a.id,op);
        	//LOOP END
        System.debug(mmap);
    }
    
    public static void q6()
    {
        Map<Id, List<List<sObject>>> mmap = new Map<Id, List<List<sObject>>>();
        List<Account> la = [SELECT Name ,ID FROM Account];
        List<Contact> zz = new List<Contact>();
        List<List<sObject>> lso = new List<List<sObject>>();
        for(Account a: la)
        {
            List<Opportunity> lo = [SELECT Name FROM Opportunity WHERE AccountId = :a.Id];
            lso.add(lo);
            List<Contact> lc = [SELECT firstName,lastName FROM Contact WHERE AccountId = :a.Id];
            lso.add(lc);
            mmap.put(a.Id, lso);
        }
        for(sObject m: lso[1])
        {
            System.debug(m.get('lastName'));	// first method to print only contact
        }
        Set<id>  s=mmap.keySet();			//2nd method to print only contact
       	for(id x:s)
        {
            List<List<sobject>> li=mmap.get(x); 
            System.debug(li[1]);
        }
    }
}