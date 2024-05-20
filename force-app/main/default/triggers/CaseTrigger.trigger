trigger CaseTrigger on New_Case__e (after insert) {
    
    for (New_Case__e event : Trigger.New) {
      
           System.debug(event.Origin__c);
           System.debug(event.Status__c);
           Account acc = new Account();
           acc.name = 'Mirketa abc';
           insert acc;
   }
    
}