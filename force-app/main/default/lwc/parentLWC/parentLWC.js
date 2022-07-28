import { LightningElement } from 'lwc';

export default class ParentLWC extends LightningElement {
    countValue = 0;

    handleDecrement()
    {
        this.countValue--;
    }
    handleIncrement()
    {
        this.countValue++;
    }
    handleMultiply(event)
    {
        const multiplyingNumber = event.detail;
        this.countValue = this.countValue * multiplyingNumber;
    }
    clearnow()
    {
        this.countValue = this.countValue * 0;
    }
}