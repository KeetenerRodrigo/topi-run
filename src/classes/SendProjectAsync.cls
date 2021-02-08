/**
 * @author Keetener Rodrigo
 */
public class SendProjectAsync {

    List<Project__c> projects;

    public SendProjectAsync (List<Project__c> projects) {
        this.projects = projects;
    }

    @future (callout=true)
    public static void sendProject (List<String> projectIds) {  
        ProjectRepository repository = new ProjectRepository();

        List<Project__c> projects = repository.findByIds(projectIds);

        SyncProjectOutbound service = new SyncProjectOutbound();
        
        for (Project__c project : projects) {    
            service.sendProject(project);
        }

        repository.store(projects);
    }
}