/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-14-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/Contacts/*')
global  class ContactWebService{
    
    // '/services/apexrest/Contacts/RecordId'
    @HttpGet
    global static Contact getContact(){
        RestRequest request = RestContext.request;
        String contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Contact result =  [SELECT Name
                        FROM Contact
                        WHERE Id = :contactId];
        return result;
    }

    
    // '/services/apexrest/Contacts/'
    // {  
    //     "lastName" : "test webservice new"
    // }
    @HttpPost
    global static ID createContact(String lastName){
        Contact con = new Contact(LastName=lastName);
        insert con;
        return con.Id;
    }
    

    // '/services/apexrest/Contacts/'
    // {  
    //     "id" : "RecordId",
    //     "lastName" : "test webservice"
    // }
    @HttpPut
    global static Id upsertContact(String lastName,  String id) {
        Contact con = new Contact(
                Id=id,
                LastName=lastName
                );
        upsert con;
        return con.Id;
    }
    
    
    // '/services/apexrest/Contacts/RecordId' 
    //   {
    //     "Email" : "test@webservice.com",
    //     "Description" : "This is Test Description."
    //   }
    @HttpPatch
    global static Id updateContact() {
    RestRequest request = RestContext.request;
    String caseId = request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1);
    Contact con = [SELECT Id FROM Contact WHERE Id = :caseId];
    Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());   
    for(String fieldName : params.keySet()) {
        con.put(fieldName, params.get(fieldName));
    }
    update con;
    return con.Id;
    }



    // '/services/apexrest/Contacts/RecordId
    @HttpDelete
    global static void deleteContact(){
        RestRequest request = RestContext.request;
        String contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Contact con = [SELECT Id FROM Contact WHERE Id=:contactId];
        delete con;
    }
}