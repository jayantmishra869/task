public class AccountExtension {
   
    public list<account> aList{get;set;}
   
    public AccountExtension(ApexPages.StandardController s){
        aList = [select name from Account LIMIT 8];
    }

}