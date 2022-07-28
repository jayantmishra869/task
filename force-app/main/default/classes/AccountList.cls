public class AccountList 
{
   
    public list<account> aList{get;set;}
    date d = date.today();
   
    public AccountList(ApexPages.StandardController s)
    {
        aList = [select name, id from account  where createdDate=:d];
        system.debug(aList);
    }

}