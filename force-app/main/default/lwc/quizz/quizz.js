import { LightningElement, wire, track } from 'lwc';
import  getquizz  from '@salesforce/apex/AccountController.getquizz';

var i=0;
var q='';

export default class Quizz extends LightningElement {

    @track data=[];

    connectedCallback()
    {
        if(i==0)
        {
            getquizz().then(result=>{
                console.log(result[i]);
                this.data = result[i];
                i++;
            }).catch(err=>{
    
            })
        }
    }

    next(){
    getquizz().then(result=>{
        console.log(result[i]);
        this.data = result[i];
        i++;
    }).catch(err=>{

    })
}

    previous()
    {
        i--;
        getquizz().then(result=>{
            console.log(result[i]);
            this.data = result[i];
            i++;
        }).catch(err=>{
    
        })
    }

}