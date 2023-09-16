import { LightningElement } from 'lwc';
export default class CeChild extends LightningElement {
handleChange(event){
    event.preventDefault();
const cmsg = event.target.value;     //single parameter
// const cmsg={custname:'bhogesh',custphone:'97004556525'}   // multiple parameters
    const childEvent = new CustomEvent ('mychildevent',{detail:cmsg});
    this.dispatchEvent(childEvent);
}

}