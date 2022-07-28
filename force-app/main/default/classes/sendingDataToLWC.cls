public with sharing class sendingDataToLWC {
    @AuraEnabled(cacheable=true)
    public static List<Account> AccList()
    {
        List<Account> AccountList = [SELECT Id, Name, NumberOfEmployees FROM Account ORDER BY CreatedDate desc Limit 10];
        return AccountList;
    }
}