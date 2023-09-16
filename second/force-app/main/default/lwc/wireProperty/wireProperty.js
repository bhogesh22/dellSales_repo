import { LightningElement, track, wire, api } from 'lwc';
import getContactsRelatedToAccount from '@salesforce/apex/accountcontrollerlwc.getContactsRelatedToAccount';
export default class WireProperty extends LightningElement {
@api recordId;
@track columns = [
    {label : 'First Name', fieldName:'FirstName'},
     {label : 'Last Name', fieldName:'LastName'},
     {label : 'Email', fieldName:'Email'},
];
@wire ( getContactsRelatedToAccount,{accId:'$recordId'}) contacts ;
}