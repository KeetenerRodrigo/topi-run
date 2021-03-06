/**
 * @author Keetener Rodrigo
 */
public class AccountValidator {
    public List<Account> validateDocumentNumber(List<Account> accounts){

        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        for(Account account: accounts){

            if(!validator.isCNPJ(account.DocumentNumber__c) && !validator.isCPF(account.DocumentNumber__c)){
                account.DocumentNumber__c.addError('CPF or CNPJ Invalid');
            }
            
        }

        return accounts;
    }
}