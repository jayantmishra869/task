import { LightningElement,api } from 'lwc';

export default class ParentLwc2 extends LightningElement {
   
    visible = false;
    handleIncrease()
    {
        this.dispatchEvent(new CustomEvent('grandparent'))
    }
    parenthandlerefresh()
    {
        this.dispatchEvent(new CustomEvent('grandrefresh'))
    }

    @api
    rr()
    {
        console.log('qqq');
        this.template.querySelector('c-child-lwc2').handlerefresh();
    }

    show()
    {
        this.visible=true;
    }
    @api
    hide()
    {
        this.visible=false;
    }
}