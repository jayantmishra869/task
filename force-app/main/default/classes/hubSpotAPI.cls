public class hubSpotAPI 
{
    @future(callout=true)
    public static void hub(String jsonString)
    {
        System.debug(jsonString);
        List<Contact> aa = (List<Contact>)json.deserialize(jsonString, List<Contact>.class);
        System.debug(aa);
        String lstname = aa[0].LastName;
        String fstName = aa[0].FirstName;
        String Emaill = aa[0].Email;
        System.debug(lstname+ fstName+  Emaill);
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://api.hubapi.com/contacts/v1/contact/batch/?hapikey=56a98516-72e7-489f-ae93-0243743ee66a');
       // req.setEndpoint('https://api.hubapi.com/crm/v3/objects/contacts?limit=10&archived=false&hapikey=56a98516-72e7-489f-ae93-0243743ee66a');
        req.setMethod('POST');
        req.setHeader('content-Type', 'application/json');
      
		req.setBody('[{\"email\":\"'+Emaill+'\",\"properties\":[{\"property\":\"firstname\",\"value\":\"'+fstName+'\"},{\"property\":\"lastname\",\"value\":\"'+lstname+'\"}]}]');
        HTTPResponse res = h.send(req);
        System.debug(res);
        
        

   		// HTTPResponse res = h.send(req);
        /*System.debug(res.getBody());
    	Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        System.debug(jsonBody);*/
        
        
        /*List<Object> l1 = (List<Object>)jsonBody.get('results');
        system.debug(l1);
        //string lstname = (string) l1.get('lastname');
        for(object ll:l1){
        	string m = JSON.serialize(ll);
         	Map<String, Object> m1 = (Map<String, Object>) JSON.deserializeUntyped(m);
        	Map<String, Object> m2 = (Map<String, Object>)m1.get('properties');
        	System.debug(m2.get('lastname'));
            String n1 = (string)m2.get('lastname');
            String n2 = (string)m2.get('firstname');
            Contact con = new Contact(LastName=+n1, FirstName=+n2);
    		insert con;   
        }   */
    }
}