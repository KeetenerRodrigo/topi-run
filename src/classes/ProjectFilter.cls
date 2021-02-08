/**
 * @author Keetener Rodrigo
 */
public virtual class ProjectFilter {

    virtual
    public List<Project__c> filterByChangedStatus(List<Project__c> newProjects, Map<Id,Project__c> oldProjects) {
 
        List<Project__c> filteredProjects = new List<Project__c>();

        for (Project__c project : newProjects) {
            if (project.Type__c != 'Enterprise' || project.Status__c != 'Iniciado'){
                continue; 
            } 

            if (oldProjects == null || oldProjects.isEmpty()) { 
                filteredProjects.add(project);
                continue;
            }

            Project__c oldProject = oldProjects.get(project.Id);

            if (oldProject.Status__c == project.Status__c){
                continue;
            } 

            filteredProjects.add(project);
        }

        return filteredProjects;
    }

    public List<String> convertSObjetList (List<SObject> records , String fieldName) {
        
        List<String> filtered = new List<String> ();

        for (SObject record : records) {
            filtered.add ( (String) record.get(fieldName) );
        }

        return filtered;
    } 
}