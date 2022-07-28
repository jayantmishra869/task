public class Ass5Q3 {
    public String selectedAcc{get;set;}
    public String accId{get;set;}
    public List<Product2> Pro{get;set;}
    public Account selId{get;set;}
    public Ass5Q3()
    {
       
    }
    public List<SelectOption> getaccList()
    {
        List<SelectOption> opt = new List<SelectOption>();
        List<Account> acc = [Select Name from Account];
        for(Account a:acc)
        {
            opt.add(new SelectOption(a.Name,a.Name));
        }
        return opt;
    }
    
    public void accIds()
    {
        selId = [Select Id, Name, Type, Phone from Account where Name Like :selectedAcc limit 1];
        accId = selId.Id;
        List<Opportunity> oppList = [select Id,name from opportunity where AccountId = :accId];
        List<String> OppIds = new List<String>();
        for(Opportunity o : opplist){
            OppIds.add(o.Id);
        }
        
        List<OpportunityLineItem> olive = [select Product2Id from opportunitylineitem where OpportunityId in :OppIds];
        List<String> prod = new List<String>();
        for(Opportunitylineitem oli : olive){
            prod.add(oli.product2id);
        }
        
        Pro = [Select Id, Name from product2 where Id in :prod];
        system.debug(Pro);
        //PageReference pf = new PageReference('https://cyntexa-4a2-dev-ed--evolution.visualforce.com/apex/Assignment5Q3?id='+accId);
        //return pf;
    }
    
    
}