import { LightningElement,api } from 'lwc';

export default class ChildLwc1 extends LightningElement {

    @api counter =0;

    @api maxiicounter()
    {
        this.counter = this.counter+100;
        console.log(this.counter);
    }
}