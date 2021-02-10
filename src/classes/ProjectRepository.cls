/**
 * @author Keetener Rodrigo
 */
public virtual class ProjectRepository {

    virtual
    public Project__c save(Project__c project) {
        if (project.Id == null) {
            return create(project);
        } 
        
        return store(project);
    }

    virtual
    public Project__c create(Project__c project) {
        insert project;
        return project;
    }

    virtual
    public List<Project__c> create(List<Project__c> projects) {
        insert projects;
        return projects;
    }

    virtual
    public Project__c store(Project__c project) {
        update project;
        return project;
    }

    virtual
    public List<Project__c> store(List<Project__c> projects) {
        update projects;
        return projects;
    }

    virtual
    public Project__c findById(String id) {
        
        List<Project__c> projects = findByIds ( new List<String> { id } );
        return !projects.isEmpty() ? projects.get(0) : null;
    }

    public List<Project__c> findByIds (List<String> ids) {
        return [SELECT Id, ExternalId__c, StartDate__c, 
            EndDate__c, Budget__c, ErrorMessage__c,
            ProjectName__c, Name, Status__c,
            LastSyncDate__c, SynchronizationStatus__c
            FROM Project__c 
            WHERE Id in :ids ];
    }
}