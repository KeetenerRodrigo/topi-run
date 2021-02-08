/**
 * @author Keetener Rodrigo
 */
public class GetAddressOutbondService {
    ZipCodeAddressTransformer zipCodeAddressTransformer;

    public GetAddressOutbondService(){
        zipCodeAddressTransformer = new ZipCodeAddressTransformer();
    }

    public ZipCodeAddress findAddress(String zipCode){
         return zipCodeAddressTransformer.toAddress(findViaCepAddress(zipCode));
    }


    public ViaCepAddressResponse findViaCepAddress (String zipCode) {

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/' + zipCode + '/json/');
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse response = http.send(request);

        String payload = response.getBody();

        ViaCepAddressResponse viaCepAddressResponse = (ViaCepAddressResponse) JSON.deserialize(payload, ViaCepAddressResponse.class);

        if(response.getStatusCode() >= 400){
            throw new CalloutException('service unavailable');
        }

        return viaCepAddressResponse;
    }
}