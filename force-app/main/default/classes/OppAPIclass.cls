public class OppAPIclass
{
	@future(callout=true)
    public static void currency(String jsonString)
    {
        System.debug(jsonString);
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

        System.debug(nmap2);
        INR = (Decimal)nmap2.get('value');
		
        for(Opportunity o: oppList)
        {     
            o.INR__c = INR * o.Amount;
        }
        update oppList;
    }
}