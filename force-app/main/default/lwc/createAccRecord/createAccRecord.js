import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import AccList from '@salesforce/apex/sendingDataToLWC.AccList';
import Account_Object from '@salesforce/schema/Account';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_NumberOfEmployees from '@salesforce/schema/Account.NumberOfEmployees'
export default class CreateAccRecord extends LightningElement {
    value='';
    accOption=[];
    ObjectApiName = Account_Object;
    fields = [Account_Name, Account_NumberOfEmployees]
    namefield = Account_Name;
    AccId= 'Account Id';

    get options()
    {
        return this.accOption;
    }
    
    handlesuccess(event)
    {
        this.AccId = event.detail.id;
        const events = new ShowToastEvent({
            title: 'Successfull',
            message: 'Account Created',
            variant: 'success'
        });
    }

    connectedCallback()
    {
        AccList()
        .then(result => {
            let arr = [];
            for(var i=0; i<result.length; i++)
            {
                arr.push({label :result[i].Name, value :result[i].Id})
            }
            this.accOption=arr;
        })
    }


    handlechange(event)
    {
        this.value=event.detail.value;
    }
}