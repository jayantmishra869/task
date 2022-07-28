public class Assignment3 
{
	public static void q1()
    {
        List<Account> la = new List<Account>();
        for(Integer z = 0; z < 5; z++)
        {
            Account a = new Account(Name = 'Supper');
            la.add(a);
        }
        insert la;
        List<Account> accList = [SELECT Name FROM Account WHERE Name LIKE 's%'];
        INTEGER i = 0;
        for(Account a: accList)
        {
             i=i+1;
             a.Name = a.name + ' Test '+ i;
        }
        
        update accList;
    }
    
    public static void q2()
    {
        List<Account> la = [SELECT ID, Name FROM Account WHERE ID NOT IN(SELECT AccountID FROM Opportunity)];
        List<Opportunity> lo = new List<Opportunity>();
        Integer i = 0;
        for(Account s: la)
        {
            i=i+1;
     		opportunity o = new opportunity(Name = 'link '+i, AccountId=s.ID, StageName = 'Closed won', CloseDate = Date.newInstance(2022, 04, 01));
            lo.add(o);
        }
        insert lo;
    }
    
    public static void q3()
    {
        List<Account> la = new List<Account>();
        List<Contact> lc = new List<Contact>();
		Integer x = 0;
        for(Integer i = 0 ;i < 5; i++)
        {
			x = x + 1;
            Account a = new Account(Name = 'newAcc '+x);
            la.add(a);
            Contact c = new Contact(firstName = 'newCon '+x, AccountID = a.ID);
            lc.add(c);
        }
        insert la;
        insert lc;
        
        Delete lc;
        Delete la;
       
        List<Account> un = [SELECT Name FROM Account WHERE Name LIKE 'newA%' AND isDeleted = True All Rows];
        Undelete un;
    }
    
    public static void q4()
    {
        List<Contact> lc = [SELECT firstName, lastName FROM Contact WHERE firstName Like 'a%'];
        for(Contact c: lc)
        {
            c.LastName = 'ss';    
        }
        upsert lc;
    }
    
    public static void q5_1()
    {
        List<Account> la = [SELECT Name From Account Where Name LIKE '_u%'];
        delete la;
        List<Account> lz = [SELECT Name From Account Where Name LIKE '_u%' AND isDeleted = True All Rows];
        database.emptyRecycleBin(lz);
    }
    
    public static void q5_2()
    {
        Date d1 = Date.newInstance(2022, 05, 01);
        Date d2 = Date.newInstance(2022, 18, 30);
        List<Account> la = [SELECT Name From Account Where LastModifiedDate > :d1 AND LastModifiedDate < :d2 AND LastModifiedById = '0055j0000050NqHAAU' AND isDeleted = True All Rows];
        undelete la;
    }
    
    public static void q6()
    {
        Account a = new Account(External_Email__c = 'op@yo.com');
        Contact c = new Contact(firstName = 'GG', lastName = 'hh');
        c.Account = a;
		Account b = new Account(Name = 'jj', External_Email__c = 'op@yo.com');
        insert new List<sObject>{b, c};
    }
    
    public static void q7()
    {
        List<Account> acclist = new List<Account>();
        for(integer i = 0; i < 5; i++)
        {
        	Account a = new Account(Name = 'z' +i); 
            acclist.add(a);
        }
        Database.SaveResult[] result = Database.insert(acclist,false);
        for(Database.SaveResult v: result)
        {
            if(v.isSuccess())
            {
                System.debug('Data Successfully Inserted '+v.getId());
            }
            else
            {
                System.debug('Unsuccessfull '+v.getId());
            }
        }
        List<Opportunity> op = new List<Opportunity>();
        List<Contact> lc = new List<Contact>();
        for(Database.SaveResult s: result)
        {
            if(s.isSuccess())
            {
                Date d1 = Date.newInstance(2022, 04, 16);
                Opportunity o = new Opportunity(Name = 'opp', Amount = 8000,Pricebook2Id= '01s5j00000FKaYKAA1', AccountID = s.Id, StageName = 'Closed Won', CloseDate = d1);
                Contact c = new Contact(lastName = 'hi', AccountID = s.Id);
                op.add(o);
                lc.add(c);
            }
        }
        insert op;
        insert lc;
        List<OpportunityLineItem> oppLineItem = new List<OpportunityLineItem>();
        for(Opportunity k: op)
        {
            
            OpportunityLineItem opp = New OpportunityLineItem(Product2Id = '01t5j000005IVhgAAG', OpportunityId = k.Id, Quantity= 50,TotalPrice = 100);
            oppLineItem.add(opp);
        }
        Insert oppLineItem;
    }
    
  	public static void q8()
    {
        List<Account> la = [SELECT Name, Id FROM Account];
       	List<Opportunity> lo = [SELECT Name, AccountId FROM Opportunity];
        List<Account> cc = new List<Account>();
        for(Account a: la)
        {
            Integer Count = 0;
            for(Opportunity o: lo)
            {
                if(a.ID == o.AccountId)
                {
                    Count = count +1;
                }
            }
            if(Count >= 2)
            {
                cc.add(a);
            }
        }
        System.debug(cc);
        Delete cc;
    	//Database.SaveResult[] result = Database.insert(lo,false);
    	//Delete result;
    }
    
    
    public static void q9(String s1)
    {
        String qr = 'SELECT Count(ID) From';
        qr = qr + ' '+ s1;
        List<sObject> lo = Database.query(qr);
        System.debug(lo);
    }
    
    public static void q10()
    {
        
    }
}