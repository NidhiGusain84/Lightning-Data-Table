public with sharing class ContactController{
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContactListForDataTable(){
        List<Contact> conList = [SELECT Id, Name, Title, Phone, Email, Picture__c, Rank__c, AccountId, Account.Name
                                 FROM Contact
                                 WHERE AccountId != NULL
                                 WITH USER_MODE
                                 LIMIT 10];
        return conList;
    }

}