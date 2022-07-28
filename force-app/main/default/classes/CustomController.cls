public class CustomController 
{
    public String accName{get;set;}
    public Integer accNumberOfEmployees{get;set;}
    public String conName{get;set;}
    public String conEmail{get;set;}
    public String oppName{get;set;}
    public Integer oppAmount{get;set;}
	public void controller()
    {
    }
    public void saveTheRecord()
    {
        Account a = new Account(Name = accName, NumberOfEmployees = accNumberOfEmployees);
        insert a;
        Contact c = new Contact(lastName = conName, Email = conEmail, accountId = a.Id);
        Opportunity o = new Opportunity(Name = oppName, accountId = a.Id, Amount = oppAmount, StageName = 'Closed Won', CloseDate = System.today());
        insert c;
        insert o;
    }   
}