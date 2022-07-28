public class AccountMerge 
{
	public static void q1()
    {
        List<Account>  ls = new List<Account>{new
		Account(name='Acmeaa1 Inc.'),new Account(name='Acmeaa1')};
		insert ls;
		Account masterAcct = [select id, name from account where name = 'Acmeaa1 Inc.' limit 1];
		Account mergeAcct = [select id, name from  account where name = 'Acmeaa1' limit 1];
		merge masterAcct  mergeAcct;
    }
}