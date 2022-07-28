import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.AccountNumber';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class CreateRecordUsingLWC extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;
    fields = [NAME_FIELD,PHONE_FIELD,REVENUE_FIELD];

    handlesuccess(event)
    {
        const toastEvent = new ShowToastEvent({
            title: "Account has been created successfully !",
            message: "Account Created: "+event.details.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}