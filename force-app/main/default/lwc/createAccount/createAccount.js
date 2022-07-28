import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
export default class CreateAccount extends LightningElement {

    strName='';

    handler(event)
    {
        this.strName= event.target.value;
    }

    addAccount()
    {
        var field = {'Name' : this.strName};

        var objRecordInput = {'apiName':'Account', field};

        createRecord(objRecordInput).then(response=>{
            alert('Account record created successfully: '+response.id);
        }).catch(error=>{
            alert('Error: '+JSON.stringify(error));
        })
    }
}