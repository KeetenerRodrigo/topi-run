import { LightningElement } from 'lwc';

export default class AccountBillingAddress extends LightningElement {

    billingAddress;

    constructor() {
        super();
        console.log('Run');

        this.billingAddress = {
            street: 'Rua John Doe',
            streetNumber: '123',
            additionalInfo: 'Apto',
            zipCode: '15840000',
            city: 'Itajobi',
            state: 'SP'
        }
    }

    connectedCallback() {}

    renderedCallback() {}
}