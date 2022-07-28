public class hubspotCode 
{
	public static void code()
    {
        HttpRequest req = new HttpRequest();
        req.setMethod('GET'); 
        req.setEndpoint('https://api.hubapi.com/contacts/v1/lists/all/contacts/recent');
        req.setHeader('Authorization', 'Bearer ' + 'CI67m6eQMBIHAAEAQAAAARjvlsEKINOBxxUokNo2MhQRotUiGj3NENF22hEU6bnG5nxYlzowAAAAQQAAAAAAAAAAAAAAAACAAAAAAAAAAAAAIAAAAAAA4AEAAAAAAAAAAAAAABACQhRAcXyhyptrK_hiQAdtQ7-U--w8oEoDbmExUgBaAA');
        Http http = new Http();
		HTTPResponse res = http.send(req);
        Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        System.debug(jsonBody);
        List<Object> l1 = (List<Object>)jsonBody.get('contacts');
        System.debug(l1[0]);
        
            string m = JSON.serialize(l1[0]);
            Map<String, Object> m1 = (Map<String, Object>) JSON.deserializeUntyped(m);
            System.debug(m1);
        	integer m2 = (integer)m1.get('canonical-vid');
        	System.debug(m2);
        	String ss = String.valueOf(m2);
        
        HttpRequest req1 = new HttpRequest();
        req1.setMethod('GET'); 
        req1.setEndpoint('https://api.hubapi.com/contacts/v1/contact/vid/'+ss+'/profile');
        req1.setHeader('Authorization', 'Bearer ' + 'CI67m6eQMBIHAAEAQAAAARjvlsEKINOBxxUokNo2MhQRotUiGj3NENF22hEU6bnG5nxYlzowAAAAQQAAAAAAAAAAAAAAAACAAAAAAAAAAAAAIAAAAAAA4AEAAAAAAAAAAAAAABACQhRAcXyhyptrK_hiQAdtQ7-U--w8oEoDbmExUgBaAA');
        Http http1 = new Http();
		HTTPResponse res1 = http1.send(req1);
        Map<String, Object> jsonBody1 = (Map<String, Object>)json.deserializeUntyped(res1.getBody());
        System.debug(jsonBody1);
        Map<String, Object> m6 = (Map<String, Object>)jsonBody1.get('properties');
        System.debug(m6);
        Map<String, Object> m7 = (Map<String, Object>)m6.get('hubspotscore');
        System.debug(m7);
        Double dd = Double.valueOf(m7.get('value'));
        System.debug(dd);
    }
}