import { LightningElement,track,api } from 'lwc';
export default class QsChild extends LightningElement {
    @track messageFromParent = 'Loading............';

    @api
    getMessageFromParent(responce){
        this.messageFromParent = responce;
    }
}