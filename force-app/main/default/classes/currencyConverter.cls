public class currencyConverter 
{
	public static Decimal convertCurrency(Decimal usd)
    {
        Decimal INR = 0.0;
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
      //  Map<String, Object> nmap3 = (Map<String, Object>) nmap.get('USD');
        System.debug(nmap2);
      //  System.debug(nmap3);
        INR = (Decimal)nmap2.get('value');
        System.debug(INR);
        /*Map<String, Object> nmap2 = (Map<String, Object>)nmap.get('USD');
        System.debug(nmap2);
        Decimal conversionRate = (Decimal)nmap2.get('val');*/
        INR = usd*INR;
        return INR;
    }
}