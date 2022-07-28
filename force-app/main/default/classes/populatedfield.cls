public class populatedfield 
{
	public static void a()
    {
        List<Account> a = [SELECT Name, phone, NumberOfEmployees FROM Account];
		for(Account acc: a)
        {
			Map<String, Object> fieldsToValue = acc.getPopulatedFieldsAsMap();
            System.debug(acc);
        }
		
    }
}