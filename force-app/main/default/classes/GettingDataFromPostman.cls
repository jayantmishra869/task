@RESTResource(urlMapping='/Accounti/*')
global class GettingDataFromPostman 
{
    @HTTPPost
	global static String Getting()
    {
        String Name;
        Integer NumberOfEmployeess;
       	Integer NumOfEmployees;
        String fieldname, fieldvalue;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String jsonBody = req.requestBody.toString();
        
        JSONParser parser = JSON.createParser(jsonBody);
        
        While(Parser.nextToken()!=null)
        {
            if(Parser.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldname = parser.getCurrentName();
                fieldvalue = parser.getText();
                if(fieldname == 'name')
                {
                    name = fieldvalue;
                }
                else if(fieldname == 'NumberOfEmployees')
                {
                   	NumberOfEmployeess = NumOfEmployees;
                }
            }
            
        }
         Account a = new Account(Name = name, NumberOfEmployees = NumOfEmployees);
       		insert a;
       		return a.Id;    
	}
}