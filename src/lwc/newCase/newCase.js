import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'

export default class NewCase extends LightningElement {

    handleSuccess() {
        const toast = new ShowToastEvent({
            variant: 'success',
            title: 'Case Success Created',
            message: 'Caso criado com sucesso!!!',
        });
        this.dispatchEvent(toast);
    }

    constructor() {
        super();
        console.log('Run');
    }

    connectedCallback() {
        console.log('Connected')
    }

    renderedCallback() {
        console.log('Rendered Callback')
    }
}