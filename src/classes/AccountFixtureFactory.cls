/**
 * @author Keetener Rodrigo
 */
@isTest
public class AccountFixtureFactory {
    public static Account newAccount ( String name, String documentNumber
                                     , City__c city, Cnae__c cnae ){

        Account account = newAccount(name, documentNumber);
        account.BillingCity__c = city.Id;
        account.BillingCity__r = city;
        account.Cnae__c = cnae.Id;
        account.Cnae__r = cnae;

        return account;
    }


    public static Account newAccount (String name, String documentNumber){
        return new Account(Name = name, DocumentNumber__c = documentNumber);
    }

    public static Account createAccount (String name, String documentNumber){
        return createAccount(newAccount(name, documentNumber));
    }

    public static Account createAccount(String name, String documentNumber
                                        , City__c city, Cnae__c cnae ){
                                           
        return createAccount(newAccount(name, documentNumber, city, cnae));
    }

    public static Account createAccount(Account account){
        insert account;
        return account;
    }

    
    public static Map<String,SObject> createIntegratedScenario(){

        Map<String,SObject> records = new Map<String,SObject> ();

        City__c city = CityFixtureFactory.createCity();
        records.put('city-sp', city);

        Cnae__c cnae = CnaeFixtureFactory.createCnae();
        records.put('cnae', cnae);

        Account account = createAccount('Bisso Account', '40078569826', city, cnae);
        records.put('account', account);

        return records;
    }
}