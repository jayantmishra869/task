import { LightningElement } from 'lwc';

export default class ChildLwc extends LightningElement {

    handleAdd()
    {
        this.dispatchEvent(new CustomEvent('add'));
    }
    handleSubstract()
    {
        this.dispatchEvent(new CustomEvent('substract'));
    }
    handleMultiply(event)
    {
        const valueForMultiply = event.target.value;
        this.dispatchEvent(new CustomEvent('multiply', {
            detail : valueForMultiply
        }))
    }
    clear()
    {
        this.dispatchEvent(new CustomEvent('clear'));
    }

}