public class DeveloperTriggerHandlder{
    public static void fillOrganizationField(List<Software_Developer__c> devList){
        Map<String, Schema.SObjectType> describeResult = Schema.getGlobalDescribe();
        for(Schema.SObjectField strFld : describeResult.get('Software_Developer__c').getDescribe().fields.getMap().values()){
            System.debug(strFld.getDescribe().getLabel());
            if(strFld.getDescribe().getLabel()=='Organization'){
                for(Software_Developer__c dev : devList){
                     dev.Organization__c = 'Mirketa';
                }
            }
        }
    }
}