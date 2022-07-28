import { LightningElement, track } from 'lwc';
import getAccList from '@salesforce/apex/AccountController.getAccList';
import getAccNameField from '@salesforce/schema/Account.Name';
import getOppList from '@salesforce/apex/AccountController.getOppList';
import getOppNameField from '@salesforce/schema/Opportunity.Name';
import getOppStageNameField from'@salesforce/schema/Opportunity.StageName';
import getOppCloseDateField from '@salesforce/schema/Opportunity.CloseDate';
import getConList from '@salesforce/apex/AccountController.getConList';
import getConLastName from '@salesforce/schema/Contact.LastName';

export default class InsertAndupsertData extends LightningElement {
    
    @track objName;
    @track Acc=false;
    @track field=[];
    @track data=[];
    @track Opp=false;
    @track fieldOpp=[];
    @track editVal=false;
    @track con=false;
    @track fieldCon=[];
    objValue()
    {
        this.objName = this.template.querySelector(".input1").value;
        console.log(this.objName);
        if(this.objName=='Account')
        {
             this.Opp=false;
             this.con=false;
             this.Acc=true;
            
            console.log('Account running');
            getAccList().then(reslut=>{
                this.data = reslut;
                console.log(this.data);
            })
            this.field=[];
            this.field=[getAccNameField];
            console.log('Acc fields= ',this.field);
        }
        else if(this.objName=='Opportunity')
        {
             this.Acc=false;
             this.con=false;
             this.Opp=true;
            console.log('Opportunity running');
            getOppList().then(result=>{
                this.data = result;
                console.log(this.data);
            })
            this.fieldOpp=[];
            this.fieldOpp = [getOppNameField,getOppStageNameField,getOppCloseDateField];
            console.log('Opp fields= ',this.fieldOpp);
        }
        else if(this.objName=='Contact')
        {
            this.Acc=false;
            this.Opp=false;
            this.con=true;
            console.log('Contact running');
            getConList().then(result=>{
                this.data = result;
                console.log(this.data);
                this.fieldCon=[];
                this.fieldCon = [getConLastName];
                console.log('Con field= ',this.fieldCon);
            })

        }
    }
    connectedCallback()
    {
        this.editVal = true;
    }

    // updateRecordView() {
    //     setTimeout(() => {
    //          eval("$A.get('e.force:refreshView').fire();");
    //     }, 1000); 
    //  }
}