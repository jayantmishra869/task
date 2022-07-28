import { LightningElement, track } from 'lwc';
import getAccList from '@salesforce/apex/AccountController.getAccList';
import fetchFiles from '@salesforce/apex/AccountController.fetchFiles';
export default class FileUpload extends LightningElement {

    @track Account;
    @track RecordId;
    @track fetch;
    @track v=0;
    @track visibel=false;
    @track fetchdata = [{}];
    @track file={};
    @track data=
    [
        { label:'File Name', fieldName:'Title'} 
    ];
    @track fileType='';
    @track doc;
    @track actions=
    [
        { label: 'Upload File', name: 'UploadFile'}
    ]
    @track columns = 
    [
        { label: 'Name', fieldName: 'Name'},
        { label: 'Number of Employees', fieldName: 'NumberOfEmployees'},
        {
            type: 'action',
            typeAttributes: {rowActions: this.actions}
        },
        
    ]
    

    get acceptedFormats() 
    {
        return ['.pdf','.png','.jpg','.txt'];
    }
    connectedCallback()
    {
        getAccList().then((result)=>{
            this.Account=result;
            console.log(JSON.parse(JSON.stringify(this.Account)));
            console.log('pp ',this.Account);
        })
    }

    UploadAction(event)
    {
        this.RecordId = event.detail.row.Id;
        console.log('Id= ',this.RecordId);
    }

    handleUploadFinished()
    {
        console.log('After Upload Function');
        fetchFiles({recordId:this.RecordId})
        .then((result)=>
        {
            this.fetch=result;
            this.fetchdata = this.fetch;
            console.log(this.fetchdata);
            
            this.v=this.fetchdata.length-1;
            if(this.v<0)
            {
                this.v=0;
                console.log('less than 0 = ',this.v);
            }
            else
            {
                console.log(this.v);
                this.file = this.fetchdata[this.v];
                console.log(this.fetchdata[this.v]);
                console.log('done ',this.file);
                console.log('file Extension= ',JSON.parse(JSON.stringify(this.file.ContentDocument.FileType)));
                this.doc = JSON.parse(JSON.stringify(this.file.ContentDocument));
                console.log('doc Title= ',this.doc.Title);
                this.fileType = JSON.parse(JSON.stringify(this.file.ContentDocument.FileType));
                console.log('fileType= ',this.fileType);
                if(this.fileType=='TEXT')
                {
                    console.log('data....');
                    this.data=[
                        { label:'File Name', fieldName: 'Title'},
                        {
                            fieldName: '',
                            label: 'File Icon',
                            cellAttributes: { iconName: 'doctype:txt' }
                        }
                    ]
                    this.data=null;
                    this.data=[
                        { label:'File Name', fieldName: 'Title'},
                        {
                            fieldName: '',
                            label: 'File Icon',
                            cellAttributes: { iconName: 'doctype:txt' }
                        }
                    ]

                }
            }
        })
        .catch((error)=>
        {
            console.log(error);
        }) 
    }
}