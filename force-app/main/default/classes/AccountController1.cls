public class AccountController1{
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccList(){
        return [SELECT Id, Name FROM Account ORDER BY CreatedDate desc Limit 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccList(String Keyword){
        String key='%'+Keyword+'%';
        return [SELECT Id, Name FROM Account WHERE Name LIKE :key ORDER BY CreatedDate desc];
    }
}