import { LightningElement,track } from 'lwc';
export default class CeParent extends LightningElement {
    @track parentMessage='loading.....';
   parentHandler(event){
        this.parentMessage = event.detail;
    }
}