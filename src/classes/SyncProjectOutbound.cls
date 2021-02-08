/**
 * @author Keetener Rodrigo
 */
public class SyncProjectOutbound {

    RunProjectTransformer transformer;
    ProjectRepository repository;

    public SyncProjectOutbound () {
        transformer = new RunProjectTransformer();
        repository = new ProjectRepository();
    }

    public Project__c sendProject (Project__c project) {
        
        Http http = new Http();
        HttpResponse response = http.send(build(project));

        if (response.getStatusCode() != 200) {
            RunErrorResponse errorResponse = (RunErrorResponse) JSON.deserialize(response.getBody(), RunErrorResponse.class); 
            project = transformer.toProject(project, errorResponse);
        }
        
        RunProjectResponse projectResponse = (RunProjectResponse) JSON.deserialize(response.getBody() , RunProjectResponse.class); 
        project = transformer.toProject(project, projectResponse);

        return project;
    }


    private HttpRequest build (Project__c project) {

        HttpRequest request = new HttpRequest ();
        request.setEndpoint('https://run.mocky.io/v3/58d750c1-31bf-45ae-b361-bedecacf55a2');
        request.setMethod('PUT');
        request.setHeader('Content-Type', 'application/json');

        RunProjectRequest projectRequest = transformer.toProject(project);

        String payload = JSON.serialize(projectRequest);

        request.setBody(payload);

        return request;
    }

}