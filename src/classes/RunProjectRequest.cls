/**
 * @author Keetener Rodrigo
 */
public class RunProjectRequest {
    public String name;
    public String code;
    public String status;
    public Date startDate;
    public Date endDate;
    public Double budget;

    public RunProjectRequest () {
        this.budget = 999999;
    }

    override
    public String toString () {
        return JSON.serialize(this);
    }
}