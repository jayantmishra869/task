@RESTResource(urlMapping='/fieldset/')
global class fieldSetAPI 
{
	@HTTPPost
    global static List<List<sObject>> getQuery()
    {   
        RestRequest req = RestContext.request;
        
        String jsonBody = req.requestBody.toString();
        System.debug(jsonBody);
        
        Map<String, String> m = (Map<String, String>)JSON.deserialize(jsonBody, Map<String, String>.class);
        System.debug(m);
   		String v;
        for(String key: m.KeySet())
        {
            v = m.get(key);
        }
        System.debug(v);
      	String query = 'SELECT ';
        
		for(Schema.FieldSetMember f : SObjectType.Account.FieldSets.AccountFieldSet.getFields())
		{
			query += f.getFieldPath() + ', ';
		}
        
		query += 'id FROM Account where id= :v';
        List<List<sObject>> sObjectListn = new List<List<sObject>>();
		List<sObject> o = [SELECT Name, AccountID FROM Opportunity WHERE AccountID = :v];
        List<sObject> c =[SELECT lastName, AccountId FROM Contact WHERE AccountID = :v];
		list<sObject> oppor = Database.Query(query);
        
      //  oppor.addAll(o);
      //  oppor.addAll(c);
        sObjectListn.add(oppor);
        sObjectListn.add(o);
        sObjectListn.add(c);
        //map<Id,sObject>MyMap = new map<Id,sObject>(oppor);
        System.debug(oppor);
        for(sObject a: oppor)
        {
            System.debug(a);
        }
        return sObjectListn;
        //String s=JSON.serialize(sObjectListn);
        
    }
}