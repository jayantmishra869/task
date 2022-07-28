import { LightningElement } from 'lwc';
import AccList from '@salesforce/apex/sendingDataToLWC.AccList';
export default class ComboboxDemo extends LightningElement {
    value='';
    accOption=[];
    get options()
    {
        return this.accOption;
    }

    connectedCallback()
    {
        AccList()
        .then(result =>{
            let arr = [];
            for(var i=0; i<result.length; i++)
            {
                arr.push({label :result[i].Name, value: result[i].Id})
            }
            this.accOption=arr;
        })
    }

    handleChanged(event)
    {
        this.value=event.detail.value
    }
}