import { LightningElement } from 'lwc';

export default class BindExpressionFromJS extends LightningElement {
    FullName
    phone
    email
    handlechanger(event){
        const field = event.target.name;
        if(field=='FullName')
        {
            this.FullName = event.target.value;
            // FullName=FullName.toUpperCase();
        }
        else if(field=='phone')
        {
            this.phone = event.target.value;
        }
        else if(field=='email')
        {
            this.email = event.target.value;
        }
    }
}