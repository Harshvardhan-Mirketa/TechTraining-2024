/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-15-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/Cases/*')
global  class CaseWebService{
    
    // '/services/apexrest/Cases/RecordId'
    @HttpGet
    global static Case getCase(){
        RestRequest request = RestContext.request;
        String CaseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case result =  [SELECT Id
                        FROM Case
                        WHERE Id = :CaseId];
        return result;
    }

    
    // '/services/apexrest/Cases/'
    // {  
    //     "status" : "New",
    //     "origin" : "Web"
    // }
    @HttpPost
    global static ID createCase(String status, String origin){
        Case cs = new Case(Status=status, Origin=origin);
        insert cs;
        return cs.Id;
    }
    

    // '/services/apexrest/Cases/'
    // {  
    //     "id" : "RecordId",
    //     "status" : "Working"
    // }
    @HttpPut
    global static Id upsertCase(String description) {
        RestRequest request = RestContext.request;
        String CaseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case result =  [SELECT Description
                        FROM Case
                        WHERE Id = :CaseId];
        result.Description = description;
        upsert result;
        return result.Id;
    }
    
    
    // '/services/apexrest/Cases/RecordId' 
    //   {
    //     "Description" : "This is Test Description."
    //   }
    @HttpPatch
    global static Id updateCase() {
    RestRequest request = RestContext.request;
    String caseId = request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1);
    Case cs = [SELECT Id FROM Case WHERE Id = :caseId];
    Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());   
    for(String fieldName : params.keySet()) {
        cs.put(fieldName, params.get(fieldName));
    }
    update cs;
    return cs.Id;
    }



    // '/services/apexrest/Cases/RecordId
    @HttpDelete
    global static void deleteCase(){
        RestRequest request = RestContext.request;
        String CaseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case cs = [SELECT Id FROM Case WHERE Id=:CaseId];
        delete cs;
    }
}