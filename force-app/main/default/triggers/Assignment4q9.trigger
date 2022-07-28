trigger Assignment4q9 on Opportunity (before insert) 
{
   List<Opportunity> op = [SELECT Id, StageName FROM Opportunity WHERE StageName != 'Closed Won' AND StageName != 'Closed Lost' And CreatedById = :UserInfo.getUserId()];
    
   if(op.size()>2)
   {
       for(Opportunity o: trigger.new)
       {
           o.addError('Or kitni opportunity Bnayega');
       }
   }
}