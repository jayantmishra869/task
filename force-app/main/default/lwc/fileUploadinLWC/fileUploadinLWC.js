import { LightningElement, track } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
//import loadData from '@salesforce/apex/FileUploadController.loadData';

export default class FileUpload extends LightningElement {
    @track myRecordId;
    error;
    isLoaded = false;

    get acceptedFormats() {
        return ['.csv'];
    }
    
    uploadFileHandler( event ) {
        console.log(event)
       

        this.isLoaded = true;
        const uploadedFiles = event.detail.files;
        console.log( uploadedFiles[0].documentId);
        this.myRecordId =  uploadedFiles[0].documentId

         console.log(uploadedFiles)
        // loadData( { contentDocumentId : uploadedFiles[0].documentId } )
        // .then( result => {

        //     this.isLoaded = false;
        //     window.console.log('result ===> '+result);
        //     this.strMessage = result;
        //     this.dispatchEvent(
        //         new ShowToastEvent( {
        //             title: 'Success',
        //             message: result,
        //             variant: result.includes("success") ? 'success' : 'error',
        //             mode: 'sticky'
        //         } ),
        //     );

        // })
        // .catch( error => {

        //     this.isLoaded = false;
        //     this.error = error;
        //     this.dispatchEvent(
        //         new ShowToastEvent( {
        //             title: 'Error!!',
        //             message: JSON.stringify( error ),
        //             variant: 'error',
        //             mode: 'sticky'
        //         } ),
        //     );     

        // } )

    }
}