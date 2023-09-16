import { LightningElement, wire } from 'lwc';
import blmc from '@salesforce/messageChannel/basicMessageChannel__c';
import {publish, MessageContext} from 'lightning/messageService';

export default class LwcPublishLMC extends LightningElement {
@wire(MessageContext) messageContext ;

publishMessage(event) {
    const payload = {messageOne: "Salesforce Lightning Message Channel"};
    publish(this.messagecontext, blmc, payload);
}
}