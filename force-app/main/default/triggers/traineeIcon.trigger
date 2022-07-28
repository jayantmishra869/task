trigger traineeIcon on trainee__c (before insert, before update) 
{
	trainee__c aa = Trigger.New[0];

        if(aa.Overall_Marks__c>=3 && aa.Overall_Marks__c<6)
        {
            aa.icon__c='action:approval';
           	System.debug(aa.icon__c);
        }
        else if(aa.Overall_Marks__c<3 && aa.Overall_Marks__c>=0)
        {
            aa.icon__c='action:close';
            	System.debug(aa.icon__c);
        }
    System.debug(aa);
    
}