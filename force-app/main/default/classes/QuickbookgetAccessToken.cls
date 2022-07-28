public class QuickbookgetAccessToken 
{
	public static PageReference mycode()
    {
        PageReference pref = new PageReference('https://appcenter.intuit.com/connect/oauth2?client_id=ABJSKmclU0nbEaIYfnpMkYqSdEiTLSwqrgrjMYw9bcMrN3vGEV&response_type=code&scope=com.intuit.quickbooks.accounting&redirect_uri=https://cyntexa-4bb-dev-ed--c.visualforce.com/apex/QuickBooksPage?core.apexpages.request.devconsole=1&state=12345678');
        pref.setRedirect(true);
        return pref;
    }
    public static void getcode()
    {
		String code = ApexPages.currentPage().getparameters().get('code');
        String realmId = ApexPages.currentPage().getparameters().get('realmId');
        system.debug('hey----->12 '+code);
        system.debug('hey----->45 '+realmId);
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer');
        string body='grant_type=authorization_code&code='+code+'&redirect_uri=https://cyntexa-4bb-dev-ed--c.visualforce.com/apex/QuickBooksPage?core.apexpages.request.devconsole=1';
        req.setMethod('POST');
        string key=EncodingUtil.base64Encode(blob.valueOf('ABJSKmclU0nbEaIYfnpMkYqSdEiTLSwqrgrjMYw9bcMrN3vGEV:1zVxZGIWWRQ4x968mxHjedfUGElRnVJUM9QA734X'));
        req.setHeader('Authorization', 'Basic '+key);
     
        req.setHeader('Accept', 'application/json');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody(body);
		System.debug(key);
        
        HttpResponse res = h.send(req);
        system.debug(res.getBody());
        
        
        Map<String, Object> m1 = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        System.debug(m1);
       	String token = (String)m1.get('access_token');
        System.debug(token);
        
        QuickBooks__c a = new QuickBooks__c(Name='QuickBooks', QuickBookAccessToken__c=token, Realm_ID__c=realmId);
        insert a;

    }
}