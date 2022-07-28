public class DMLupdate 
{
	public static void q1()
    {
        List<Opportunity> lo = [SELECT Name, CloseDate, Amount FROM Opportunity];
        
        Date d = System.today();
        for(Opportunity o: lo)
        {
            o.CloseDate = d;
        }
        update lo;
    }
}