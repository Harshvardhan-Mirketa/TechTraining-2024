trigger NumberofAccount on Contact (after insert, after delete) {
    if( Trigger.isAfter ) {
    if(Trigger.isDelete){
        NumberofAccountTriggerHandler.handleTrigger(Trigger.old);
    }
    if(Trigger.isInsert){
        NumberofAccountTriggerHandler.handleTrigger(Trigger.new);
    }
    }
}