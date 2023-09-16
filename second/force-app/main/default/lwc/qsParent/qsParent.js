import { LightningElement } from 'lwc';
export default class QsParent extends LightningElement {
    handleChange(event){
        this.template.querySelector('c-qs-Child').getMessgeFromParent(event.target.value);
    }
}