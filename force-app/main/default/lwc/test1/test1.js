import { LightningElement, track, wire } from 'lwc';
import getCoursesdata from '@salesforce/apex/AccountController.getCoursesdata';




export default class Test1 extends LightningElement {
    action = [
        { label: 'Edit', name: 'edit' },
        { label: 'View', name: 'view' }

    ];
    @track columns = [
        { label: 'Trainee', fieldName: 'Name' },
        { label: 'Marks(Out of 5)', fieldName: 'Overall_Marks__c' },
        { label: 'Pass', fieldName: '', cellAttributes: { iconName: { fieldName: 'icon__c' } } },
        {
            type: 'action',
            typeAttributes: { rowActions: this.action }
        },
    ];
    @track recordId;
    data = [];
    @track trainee;
    @track show = false;
    @track edit = false;
    @track objectApiName = "trainee__c";

    connectedCallback() {
        getCoursesdata()
            .then((result) => {
                this.data = result
                console.log(this.data)
            })
    }






    handleRawAction(event) {
        var actionName = event.detail.action.name;
        const row = event.detail.row;
        console.log('row= ', row);
        console.log(actionName);
        switch (actionName) {
            case 'view':
                this.callviewPage(row)
                break;
            case 'edit':
                this.dataedit(row)
                break;
        }

    }
    callviewPage(rowData) {
        this.show = true;
        console.log('rowData= ', rowData);
        this.trainee = rowData;
        console.log(this.trainee.Id);
        console.log(this.trainee.Name);
    }

    hideModalBox() {
        this.show = false;
        this.edit = false
    }

    dataedit(rowData) {

        this.edit = true;
        this.trainee = rowData.Id;
        this.recordId = this.trainee;
        console.log('editId= ', this.recordId);
    }

}