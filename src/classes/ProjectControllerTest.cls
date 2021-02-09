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
        System.assertEquals(agileProject.externalId, createdProject.ExternalId__c);
    }

    @isTest
    public static void givenInvalidProjectIdWhenCallFindProjectServiceThenReturnError(){
        RestContext.request = new RestRequest();
        RestContext.response = new RestResponse();

        Test.startTest();

        ProjectController.getProjects();

        Test.stopTest();

        Integer responseCode = RestContext.response.statusCode;
        String responsePayload = RestContext.response.responseBody.toString();

        System.assertEquals(400, responseCode);
    }

    @isTest
    public static void givenProjectIdWhenCallFindProjectServiceThenReturnSucessProjectInfo(){
        Project__c project = ProjectFixtureFactory.createProject('Test', Date.today(), Date.today().addDays(10));

        RestContext.request = new RestRequest();
        RestContext.request.addParameter('id', '' + project.id);
        RestContext.response = new RestResponse();

        Test.startTest();

        ProjectController.getProjects();

        Test.stopTest();

        Integer responseCode = RestContext.response.statuscode;
        String responsePayLoad = RestContext.response.responseBody.toString();

        Project__c retriviedProject = (Project__c) JSON.deserialize(responsePayLoad, Project__c.class);

        System.assertEquals(200, responseCode);
        System.assertEquals(project.Id, retriviedProject.Id);
    }
}