public class SlackAPI 
{
    @future(callout=true)
	public static void d(String jsonString)
    {
        List<Opportunity> aa = (List<Opportunity>)json.deserialize(jsonString, List<Opportunity>.class);
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        req.setEndpoint('https://hooks.slack.com/services/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');
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        //req.setHeader('access_token', 'xoxe.xoxp-1-Mi0yLTM0OTQ4ODI4OTM3NTEtMzUxMTgzNTE2OTYzNi0zNDk1NTg0MDg1ODYzLTM1MTI1MzYzMTgzODgtMTMyMTliNTJkMWY0OTQ3ZDVhYjkyODMxYzhhOTcyNmUxMzg4ODZiMzJjZWYzYmViMzY2MWRhMTgyMzc5YmYzYg');
       
        req.setBody('{"text":"'+aa[0].Name+'"}');
        
        HTTPResponse res = h.send(req);
       // Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        //System.debug(jsonBody);
    }
}