/**
* @author Keetener Rodrigo
*/

public virtual class Customer {

    Decimal amount;
    Double descount;

    String name;
    String status;
    
    CustomerType type;
    
    List<Contact> contacts;

    Set<Contact> createdContacts;

    //index
    Map<String, Contact> regionContacts = new Map<String, Contact>{
        'SP' => new Contact( FirstName = 'Barretos'),
        'SP' => new Contact( FirstName = 'Itajobi')
    };

    // agrupamento
    Map<String, Contact> contactsByRegion = new Map<String, Contact>{
        'SP' => new List<Contact> {new Contact( FirstName = 'Barretos')},
        'SP' => new List<Contact> {new Contact( FirstName = 'Itajobi')}
    };

    public List<Contact> filterContactByRegion(){
        List<Contact> filterContacts = new List<Contact>();
        
        for (Contact contact: this.contacts){
            filterContacts.add(contact);
        }
        
        return filterContacts;
    }


    virtual 
    public void save (){
    }

    enum CustomerType{
        PRIME, STANDARD, PREMIUM
    }
}