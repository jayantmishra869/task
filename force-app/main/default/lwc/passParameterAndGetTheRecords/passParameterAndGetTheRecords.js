import { LightningElement, wire } from 'lwc';
import findAccountList from '@salesforce/apex/AccountController1.findAccList';

export default class PassParameterAndGetTheRecords extends LightningElement {
    
    searchKey='';

    @wire(findAccountList,{keyword:'$searchKey'})
    accounts;
    handleonchange(event)
    {
        this.searchKey = event.target.value;
    }
}