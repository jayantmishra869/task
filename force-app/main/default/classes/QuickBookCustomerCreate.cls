public class QuickBookCustomerCreate 
{
    @future(callout=true)
	public static void create(String jsonString)
    {
        
        List<Account> acc = (List<Account>)json.deserialize(jsonString, List<Account>.class);

        QuickBooks__c accessToken=[SELECT QuickBookAccessToken__c, Realm_ID__c FROM QuickBooks__c ORDER BY CreatedDate DESC Limit 1];
        System.debug(accessToken.Realm_ID__c);
        System.debug(accessToken.QuickBookAccessToken__c);
        String reamId=accessToken.Realm_ID__c;
        String Token = accessToken.QuickBookAccessToken__c;
        
        
       
        
        HTTP h1 = new HTTP();
        HTTPRequest req1 = new HTTPRequest();
        req1.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365230501170/vendor?minorversion=65');
        req1.setMethod('POST');
        req1.setHeader('Content-Type','application/json');
        req1.setHeader('grant-type', 'access_token');
        req1.setHeader('Accept','application/json');
        req1.setHeader('Authorization','Bearer '+token);
        req1.setBody('{\"DisplayName\":\"'+acc[0].Name+'\",\"Suffix\":\"Sr.\",\"Title\":\"Mr.\",\"Mobile\":{\"FreeFormNumber\":\"(650)555-2000\"},\"FamilyName\":\"Bradley\",\"TaxIdentifier\":\"99-5688293\",\"AcctNum\":\"35372649\",\"CompanyName\":\"DiannesAutoShop\",\"GivenName\":\"Dianne\",\"PrintOnCheckName\":\"DiannesAutoShop\"}');
        
        
        HTTPResponse res1 = h1.send(req1);
        Map<String, Object> m3 = (Map<String, Object>)json.deserializeUntyped(res1.getBody());
        System.debug(m3);
        Map<String, Object> m4 = (Map<String, Object>)m3.get('Vendor');
        System.debug(m4);
		String s=(String)m4.get('Id');
        System.debug(s);
        acc[0].Sic=s;
        update acc[0];
        System.debug(acc[0].Sic);
        
       /* HTTP h2 = new HTTP();
        HTTPRequest req2 = new HTTPRequest();
        req2.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365230501170/bill?minorversion=65');
        req2.setMethod('POST');
        req2.setHeader('Content-Type','application/json');
        req2.setHeader('grant-type', 'access_token');
        req2.setHeader('Accept','application/json');
        req2.setHeader('Authorization','Bearer '+token);
        req2.setBody('{\"Line\":[{\"DetailType\":\"AccountBasedExpenseLineDetail\",\"Amount\":200.0,\"Id\":\"1\",\"AccountBasedExpenseLineDetail\":{\"AccountRef\":{\"value\":\"7\"}}}],\"VendorRef\":{\"value\":\"'+s+'\"}}');
        
        
        HTTPResponse res2 = h2.send(req2);
        Map<String, Object> m5 = (Map<String, Object>)json.deserializeUntyped(res2.getBody());
        System.debug(m5);
       	Map<String, Object> m6 = (Map<String, Object>)m5.get('Bill');
        System.debug(m6);
        Map<String, Object> m7 = (Map<String, Object>)m6.get('VendorRef');
        System.debug(m7);
        String n = (String)m7.get('name');
        String v = (String)m7.get('value');
        System.debug('Name= '+n+' Value= '+v);
        
        
        HTTP h3 = new HTTP();
        HTTPRequest req3 = new HTTPRequest();
        req3.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365230501170/billpayment?minorversion=65');
        req3.setMethod('POST');
        req3.setHeader('Content-Type','application/json');
        req3.setHeader('grant-type', 'access_token');
        req3.setHeader('Accept','application/json');
        req3.setHeader('Authorization','Bearer '+token);
        req3.setBody('{\"PrivateNote\":\"Acct.1JK90\",\"VendorRef\":{\"name\":\"'+n+'\",\"value\":\"'+v+'\"},\"TotalAmt\":200.0,\"PayType\":\"Check\",\"Line\":[{\"Amount\":200.0,\"LinkedTxn\":[{\"TxnId\":\"234\",\"TxnType\":\"Check\"}]}],\"CheckPayment\":{\"BankAccountRef\":{\"name\":\"Advertising\",\"value\":\"35\"}}}');
        
        HTTPResponse res3 = h3.send(req3);
        Map<String, Object> m8 = (Map<String, Object>)json.deserializeUntyped(res3.getBody());
        System.debug(m8);*/
        
        
    }
}