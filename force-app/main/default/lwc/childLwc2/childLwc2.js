import { LightningElement, api, track } from 'lwc';

export default class ChildLwc2 extends LightningElement {

    button1 = 'click'
   
    handlechange()
    {
        if(this.button1=='click')
        {
            this.button1='unclick';
            this.dispatchEvent(new CustomEvent('clickk'));
        }
        else
        {
            this.button1='click';
            this.dispatchEvent(new CustomEvent('unclick'));
        }
        this.dispatchEvent(new CustomEvent('button1'));
    }
    @api
    handlerefresh()
    {
        this.button1='click';
        this.dispatchEvent(new CustomEvent('refresh1'));
    }
}