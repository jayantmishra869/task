trigger Assignment4q7 on Opportunity (after update) 
{
   /* List<Opportunity> oplist = new List<Opportunity>();
    for(Opportunity o: Trigger.Old)
    {
        Opportunity a = [SELECT]
    }
    insert oplist;*/
    List<Opportunity> opplist = new List<Opportunity>(); 
    for (Opportunity o: Trigger.Old) 
    { 
        Opportunity theClone = o.clone(false); 
        theClone.Name = o.Name + ' Backup'; 
        opplist.add(theClone); 
    } 
    insert opplist;
}