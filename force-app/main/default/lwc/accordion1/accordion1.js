import { LightningElement, track } from 'lwc';
import  getAccConOpp from '@salesforce/apex/AccountController.getAccConOpp';
import { deleteRecord } from 'lightning/uiRecordApi';


export default class Accordion1 extends LightningElement {

    @track accData;
    @track multi=true;
    @track accid;
    @track conDelete;
    @track oppDelete;
    connectedCallback()
    {
        getAccConOpp().then(result=>{
            this.accData = result;
        })
    }
    deletefun(event)
    {
        // deleteco();   
        this.accid = event.target.value;
        console.log(this.accid);
        deleteRecord(this.accid);
        console.log('deleted');
        this.conDelete = this.template.querySelector('./con').value;
        console.log('conId= ',this.conDelete);
        this.oppDelete = this.template.querySelector('./opp').value;
        console.log('oppId= ',this.oppDelete);  

    }
    // deletecon(event)
    // {
    //     this.conDelete = event.target.value;
    //     console.log('Contact= ',this.conDelete);
    //     // deleteRecord(this.conDelete);
    //     // console.log('contact deleted');
    // }
}