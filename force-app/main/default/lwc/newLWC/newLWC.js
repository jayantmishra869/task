import { LightningElement } from 'lwc';

export default class NewLWC extends LightningElement {

    myValue = "LWC";
    showMe = false;
    handlechange(event){
        this.showMe = event.target.checked;
    }
}