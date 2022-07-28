@RESTResource (urlMapping = '/CreateLead/')
global class CreateLeadAPI 
{
	@HTTPPost
    global static string CreartingLeadRecord()
    {
        String fName, lName, Comp;
        String fieldName, FieldValue;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String jsonBody = req.requestBody.toString();
        
        JSONParser parser = JSON.createParser(jsonBody);
        
        While(parser.nextToken()!=null)
        {
            if(Parser.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                if(fieldName == 'firstName')
                {
                     fName = fieldValue;
                }
                else if(fieldName == 'LastName')
                {
                    lName = fieldValue;
                }
                else if(fieldName == 'Company')
                {
                    comp = fieldValue;
                }
            }
        }
        Lead l = new Lead(FirstName = fName, LastName = lName, Company = comp);
        insert l;
        return l.id;
    }
}