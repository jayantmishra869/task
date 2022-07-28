import { LightningElement} from 'lwc';

export default class GrandparentLwc2 extends LightningElement {

    countValue=0;
    cc=0;
    handlegrand()
    {
        if(this.cc==0)
        {
            this.cc=this.cc+1;
            this.countValue++;
        }
        else
        {
            this.cc=this.cc-1;
            this.countValue = this.countValue - 1;
        }
    }
    handlegrandrefresh()
    {
        this.countValue =  this.countValue * 0;
        this.cc = 0;
        this.template.querySelector('c-parent-Lwc2').rr();
        this.template.querySelector('c-parent-Lwc2').hide();
        console.log('zzz');
    }
}