/**
 * @author Keetener Rodrigo
 */
public class ProjectTH extends TriggerHandler {

    List<Project__c> newProjects;

    Map<Id,Project__c> oldProjects;

    ProjectFilter filter;

    public ProjectTH(){
        this((List<Project__c>) Trigger.new, (Map<Id, Project__c>) Trigger.oldMap);
    }
    
    public ProjectTH(List<Project__c> newProjects, Map<Id,Project__c> oldProjects) {
        this.newProjects = newProjects;
        this.oldProjects = oldProjects;

        this.filter = new ProjectFilter();
    }

    override
    public void afterUpdate() {
        sendProjectsToLegacySystem();
    }
    
    public void sendProjectsToLegacySystem () {
        List<Project__c> filteredProjects = this.filter.filterByChangedStatus(newProjects, oldProjects);
        
        if (!filteredProjects.isEmpty()){
            SendProjectAsync.sendProject(this.filter.convertSObjetList(filteredProjects, 'Id'));
        } 
    } 

}