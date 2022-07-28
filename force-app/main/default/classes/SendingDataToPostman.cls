@RestResource(urlMapping='/Opportunity/')
global class SendingDataToPostman 
{
    @HTTPGet
	global static List<Opportunity> opp()
    {
        List<Opportunity> result = [SELECT Name FROM Opportunity Order By CreatedDate DESC limit 1];
        return result;
    }   
}