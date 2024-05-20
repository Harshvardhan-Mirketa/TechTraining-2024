trigger DeveloperTrigger on Software_Developer__c(before insert){
    if(trigger.isInsert){
        DeveloperTriggerHandlder.fillOrganizationField(trigger.new);
    }
}