/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-15-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger CreateOpportunityTrigger on Account (after insert) {

    // if (Trigger.isAfter && Trigger.isInsert) {
    //     CreateOpportunityTriggerHandler.createOpportunity(Trigger.new);
    // }

    if(Trigger.isAfter && Trigger.isInsert){
        CreateOpportunityTriggerHandler.createOpportunityUserMode(Trigger.new);
    }
}