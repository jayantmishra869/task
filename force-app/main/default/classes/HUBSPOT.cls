public class HUBSPOT 
{
   // public String code{get;set;}
    public static PageReference mymeth()
    {
        
        PageReference pref = new PageReference('https://app.hubspot.com/oauth/authorize?client_id=bb092769-648f-47d3-b357-73538a25a1bf&redirect_uri=https://cyntexa-4bb-dev-ed--c.visualforce.com/apex/hubspotCodePage?core.apexpages.request.devconsole=1&scope=crm.objects.contacts.read%20crm.objects.contacts.write');
        pref.setRedirect(true);
        return pref;
    }
    
    public static void getcode()
    {
        
        String code = ApexPages.currentPage().getparameters().get('code');
        system.debug(code);
        http h = new Http();
        HttpRequest hreq = new HttpRequest();
        hreq.setEndpoint('https://api.hubapi.com/oauth/v1/token?grant_type=authorization_code&client_id=bb092769-648f-47d3-b357-73538a25a1bf&client_secret=859d4946-d5e5-49d0-a9fd-5370ec4ab298&redirect_uri=https://cyntexa-4bb-dev-ed--c.visualforce.com/apex/hubspotCodePage?core.apexpages.request.devconsole=1&code='+code);
        hreq.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        hreq.setMethod('POST');
        HttpResponse hres = h.send(hreq);
        system.debug(hres.getBody());
        Map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(hres.getBody());
        String rtoken = (String)data.get('refresh_token');
        String atoken = (String)data.get('access_token');
        if(rtoken!=null)
        {
            hubspot__c RT = new hubspot__c(Name = 'Hubspot', Rtoken__c = rtoken);
            insert RT;
        }
        
    }
}