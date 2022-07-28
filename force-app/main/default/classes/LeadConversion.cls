public class LeadConversion 
{
	public static void lc()
    {
        Lead l = [SELECT Name FROM Lead WHERE Name LIKE 'inyo%' LIMIT 1];
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(l.id);
       	lc.ConvertedStatus = 'Closed - Converted';
        lc.ownerid = UserInfo.getUserId();
        
        Database.leadConvertResult lcr = Database.convertLead(lc);
    }
}