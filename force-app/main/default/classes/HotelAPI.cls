public class HotelAPI 
{
	public static void hotel()
    {
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://hotel-price-aggregator.p.rapidapi.com/search?q=jaipur');
        req.setMethod('GET');
        req.setHeader('X-RapidAPI-Key', 'cf9733bbe3mshe7016ec783250f8p154743jsn440c91818860');
        req.setHeader('X-RapidAPI-Host', 'hotel-price-aggregator.p.rapidapi.com');
        
        HTTPResponse res = h.send(req);
        List<Object> jsonBody = (List<Object>)json.deserializeUntyped(res.getBody());
        System.debug(jsonBody);
        List<HotelDetail__c> f = new List<HotelDetail__c>();
        for(Object l: jsonBody)
        {
            String m = JSON.serialize(l);
            Map<String, Object> m1 = (Map<String, Object>)json.deserializeUntyped(m);
            System.debug(m1);
            String g1 = (String)m1.get('coordenates');
            String g2 = (String)m1.get('shortName');
            System.debug('coordenates= '+g1+' shortName= ' +g2);
            System.debug('coordenates= '+g1);
            HotelDetail__c aa = new HotelDetail__c(coordenates__c = g1, ShortName__c = g2);
           	f.add(aa);
        }
        insert f;
        
    }
}