import { LightningElement, track, wire } from 'lwc';
import getAccList from '@salesforce/apex/AccountController.getAccList'

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Account Id', fieldName: 'Id'}
];

export default class WireDemo extends LightningElement {
    
    @track columns = columns;
    @track data = [];

    @wire(getAccList)
    wireddemo({data, error}){
        if(data)
        {
            this.data = data;
        }
        else if(error)
        {
            console.log('Error .....');
        }
    }
    }