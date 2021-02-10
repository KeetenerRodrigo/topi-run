import { api, LightningElement } from 'lwc';

export default class EditAddress extends LightningElement {

    @api
    address;

    set localAddress(address) {
        this._address = Object.assign(address);
        this.dispatchChangedAddress();
    }

    get localAddress() {
        return this._address;
    }

    constructor() {
        super();
        console.log('Run');

        this.address = {
            street: 'Rua John Trê',
            streetNumber: '123',
            zipCode: '15840000',
            city: 'Itajobi',
            state: 'SP'
        }
    }

    connectedCallback() {
        this.localAddress = this.address;
    }

    renderedCallback() {}

    handleSearchedAddress(event) {
        this.address = event.detail;
        this.localAddress = event.detail;
    }

    dispatchChangedAddress() {
        let changedAddressEvent = new CustomEvent('addresschanged', {
            detail: this.localAddress
        });

        this.dispatchEvent(changedAddressEvent);
    }

    handleChange(event) {
        this.localAddress = Object.assign(this.localAddress, {
            [event.target.name]: event.target.name
        });
    }
}