public class googleTranslateAPI2 
{
    // This Language translater API is Working
	@future(callout=true)
    public static void trans(String jsonString)
    {
        System.debug(jsonString);
        List<Account> aa = (List<Account>)json.deserialize(jsonString, List<Account>.class);
        for (sObject obj : aa) 
        {
      		Map<String, Object> fieldValues = obj.getPopulatedFieldsAsMap();
        
        	System.debug(fieldValues);
        }
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://cheap-translate.p.rapidapi.com/translate');
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        
		req.setHeader('X-RapidAPI-Host', 'cheap-translate.p.rapidapi.com');
        req.setHeader('X-RapidAPI-Key', '5b84210811mshaf7a5911217d3fbp1e5fbbjsnfd256feea4a1');
        
        //req.setBody('{"q":"Hello","target":"hii"}');
        String ad = aa[0].Name;
        req.setBody('{"fromLang":"auto-detect","text":"'+ad+'","to":"hi"}');
        HTTPResponse res = h.send(req);
        
        Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        System.debug(jsonBody);
        set<String> ss1 = new Set<String>();
        Set<String> ss = jsonBody.KeySet();
        System.debug(ss);
        for(String az: ss)
        {
            System.debug(az);
        }
        System.debug(jsonbody.get('translatedText'));
       	String fg = (String)jsonbody.get('translatedText');
        aa[0].name = fg;
        update aa;
    }
}