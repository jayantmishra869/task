public class finalhubspot 
{
	public static void d()
    {
        HttpRequest req = new HttpRequest();
		req.setMethod('POST');
		req.setHeader('Content-Type','application/x-www-form-urlencoded;charset=utf-8');
        req.setHeader('Data','grant_type=authorization_code&client_id=bb092769-648f-47d3-b357-73538a25a1bf&client_secret=859d4946-d5e5-49d0-a9fd-5370ec4ab298&redirect_uri=https://app.hubspot.com/dashboard-library/22039407&code=9e5d7061-9d0d-4d92-afa1-01b71c7d3a29');
		req.setEndpoint('https://api.hubapi.com/oauth/v1/token');
		String CLIENT_ID = 'bb092769-648f-47d3-b357-73538a25a1bf';
		String CLIENT_SECRET = '859d4946-d5e5-49d0-a9fd-5370ec4ab298';
		req.setBody('grant_type=authorization_code' + '&client_id='+CLIENT_ID + '&client_secret='+CLIENT_SECRET + '&scope=crm.objects.contacts.read%20crm.objects.contacts.write'+ '&redirect_uri=https://app.hubspot.com/dashboard-library/22039407'+'&code=9e5d7061-9d0d-4d92-afa1-01b71c7d3a29');
		Http http = new Http();
		HTTPResponse res = http.send(req);
		Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        System.debug(jsonBody);
    }
}