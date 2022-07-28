public class test14 
{
    public static void q1() // Show Opportunities which are related to product
    {	/*{
        List<opportunity> oppList = [Select name,id from opportunity];
        List<opportunityLineItem> proList = [Select name,product2Id from opportunityLineItem where opportunity.id in :oppList];
        System.debug(proList);
    }
        List<Opportunity> o = [SELECT Name, Id FROM Opportunity];
        List<OpportunityLineItem> OLI=[select opportunity.name,product2.name from OpportunityLineItem];
    	for(OpportunityLineItem o1: oli)
        {
                    System.debug(o1.Opportunity.name +' '+ o1.product2.name);
        }*/
        /*for(Opportunity o : oppList){
            for(OpportunityLineItem oli : oliList){
                if(o.Id == oli.OpportunityId){
                    System.debug(oli.product2.name);
                }
            }
        }*/
        List<Opportunity> op = [SELECT Name, Id From Opportunity];
        List<Product2> pro = [SELECT Name, Id From Product2];
        List<OpportunityLineItem> opp = [SELECT Name, OpportunityID, Product2ID FROM OpportunityLineItem];
        
        List<List<String>> pr=new List<List<String>>();
        List<Opportunity> ol=new List<Opportunity>();
        integer i=0;
        for(OpportunityLineItem oli: opp)
        {
            for(opportunity o:op)
            {
         		if(o.id == oli.opportunityId)
                {
                    ol.add(o);
                    for(product2 p:pro)
                    {
                        if(p.id==oli.Id)
                        {
                            pr[i].add(p.name);
                        }
                    }
                    i++;
                }
            }
        }
        i=0;
        for(Opportunity o:ol)
        {
            System.debug(o);
            System.debug(pr[i]);
            i++;
        }
    }
}