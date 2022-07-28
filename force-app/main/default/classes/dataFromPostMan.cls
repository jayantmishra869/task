@RESTResource(urlMapping='/AccConOpp/*')
global class dataFromPostMan 
{
    @HTTPPost
	global static void Getting()
    {
        String AccName, OppName, ConName, StageNamee;
        Date CloseDatee;
        String fieldname, fieldvalue, fieldLastName;
        List<Account> accList = new List<Account>();
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
         String jsonBody = req.requestBody.toString();
        
        JSONParser parser = JSON.createParser(jsonBody);
         Account ac =NEW aCCOUNT();
         While(Parser.nextToken()!=null)
         {
            if(Parser.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldname = parser.getCurrentName();
                fieldvalue = parser.getText();
                System.debug('f= '+fieldvalue + 'fn= '+fieldname);
                if(fieldname == 'Name' && fieldvalue != 'Name')
                {
                    AccName = fieldvalue;
                    Account aa = new Account(Name=AccName);
                    System.debug(aa);
                 
                    insert aa;
                    ac=aa;
                }
                else if(fieldName == 'LastName' && fieldvalue != 'LastName')
                {
                    ConName = fieldvalue;
                   
                    System.debug(ac);
					String accid = ac.id;
                    Contact cc = new Contact(lastName = ConName, AccountId = accid);
                    insert cc;
                    System.debug(cc);
                }
                else if(fieldName == 'Nameopp' && fieldvalue != 'Nameopp')
                {
                    OppName = fieldvalue;
                    System.debug('oppName= '+OppName);
                }
                else if(fieldName == 'Stage' && fieldvalue != 'Stage')
                {
                    StageNamee = fieldvalue;
                    System.debug('StageName '+StageNamee);
                }
                else if(fieldName == 'CloseDate' && fieldvalue != 'CloseDate')
                {
                    CloseDatee = Date.parse(fieldvalue);
                    String ao = ac.id;
                    Opportunity o = new Opportunity(Name=OppName, StageName=StageNamee, CloseDate=CloseDatee, AccountId=ao);
                    insert o;
                    System.debug('Opp= '+o);
                }
            }
            
        }
    }
}