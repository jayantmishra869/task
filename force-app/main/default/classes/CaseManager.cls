@RestResource(urlMapping='/Account/')
global with sharing class CaseManager {
    @Httppost
    global static sObject getCaseById() {
        RestRequest request = RestContext.request;
        String jsonbody = request.requestbody.toString();
       	//map<string,object> x=(map<string,object>)json.deserializeUntyped(jsonbody);
        //id s=(id)x.get('id');
        // grab the accountId from the end of the URL
     //   String accId = request.requestURI.substring(
     //     request.requestURI.lastIndexOf('/')+1);
        Account result =  [SELECT name
                        FROM Account
                      	 Order By CreatedDate limit 1];
 
        return result;
    }
    
}