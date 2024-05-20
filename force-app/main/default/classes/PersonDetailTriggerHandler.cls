public class PersonDetailTriggerHandler {
    public static void handleUpdateDescription(List<PersonDetail__c> newList, Map<Id,PersonDetail__c> oldMap){
        
        for(PersonDetail__c person : newList){
            if(person.PersonPhone__c != oldMap.get(person.Id).PersonPhone__c){
                person.Description__c = 'The Phone Number was updated to '+ person.PersonPhone__c + ' from ' + oldMap.get(person.Id).PersonPhone__c;
            }
            if(person.PersonEmail__c != oldMap.get(person.Id).PersonEmail__c){
                person.Description__c = '\nThe Email was updated to '+ person.PersonEmail__c + ' from ' + oldMap.get(person.Id).PersonEmail__c;
            }
            if(person.PersonPhone__c != oldMap.get(person.Id).PersonPhone__c && person.PersonEmail__c != oldMap.get(person.Id).PersonEmail__c){
                person.Description__c = 'The phone number and email was updated.';
            }
        }
    }
}