public class GoogleTranslateAPI 
{	
    @future(callout=true) // this API is not working
	public static void translate(String jsonString)
    {
        System.debug(jsonString);
        List<Account> aa = (List<Account>)json.deserialize(jsonString, List<Account>.class);
        
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        req.setEndpoint('https://deep-translate1.p.rapidapi.com/language/translate/v2');
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        
        req.setHeader('X-RapidAPI-Host', 'deep-translate1.p.rapidapi.com');
        req.setHeader('X-RapidAPI-Key', '5b84210811mshaf7a5911217d3fbp1e5fbbjsnfd256feea4a1');	
        
        String ad = aa[0].Name;
        req.setBody('{"q":"'+ad+'","target":"hi"}');
        
        HTTPResponse res = h.send(req);
        Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        System.debug(jsonBody);
        Map<String, Object> m1 = (Map<String, Object>)jsonBody.get('data');        
        System.debug(m1);
        Map<String, Object> m2 = (Map<String, Object>)m1.get('translations');
        System.debug(m2);
        //Set<String> s1 = new Set<String>();
		//Set<String> str = m2.keySet();
		String c;
        for(String key: m2.KeySet())
        {
        //    c = m2.get(key);
        }
    }
}