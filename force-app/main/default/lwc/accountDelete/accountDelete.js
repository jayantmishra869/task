import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';
import getAccList from '@salesforce/apex/AccountController.getAccList';

export default class accountDelete extends LightningElement {
    accounts;
    error;
    wiredAccountsResult;

    @wire(getAccList) accounts;
    wiredAccounts(result) {
        this.wiredAccountsResult = result;
        if (result.data) {
            this.accounts = result.data;
            this.error = undefined;
        }
        else if (result.error) {
            this.error = result.error;
            this.accounts = undefined;
        }
    }
    deleteAccount(event) {
        const recordId = event.target.dataset.recordid;
        deleteRecord(recordId)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'success',
                        message: 'Account Deleted',
                        variant: 'success'

                    })
                );
                return refreshApex(this.wiredAccountsResult);
            })
            .catch((error) => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'ERROR',
                        message: 'Error Deleting Record',
                        variant: 'error'
                    })
                );
            });
    }
}


// public with sharing class AccountController{
//     @AuraEnabled(cacheable=true)
//     public static List<Account>getAccList(){
//         return [SELECT Id, Name FROM ACCOUNT ORDER BY CreatedDate desc Limit 10];

//     }
// }