public class SOQLclassl
{
	Public static void soql()
    {
        List<Account> acclist = [SELECT Name, NumberOfEmployees from Account];
         
        
        for(Integer i = 0; i < acclist.size()-1; i++)
        {
        	System.debug(acclist[i]);
        }
        
        for(Account a:acclist)
        {
            System.debug('Name ='+ a.Name+'  NumberOfEmployees = '+ a.NumberOfEmployees);
        }
        
    }
    // Variable Binding
    
    Public Static void soql1(String str)
    {
        List<Contact> lc = [SELECT firstName, lastName, email FROM Contact WHERE firstName = :str OR lastName = :str];
        System.debug(lc);
        
        //OR
        
        Contact c = [SELECT firstName, lastName,email FROM Contact LIMIT 2];
        System.debug(c);
        
        
    }
    
    //SOQL AggregateResult Function (We can Perform SUM, COUNT, MIN, MAX, AVG Operations, Count_Distinct)
    
    public static void agg()
    {
        //**** SUM
       AggregateResult agr = [SELECT SUM(Amount) from Opportunity];
       System.debug('SUM OF RESULT ='+ agr);	
        
        //**** MAX
       AggregateResult agr1 = [SELECT MAX(Amount) from Opportunity];
       System.debug('MAX RESULT ='+ agr1);
        
        //****COUNT
       AggregateResult agr2 = [SELECT COUNT(Amount) from Opportunity];
       System.debug('COUNT RESULT ='+ agr2);
        
       Integer i = [SELECT Count() from Opportunity];
       System.debug('INTEGER COUNT ='+ i);
        
       AggregateResult agr3 = [SELECT MIN(Amount) from Opportunity];
       System.debug('MIN RESULT ='+ agr3);
        
        //*****AVG
       AggregateResult agr4 = [SELECT AVG(Amount) from Opportunity];
       System.debug('AVG RESULT ='+ agr4);
       
        //****Count_Distinct(It will gives the unique value)
       AggregateResult agr5 = [SELECT Count_Distinct(Amount) from Opportunity];
       System.debug('Count_Distinct RESULT ='+ agr5); 
       
        //*** how to get a value from AggregateResult to Integer
       
        Integer ai = (Integer)agr3.get('expr0');
        System.debug('AVG Integer Value ='+ ai);
    }
    
    	// SOQL KEYWORDS
    Public static void keywords()
    {
    //***** IN
    	List<String> ls = new List<String>{'john','rohan','shyam'};
    	List<Contact> lc = [SELECT firstName FROM Contact WHERE firstName IN :ls];
    	System.debug(lc);
        
        //With Set
        Set<ID> s = new Set<ID>{'985464dad','8765445ded','3543541adwd'};
    	List<Contact> ll = [SELECT firstName FROM Contact WHERE ID IN :s];
    	System.debug(ll);
        
     //******NOT 
     	List<String> lq = new List<String>{'john','rohan','shyam'};
    	List<Contact> lx = [SELECT firstName FROM Contact WHERE firstName NOT IN :ls];
    	System.debug(lx);  
    }
    
}