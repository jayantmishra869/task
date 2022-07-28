public class databaseTryCatch 
{
	public static void d()
    {
        List<Account> accList = new List<Account>();
        for(Integer i=0; i<=10; i++)
        {
            Account a = new Account(Name = 'MyResultTest'+i, NumberOfEmployees = i);
            accList.add(a);
        }
        System.debug('Total Account '+accList.size());
        
        Database.SaveResult[] dsr = Database.insert(accList, false);
        
        for(Database.SaveResult s: dsr)
        {
            if(s.isSuccess())
            {
                System.debug('I Am Successful '+ s.getId());
            }
            else
            {
                System.debug('Unsuccess ');
            
        		List<Database.Error> ErList = s.getErrors();
                for(Database.Error dr: ErList)
        		{
            		System.debug(dr.getstatusCode()+' '+dr.getMessage());
            		System.debug('Field Affected By Insertion are: ' +dr.getFields());
        		}
            }                
        }
    }
}