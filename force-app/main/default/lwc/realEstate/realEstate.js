import { LightningElement,track } from 'lwc';

import real from '@salesforce/schema/realEstate__c';
import getReal from '@salesforce/apex/AccountController.getReal';

import getRealName from '@salesforce/schema/realEstate__c.Name';
import getRealUrl from '@salesforce/schema/realEstate__c.imgUrl__c';

export default class RealEstate extends LightningElement {

    @track data=[];
    @track visible=false;
    @track NameData;
    @track UrlData;
    @track error;
    
    // objectName='';
    // fieldName=[];

    connectedCallback()
    {
        getReal().then(result => {
            console.log(result);
            this.data=result
        }).catch(err=>{

        })
    }

    call()
    {
        this.visible=true;
    }

    addName(event)
    {
        this.NameData = event.target.value;
    }

    addUrl(event)
    {
        this.UrlData = event.target.value;
    }

    closeModal() {
        // to close modal set visible tarck value as false
        this.visible = false;
    }
    // submitDetails() {
    //     this.visible = false;
        objectName = real;
        fieldName = [getRealName, getRealUrl];
    
}