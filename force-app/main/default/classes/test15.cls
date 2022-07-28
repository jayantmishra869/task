public class test15 
{
    public static void q1()
    {
        Account a = new Account(External_Email__c = 'hel@gmail.com');
    	Contact c = new Contact(lastName = 'ns');
    	c.Account = a;
        Account b = new Account(Name = 'as', External_Email__c = 'hel@gmail.com');
        insert new List<sObject>{b,c};
    }
    
    public static void q2()
    {
         Account a = new Account(External_Email__c = 'hel@gmail.com');
    	 Contact c = new Contact(lastName = 'nn');
    	 c.Account = a;
         Account b = new Account(Name = 'ss', External_Email__c = 'hel@gmail.com');
         upsert new List<sObject>{b,c};
    }
}