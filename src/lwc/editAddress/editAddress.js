import { api, LightningElement } from 'lwc';

export default class EditAddress extends LightningElement {

    @api
    address;

    constructor() {
        super();
        console.log('Run');

        this.address = {
            street: 'Rua John Trê',
            streetNumber: '123',
            additionalInfo: 'Apto',
            zipCode: '15840000',
            city: 'Itajobi',
            state: 'SP'
        }
    }

    connectedCallback() {}

    renderedCallback() {}

    handleSearchedAddress(event) {
        console.log(event.detail);
        this.address = event.detail;
    }
}