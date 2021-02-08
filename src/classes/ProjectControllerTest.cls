/**
 * @author Keetener Rodrigo
 */
@isTest
public with sharing class ProjectControllerTest {

    @isTest
    public static void givenValidProjectInfoWhenCallServiceThenCreateNewProject(){
        Test.startTest();

        AgileProject agileProject = new AgileProject();
        agileProject.name = 'Teste';
        agileProject.externalId = '66656565656';
        agileProject.startDate = Date.today();
        agileProject.endDate = Date.today().addDays(10);

        Project__c createdProject = ProjectController.create(agileProject);

        Test.stopTest();

        System.assert(createdProject != null);
        System.assert(createdProject.Id != null);
        System.assertEquals(agileProject.externalId, createProject.ExternalId__c);
    }

    @isTest
    public static void givenInvalidProjectIdWhenCallFindProjectServiceThenReturnError(){
        RestContext.request = new RestRequest();
        RestContext.response = new RestResponse();

        Test.startTest();

        ProjectController.getProjects();

        Test.stopTest();

        Integer responseCode = RestContext.response.statusCode;
        String responsePayload = String.valueOf(RestContext.response.responseBody);

        System.assertEquals(400, responseCode);
        
    }

    // @isTest
    // public static void givenProjectIdWhenCallFindProjectServiceThenReturnSucessProjectInfo(){
    //     RestContext.request = new RestRequest();
    //     request.param = new Map<String,String>{ 'id' => };
    //     RestContext.response = new RestResponse();

    //     Test.startTest();

    //     ProjectController.getProjects();

    //     Test.stopTest();

    //     Integer responseCode = RestContext.response.statuscode;
    //     String responsePayLoad = String.valueOf(RestContext.response.responseBody);

    //     System.assertEquals(400, responseCode);
        
    // }
}