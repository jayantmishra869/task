import { LightningElement, track } from 'lwc';

export default class IfconditionInTemplate extends LightningElement {

    @track dynamiclabel='show';
    @track card = false;
    b=true;
    myvalue = 'Showing...'
    handlechange(event)
    {
        const label = event.target.label;
        if(label=='show')
        {
            this.dynamiclabel='Hide';
            this.card = true;
        }
        else if(label=='Hide')
        {
            this.dynamiclabel='show';
            this.card = false;
        }
    }
}