import { LightningElement } from 'lwc';

export default class BindHTML extends LightningElement {

    myvar = 'lwc bolt...';
    handlechange(event){
        this.myvar = event.target.value
    }
}