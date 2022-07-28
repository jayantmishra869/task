import { LightningElement, wire } from 'lwc';
import {getSObjectValue} from '@salesforce/apex';
import getSingleAcc from '@salesforce/apex/AccountController.getSingleAccount';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Name';
export default class RecentlyCreatedRecords extends LightningElement {
    @wire(getSingleAcc) account;
    get name()
    {
        return this.account.data ? getSObjectValue(this.account.data, NAME_FIELD):'';
    }
    get phone()
    {
        return this.account.data ? getSObjectValue(this.account.data, PHONE_FIELD):'';
    }
}