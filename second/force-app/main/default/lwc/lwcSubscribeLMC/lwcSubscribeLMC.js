import { LightningElement, wire } from 'lwc';
import blmc from '@salesforce/messageChannel/basicMessageChannel__c';
import {subscribe, unsubscribe, APPLICATION_SCOPE, MessageContext} from 'lightning/messageService';

export default class LwcSubscribeLMC extends LightningElement {
message='loading...';
subscription = null;

@wire(MessageContext)
messageContext;

connectedCallback() {
    this.subscribeToMessageChannel();
}

disconnectedCallback() {
    this.unsubscribeToMessageChannel();
}

subscribeToMessageChannel() {
    if (!this.subscription) {
        this.subscription = subscribe(
            this.messageContext,
             blmc,
            (message) => this.handleMessage(message),
             { scope: APPLICATION_SCOPE }
    );
    }
}

unsubscribeToMessageChannel() {
    unsubscribe(this.subscription);
    this.subscription = null;
}

handleMessage(message) {
    this.message = message.messageOne;
}
}