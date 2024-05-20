/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/Candidates/*')
global class CandidateWebService{
    @HttpPost
    global static ID createCandidate(String name,String candPhone, String candEmail){
       Candidate__c cnd = new Candidate__c(Name=name,Phone__c=candPhone,Email__c=candEmail);
       insert cnd;
       return cnd.Id;
    }
}