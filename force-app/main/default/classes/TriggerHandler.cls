public class TriggerHandler {    
    public static void handleAfterInsert(List<Account> acc){
        List<PersonDetail__c> newList = new List<PersonDetail__c>();
        for(Account a : acc){
            PersonDetail__c newObj = new PersonDetail__c();
            newObj.Name = a.Name;
            newObj.PersonPhone__c = a.Phone;
            newObj.PersonEmail__c = a.Email__c;
            newObj.Description__c = a.Description;
            newobj.PersonEmployeeID__c = (String)a.Id;
            newObj.ParentAccount__c = a.ParentId;
            newList.add(newObj);
        }
        insert newList;
    }
   
}