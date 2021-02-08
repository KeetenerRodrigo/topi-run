/**
 * @author Keetener Rodrigo
 */
public class ZipCodeAddressTransformer {
    public ZipCodeAddress toAddress (ViaCepAddressResponse viaCepAddress){
        
        ZipCodeAddress zipCodeAddress = new ZipCodeAddress();
        zipCodeAddress.street = viaCepAddress.logradouro;
        zipCodeAddress.city = viaCepAddress.cidade;
        zipCodeAddress.neighborhood = viaCepAddress.bairro;
        zipCodeAddress.state = viaCepAddress.uf;
        zipCodeAddress.zipCode = viaCepAddress.cep;

        System.debug(zipCodeAddress);

        return ZipCodeAddress;
    }
}