global class AccountBatchClassDesc implements Database.Batchable<sObject> 
    {
     
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Name FROM Account WHERE Name LIKE '%test%' LIMIT 50]);
    }
 
    global void execute(Database.BatchableContext bc, List<Account> accList) {
        
        for(Account acc : accList) {
            
            acc.Description = 'New Description';
        }
        update accList;
    }
 
    global void finish(Database.BatchableContext bc) {
        System.debug('Finish Method');
    }
    }