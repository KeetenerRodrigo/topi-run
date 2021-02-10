/**
 * @author Keetener Rodrigo
 */
public class SearchAddresCtrl {

    @AuraEnabled(cacheable=true)
    public static ZipCodeAddress searchAddress (String zipCode) {
        GetAddressOutbondService service = new GetAddressOutbondService();

        ZipCodeAddress address;

        try {
           address = service.findAddress(zipCode);
        } catch (Exception e ) {
            throw new AuraException (e.getMessage());
        }
        
        return address;
    }
}