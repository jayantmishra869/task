import { LightningElement, wire } from 'lwc';
import AccList from '@salesforce/apex/sendingDataToLWC.AccList';
export default class GettingAccountList extends LightningElement {

    @wire(AccList)
    acc;
}