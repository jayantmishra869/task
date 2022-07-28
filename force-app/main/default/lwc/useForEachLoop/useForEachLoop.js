import { LightningElement } from 'lwc';

export default class UseForEachLoop extends LightningElement {
    students=[
        {
            Id : '001',
            Name : 'jayant',
            Class : 'Class1',
            Fee : '100'
        },
        {
            Id : '002',
            Name : 'Mohit',
            Class : 'Class2',
            Fee : '101'
        },
        {
            Id : '003',
            Name : 'Rohan',
            Class : 'Class3',
            Fee : '102'
        }
    ];
}