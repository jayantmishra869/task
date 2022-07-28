public class StripeAPIpayment 
{	
    @future(callout=true)  // trigger : OppAPI
	public static void pay(String jsonString)
    {
        System.debug(jsonString);
        List<Opportunity> oppList = (List<Opportunity>)json.deserialize(jsonString,List<Opportunity>.class);
        
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        req.setEndpoint('https://api.stripe.com/v1/products');
        req.setMethod('POST');
        
        req.setHeader('Authorization', 'Bearer sk_test_51Kxl8xSBilsdLHIZcGXyDEkDPFzYJGdeuCcYhbCefS1dbiBDz3pV11KfrYeJRWliKQfTgYhGZQwq2vA6pc97jPd7005E4EQm4i');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
 		String sz = oppList[0].name;
        
        req.setBody('name='+sz);
       
        HTTPResponse res = h.send(req);
        Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(res.getBody());
        System.debug(jsonBody);
        object aa= jsonBody.get('id');
        System.debug(aa);
        
        
        HTTP h1 = new HTTP();
        HTTPRequest req1 = new HTTPRequest();
        
        req1.setEndpoint(' https://api.stripe.com/v1/prices');
        req1.setMethod('POST');
        
        req1.setHeader('Authorization', 'Bearer sk_test_51Kxl8xSBilsdLHIZcGXyDEkDPFzYJGdeuCcYhbCefS1dbiBDz3pV11KfrYeJRWliKQfTgYhGZQwq2vA6pc97jPd7005E4EQm4i');
        req1.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        //Object in = oppList[0].Amount;
        req1.setBody('currency='+'USD'+'&unit_amount='+(integer)oppList[0].Amount+'&product='+aa);
       
        HTTPResponse res1 = h.send(req1);
        Map<String, Object> jsonBody1 = (Map<String, Object>)json.deserializeUntyped(res1.getBody());
        System.debug(jsonBody1);
        object ab= jsonBody1.get('id');
        System.debug(ab);
        
        
        
        HTTP h2 = new HTTP();
        HTTPRequest req2 = new HTTPRequest();
        
        req2.setEndpoint('https://api.stripe.com/v1/payment_links');
        req2.setMethod('POST');
        
        req2.setHeader('Authorization', 'Bearer sk_test_51Kxl8xSBilsdLHIZcGXyDEkDPFzYJGdeuCcYhbCefS1dbiBDz3pV11KfrYeJRWliKQfTgYhGZQwq2vA6pc97jPd7005E4EQm4i');
        req2.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        req2.setBody('line_items[0][price]='+ab+'&line_items[0][quantity]='+1);
       
        HTTPResponse res2 = h.send(req2);
        Map<String, Object> jsonBody2 = (Map<String, Object>)json.deserializeUntyped(res2.getBody());
        System.debug(jsonBody2);
        String s=(string)jsonBody2.get('url');
        system.debug(s);
        
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String toA = oppList[0].Email__c;
        string[] to = new string[] {toA};
        mail.setToAddresses(to);
        mail.setSubject('Test Mail');
        String fullFileURL = URL.getSalesforceBaseUrl().toExternalForm() +'/' + s;
        mail.setHtmlBody('<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + s + '">' + s + '</a>');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}