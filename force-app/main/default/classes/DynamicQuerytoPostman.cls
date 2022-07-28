@RESTResource(urlMapping='/Object/')
global class DynamicQuerytoPostman 
{
	@HTTPPost
    global static List<sObject> naim()
    {   
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String jsonBody = req.requestBody.toString();
        System.debug(jsonBody);
        String jsonString = jsonBody;
        
        Map<String,List<String>> m = (Map<String,List<String>>)JSON.deserialize(jsonString, Map<String,List<String>>.class);
        System.debug(m);
        Set<String> strSet =m.keySet();
        List<String> strList = new List<String>();
       	for(String s: strSet)
        {
            for(String s2: m.get(s))
            {
                strList.add(s2);
            }
        }
        System.debug('strList'+strList);
        String qr = 'SELECT Id';
        String f = strList[0];
        Integer g = strList.size();
        for(Integer i = 1; i < g; i++)
        {
            qr = qr + ', '+ strList[i];
        }
        
        qr = qr + ' FROM '+ f;
        List<sObject> List2 = database.query(qr);
        System.debug(List2);
        return List2;
    }
}