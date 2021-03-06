/**
 * @author Keetener Rodrigo
 */
@isTest
public class AccountFilterTest {
    
    @isTest
    static void filterByChangedDocumentNumberTest (){
        Map<String,SObject> records = AccountFixtureFactory.createIntegratedScenario();
        Account account = records.get('account');

        List<Account> accounts = new List<Account>();
        accounts.add(account);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedDocumentNumber(accounts, null);

        System.assertEquals(accounts.size(), filteredAccounts.size());

        filteredAccounts = filter.filterByChangedDocumentNumber(accounts, new Map<Id,Account>());

        System.assertEquals(accounts.size(), filteredAccounts.size());

        Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);

        Account changedAccount =  accounts.get(0).clone(true, true, true, true);
        changedAccount.DocumentNumber__c = 'X';
        oldAccounts.put(changedAccount.Id, changedAccount);

        filteredAccounts = filter.filterByChangedDocumentNumber(accounts, oldAccounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size());
        System.assert(filteredAccounts.size() == 1);

        accounts = new List<Account>();
        accounts.add(new Account (Name = 'Teste 01'));
        accounts.add(new Account (Name = 'Teste 02'));

        filteredAccounts = filter.filterByChangedDocumentNumber(accounts, null);

        System.assert(filteredAccounts.isEmpty());
    }
}