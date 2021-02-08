/**
 * @author Keetener Rodrigo
 */
public class RunProjectTransformer {

    public RunProjectRequest toProject (Project__c project) {

        RunProjectRequest request = new RunProjectRequest();

        request.name = project.ProjectName__c;
        request.code = project.Id;
        request.status = project.Status__c;
        request.startDate = project.StartDate__c;
        request.endDate = project.EndDate__c;
        request.budget = project.Budget__c;

        return request;
    }

    public Project__c toProject ( Project__c project ,  RunProjectResponse response ) {

        project.LastSyncDate__c = System.now();
        project.SynchronizationStatus__c = 'Integrado com sucesso';
        
        return project;
    }

    public Project__c toProject ( Project__c project ,  RunErrorResponse response ) {

        project.LastSyncDate__c = System.now();
        project.SynchronizationStatus__c = 'Erro na sincronização de projetos';
        project.ErrorMessage__c = response.errorMessage;

        return project;
    }
}