public class NumberofAccountTriggerHandler {
    public static void handleTrigger(List<Contact> con){
        Set<Id> accId = new Set<Id>();
        for(Contact c : con){
            accId.add(c.AccountId);
        }
        List<Account> acc = [SELECT Id,Name, (SELECT Id FROM Contacts) FROM Account WHERE ID in:accId];
        for(Account a : acc){
            List<Contact> cntcts = a.Contacts;
            a.No_of_Contacts__c = cntcts.size();
        }
        update acc;
    }
}