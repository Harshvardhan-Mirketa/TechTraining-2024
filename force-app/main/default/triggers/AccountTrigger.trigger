trigger AccountTrigger on Account (after insert) {
    
        if(Trigger.isAfter && Trigger.isInsert){
          TriggerHandler.handleAfterInsert(Trigger.New);    
        }
    
      
}