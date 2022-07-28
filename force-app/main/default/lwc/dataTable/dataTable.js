import { LightningElement } from 'lwc';
import acc from '@salesforce/apex/AccountController.getAccount';
import con from '@salesforce/apex/AccountController.getContact';
export default class DataTable extends LightningElement {

    accounts;
    contacts;
    error
    error1;


    button() 
    {
        acc()
        .then((result) => 
        {
                this.accounts = result;
                this.error = undefined;
        })
        .catch((error) => {
                this.error = error;
                this.accounts = undefined       
        });
    }
    button1()
    {
        con()
        .then((result) => 
        {
                this.contacts = result;
                this.error1 = undefined;
        })
        .catch((error1) => 
        {
                this.error1 = error1;
                this.contacts = undefined       
        });
    }   
}