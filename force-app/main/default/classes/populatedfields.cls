public class populatedfields
{ // this code is not working
	public static void debugFields()
    {
    	List<Account> aa = [SELECT Name, NumberOFEmployees FROM Account limit 1];
        Map<String, Object> z = new Map<String, Object>();
        Map<String, Object> fieldValues = new Map<String, Object>();
        Integer i = 0;
        for (sObject obj : aa) 
        {
      		fieldValues = obj.getPopulatedFieldsAsMap();
            //System.debug(fieldValues);
            Set <String> sq = fieldValues.KeySet();
            HTTP h = new HTTP();
		    HTTPRequest req = new HTTPRequest();
            for(String sz: sq)
            {
        		req.setEndpoint('https://cheap-translate.p.rapidapi.com/translate');
        		req.setMethod('POST');
        		req.setHeader('content-type', 'application/json');
        
				req.setHeader('X-RapidAPI-Host', 'cheap-translate.p.rapidapi.com');
       	 		req.setHeader('X-RapidAPI-Key', '5b84210811mshaf7a5911217d3fbp1e5fbbjsnfd256feea4a1');
        	
        		req.setBody('{"fromLang":"auto-detect","text":"'+fieldValues.get(sz)+'","to":"hi"}');
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
                aa[i].name = fg;
                
            }
        }
    }
}