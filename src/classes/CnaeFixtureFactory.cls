/**
 * @author Keetener Rodrigo
 */
@isTest
public class CnaeFixtureFactory {
    public static Cnae__c newCnae (){
        return new Cnae__c(
            Cnae__c = '21212'
            , Description__c = 'XXXXX'
        );
    }

    public static Cnae__c createCnae (){
        return createCnae(newCnae());
     }
 
     public static Cnae__c createCnae (Cnae__c cnae){
         insert cnae;
         return cnae;
     }
}