public class helperClass 
{
    public static void beforeins(List<Opportunity> oppList)
    {
        List<String> naam = new List<String>();
        for(Opportunity o: oppList)
        {
            naam.add(o.Name);
        }
        List<Opportunity> opp = [SELECT Name FROM Opportunity where Name in :naam];
        for(Opportunity a : opp)
        {
            for(Opportunity i : oppList)
            {
                if(a.Name == i.Name)
                {
               		i.addError('Sorry');
                }
            }
           
        }
    }
   
    public static void beforeup(List<Opportunity> oppList)
    {
         List<String> naam = new List<String>();
        for(Opportunity o: oppList)
        {
            naam.add(o.Name);
        }
        List<Opportunity> opp = [SELECT Name FROM Opportunity where Name in :naam];
        for(Opportunity a : opp)
        {
            for(Opportunity i : oppList)
            {
                if(a.Name == i.Name)
                {
               		i.addError('Sorry');
                }
            }
           
        }
    }
    
    @future
    public static void currency(String jsonString)
    {
        
        List<Opportunity> oppList = (List<Opportunity>)json.deserialize(jsonString,List<Opportunity>.class);
        
        Decimal INR = 0.0;
        Decimal USD = 0.0;
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        req.setEndpoint('https://api.currencyapi.com/v3/latest?apikey=DlTKYDipQYUsaK8fCm1RuaLyGSen4EOPM8UW3auW');
        req.setMethod('GET');
        
        HTTPResponse res = h.send(req);
        
        Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        Map<String, Object> nmap = (Map<String, Object>)jsonBody.get('data');
        System.debug(jsonBody);
        System.debug(nmap);
        
        Map<String, Object> nmap2 = (Map<String, Object>) nmap.get('INR');
        //Map<String, Object> nmap3 = (Map<String, Object>) nmap.get('USD');
        System.debug(nmap2);
        INR = (Decimal)nmap2.get('value');
        //USD = (Decimal)nmap3.get('Value');
        //System.debug(USD);
        //System.debug(INR);
        	/*Map<String, Object> nmap2 = (Map<String, Object>)nmap.get('USD');
			System.debug(nmap2);
			Decimal conversionRate = (Decimal)nmap2.get('val');*/
        //INR = usd*INR;
        for(Opportunity o: oppList)
        {     
            //o.INR__c = 0;
            o.INR__c = INR*o.Amount;
        }
    }
  
}