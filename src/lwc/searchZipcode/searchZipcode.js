import { api, LightningElement } from 'lwc';

import searchAddress from '@salesforce/apex/SearchAddresCtrl.searchAddress';

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
        if (!event.target.value || event.target.value == this.zipCode) {
            return;
        }

        const _zipCode = Object.assign(event.target.value.replace('-', ''));

        searchAddress({ zipCode: _zipCode }).then(response => {
            let data = response;

            console.log(data);
            this.publishingAddressChanged(data);
        }).catch(response => {
            let component = this.template.querySelector("[data-name='zipcode']");
            component.setCustomValidity(response.body.message);
            component.reportValidity();
        });
    }

    publishingAddressChanged(data) {
        let searchedAddressEvent = new CustomEvent('searchedaddress', {
            detail: data
        });

        this.dispatchEvent(searchedAddressEvent);
    }
}