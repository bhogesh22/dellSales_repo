import { LightningElement, track, api, wire } from 'lwc';
import getContactsRelatedToAccount from '@salesforce/apex/accountcontrollerlwc.getContactsRelatedToAccount';
export default class WireFunction extends LightningElement {
@api recordId;
@track contacts;
@track respError;
@track columns = [
    {label : 'First Name', fieldName:'FirstName'},
     {label : 'Last Name', fieldName:'LastName'},
     {label : 'Email', fieldName:'Email'},
];
@wire ( getContactsRelatedToAccount,{accId:'$recordId'})
wireContactRecords({error, data}){
if(data){
    this.contacts = data;
    this.respError = undefined;
}else{
    this.respError = error;
    this.contacts = undefined;
}
}
}