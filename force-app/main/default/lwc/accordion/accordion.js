import { LightningElement, track } from 'lwc';
import {deleteRecord} from 'lightning/uiRecordApi';
import getAccount from '@salesforce/apex/AccountController.getAccount';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class Accordion extends LightningElement {

    @track AccRecord
    @track ConRecord
    @track Accdata = [];
    @track error;
    @track multi = true;
    connectedCallback()
    {
        getAccount().then(result=>{
            this.Accdata = result;
            console.log(this.Accdata);
            console.log(JSON.stringify(result, null, '\t'));

        }).catch(err=>{
            this.error=err;
           
        })
    }

    deleteAcc(event)
    {
        this.AccRecord = event.target.value;
        console.log('accRecord '+this.AccRecord);
        deleteRecord(this.AccRecord);
    }
    deletecon(event)
    {
        this.ConRecord = event.target.value;
        console.log('ConRecord '+this.ConRecord);
        deleteRecord(this.ConRecord);
    }
}