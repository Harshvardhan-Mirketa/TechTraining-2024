trigger PersonDetailTrigger on PersonDetail__c (before update) {
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
        	PersonDetailTriggerHandler.handleUpdateDescription(Trigger.new, Trigger.oldMap);
        }
    }
}