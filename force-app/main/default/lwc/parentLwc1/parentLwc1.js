import { LightningElement } from 'lwc';

export default class ParentLwc1 extends LightningElement {
    startcounter=0;

    handlestartchange(event)
    {
        this.startcounter = parseInt(event.target.value);
    }

    handlecounter()
    {
        console.log('aa');
        const updatecounter = this.template.querySelector('c-child-lwc1');
        updatecounter.maxiicounter();
    }
}