import { api, LightningElement } from 'lwc';

export default class SearchZipcode extends LightningElement {

    @api
    zipCode

    constructor() {
        super();
        console.log('Run');
    }

    connectedCallback() {}

    renderedCallback() {}

    handleBlur(event) {
        if (!event.target.value) {
            return;
        }

        this.publishingAddressChanged();
    }

    publishingAddressChanged() {
        let searchedAddressEvent = new CustomEvent('searchedaddress', {
            detail: {
                street: 'John Four',
                streetNumber: '2020',
                additionalInfo: 'Apto',
                zipCode: '15840000',
                city: 'Itajobi',
                state: 'SP'
            }
        });

        this.dispatchEvent(searchedAddressEvent);
    }
}