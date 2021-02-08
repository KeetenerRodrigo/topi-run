/**
 * @author Keetener Rodrigo
 */
public class ZipCodeAddress {
    public String street;
    public String neighborhood;
    public String city;
    public String state;
    public String streetNumber;
    public String zipCode;

    override
    public String toString(){
        return JSON.serialize(this);
    }
}