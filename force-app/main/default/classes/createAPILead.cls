@RESTResource (urlMapping='/CreateingLeading/')
global class createAPILead 
{
    @HTTPPost
	global static String CreatingLeadRecord()
    {
        String FieldName, FieldValue;
        String fName, lName, comp;
        
        restRequest req = Restcontext.request;
        restResponse res = Restcontext.response;
        
        string jsonBody = req.requestBody.toString();
        
        JSONParser parser = JSON.createParser(jsonBody);
        
        while(parser.nextToken()!=null)
        {
            if(parser.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                if(fieldName == 'FirstName')
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
         lead l = new lead(FirstName = fName, LastName = lName, Company = comp);
            insert l;
            return l.id;
    }
}