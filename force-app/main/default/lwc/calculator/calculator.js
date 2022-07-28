import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    n1;
    n2;
    a=0;
    input1(event)
    {
        this.n1 = event.target.value;
        console.log(this.n1);
    }
    input2(event)
    {
        console.log(event.target.value);
        this.n2 = event.target.value;
        console.log(this.n2)
    }
    Add()
    {
        this.a = parseInt(this.n2) + parseInt(this.n1);
        console.log(this.a);
    }
    subtract()
    {
        this.a = parseInt(this.n2) - parseInt(this.n1);
        console.log(this.a);
    }
    multiply()
    {
        this.a = parseInt(this.n2) * parseInt(this.n1);
        console.log(this.a);
    }
    divide()
    {
        this.a = parseInt(this.n2) / parseInt(this.n1);
        console.log(this.a);
    }
    clear()
    {
        this.a = this.a * 0;
    }
}