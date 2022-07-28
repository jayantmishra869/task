public class DMLAssociated 
{
	public static void q1()
    {
        Account a = new Account(Name = 'Disney', NumberOfEmployees = 2000);
        insert a;
        
        // Now Associating contact with Account
        Contact c = new Contact(firstName = 'Max', lastName = 'Brown', Accountid = a.id);
        Contact c1 = new Contact(firstName = 'jeff', lastName = 'Brown', Accountid = a.id);
        
        List<Contact> conList = new List<Contact>();
        conList.add(c);
        conList.add(c1);
        
        insert conList;
        
        // Now Associating Opportunity with Account
        
        Date d = Date.today()+30;
        Opportunity o = new Opportunity(Name = 'Sell Tyres', StageName = 'Prospecting', CloseDate = d, Accountid = a.id);
        Opportunity o1 = new Opportunity(Name = 'Sell Paper', StageName = 'Prospecting', CloseDate = d, Accountid = a.id);
        
        List<Opportunity> lo = new List<Opportunity>();
        lo.add(o);
        lo.add(o1);
        
        insert lo;
    }
}