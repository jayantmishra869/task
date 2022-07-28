public with sharing class AccountController
 {
     @AuraEnabled(cacheable=true)
     public static List<Account> getAccList(){
         return [SELECT Id, Name FROM ACCOUNT ORDER BY CreatedDate desc Limit 10];

     }

     @AuraEnabled
     public static List<Opportunity> getOppdata(){
         return [SELECT Name FROM Opportunity Limit 10];
     }

     @AuraEnabled(cacheable=true)
     public static List<Opportunity> getOppList(){
         return [SELECT Id, Name, CreatedDate, StageName FROM Opportunity ORDER BY CreatedDate desc Limit 10];

     }

     @AuraEnabled(cacheable=true)
     public static List<Contact> getConList()
     {
        return [SELECT Id, lastName, firstName, AccountId FROM Contact ORDER BY CreatedDate desc Limit 10];
     }

     @AuraEnabled(cacheable=true)
     public static Account getSingleAccount(){
        return [SELECT Id, Name FROM Account ORDER BY CreatedDate desc Limit 1];
     }


     @AuraEnabled(cacheable=true)
     public static List<Account> getAccount()
     {
        return [SELECT Id, Name,(SELECT firstName, lastName FROM contacts) FROM Account];
     }


      @AuraEnabled(cacheable=true)
      public static List<Account> getAccConOpp()
      {
         return [SELECT Id, Name, (SELECT firstName, lastName FROM contacts), (SELECT Name FROM Opportunities) FROM Account];
      }

     @AuraEnabled(cacheable=true)
     public static List<Contact> getContact()
     {
        return [SELECT Id, lastName, firstName, AccountId FROM Contact WHERE AccountId!=null];
     }

     @AuraEnabled(cacheable=true)
     public static List<QuizApp__c> getquizz()
     {
        return [SELECT Name, Question__c, a__c, b__c, c__c, Correct_Answe__c FROM QuizApp__c];
     }

    @AuraEnabled(cacheable=true)
    public static List < Account > fetchAccounts() {

        return [ SELECT Id, Name, Industry,
               ( SELECT Id, FirstName, LastName FROM Contacts ),
               ( SELECT Id, Name, StageName FROM Opportunities ) FROM Account ];   
    }

    @AuraEnabled(cacheable=true)
    public static List<realEstate__c> getReal(){
       return [SELECT Name, imgUrl__c, (SELECT Name, Phone__c FROM realEstateContact__r) FROM realEstate__c];
    }

     @AuraEnabled(cacheable=true)
     public static List<realEstateContact__c> getRecords(String recordId){
         String param = (string)recordId;
         System.debug(param);
         List<realEstateContact__c> RealEstateContact = [SELECT Phone__c FROM realEstateContact__c WHERE realEstate__c =:param];
         System.debug(RealEstateContact);
         return RealEstateContact;
     }
      @AuraEnabled(cacheable=true)
      public static List<realEstateContact__c> realEstateContact(){
         return [SELECT Name, Phone__c FROM realEstateContact__c];
      }

      @AuraEnabled
      public static List<Courses__c> getCoursesdata(){
         return [SELECT Name, (SELECT Name, Overall_Marks__c,icon__c FROM trainees__r) FROM Courses__c];
      }

      @AuraEnabled
      public static List<ContentDocumentLink> fetchFiles(String recordId){
         System.debug('reco= '+recordId);
         return[SELECT Id, LinkedEntityId, ContentDocumentId,Visibility, IsDeleted, ShareType,ContentDocument.Title,ContentDocument.createdDate, ContentDocument.FileType FROM ContentDocumentLink WHERE LinkedEntityId =:recordId];
      }

      @AuraEnabled
      public static List<ContentVersion> getfetchDetail(String recordId) {
         System.debug('recordId= '+recordId);
         List<ContentDocumentLink> contentDocumentList = [SELECT ContentDocumentId, LinkedEntityId 
                                                    FROM   ContentDocumentLink 
                                                    WHERE  LinkedEntityId =: recordId];
         Set<Id> contentDocumentId = new Set<Id>();
    
         for(ContentDocumentLink cdl : contentDocumentList){
         contentDocumentId.add(cdl.ContentDocumentId);
         }  
    
         List<ContentVersion> contentVersionList = [SELECT Id, VersionData, FileType, Title, FileExtension,
                                            ContentDocument.CreatedBy.Name, ContentDocument.ContentSize,
                                            CreatedDate, ContentDocumentId, ContentDocument.FileType
                                            FROM   ContentVersion 
                                            WHERE  ContentDocumentId IN :contentDocumentId];
         return contentVersionList;
      }

      @AuraEnabled
      public static void deleteFile(String deleteFileId){
         System.debug('deleteFileId= '+deleteFileId);
         database.delete(deleteFileId);
      }

      @AuraEnabled
      public static void sendmail(String email, String body, String fileId)
      {
         System.debug(email);
         System.debug(body);
         System.debug(fileId);

         ContentVersion contentVersionList = [SELECT Id, Title, FileExtension FROM ContentVersion WHERE ContentDocumentId = :fileId Limit 1];
         
         Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
         attach.setContentType('application/'+contentVersionList.FileExtension);
         attach.setFileName(contentVersionList.Title);
         attach.setInline(false);
         
         attach.body = Blob.valueOf(contentVersionList.Title);

         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         String[] toAddress = new String[]{email};
         mail.setToAddresses(toAddress); 
         mail.setSubject('Notes & Attachments');
         mail.setPlainTextBody(body);
         mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach });
         Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
      }
}