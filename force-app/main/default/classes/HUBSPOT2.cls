public class HUBSPOT2 
{
	public static void run()
    {
        hubspot__c h = [SELECT Name, Rtoken__c FROM hubspot__c ORDER BY CreatedDate Desc limit 1];
        System.debug(h);
        String rt = h.Rtoken__c;
        System.debug('rtoken '+rt);
        HTTP ht = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://api.hubapi.com/oauth/v1/token?grant_type=refresh_token&client_id=bb092769-648f-47d3-b357-73538a25a1bf&client_secret=859d4946-d5e5-49d0-a9fd-5370ec4ab298&refresh_token='+rt);
        HTTPResponse res = ht.send(req);
        Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        System.debug('map '+jsonBody);
        
    }
}