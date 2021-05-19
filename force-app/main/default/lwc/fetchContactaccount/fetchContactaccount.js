import { LightningElement, wire } from 'lwc';

import getContactList from '@salesforce/apex/ContactAuraService.getContactList';

 

export default class LWCWireExample extends LightningElement {

    @wire(getContactList) contacts;

}