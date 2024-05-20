public class PersonDetailBatchClass implements Database.batchable<sObject>{ 
   public Database.QueryLocator start(Database.BatchableContext bc){ 
       System.debug([Select Id,Name from PersonDetail__c LIMIT 5]);
       return Database.getQueryLocator([Select Id,Name from PersonDetail__c LIMIT 5]);
   }     
    
    
   public void execute(Database.BatchableContext bc, List<PersonDetail__c> newList){
       System.debug(newList);
       
       for(PersonDetail__c a : newList){ 
           a.Name = 'Test' + a.Name; 
       } 
       update newList; 
   } 


    
   public void finish(Database.BatchableContext bc){     
   } 
}