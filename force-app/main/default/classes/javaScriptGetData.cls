public class javaScriptGetData 
{
   
	public static PageReference jsgetData()
    { 
        string data;
        String email = ApexPages.currentPage().getparameters().get('code');
        String dev = ApexPages.currentPage().getparameters().get('dev');
        String admin = ApexPages.currentPage().getparameters().get('admin');
        String blockchain = ApexPages.currentPage().getparameters().get('blockchain');
		system.debug('data= ');        
        System.debug('Email= '+email+' dev= '+dev+' admin= '+admin+ ' blockchain= '+blockchain);
        
        
        if(dev != 'undefined')
        {
            data += dev+',';
        }
        if(admin != 'undefined')
        {
            data += admin+',';
        }
        if(blockchain != 'undefined')
        {
            data += blockchain;
        }
        
        System.debug(data);
        JSstudent__c aa = new JSstudent__c(Name = email, Courses__c = data);
        insert(aa);
        
        JSstudent__c getdata = [SELECT Name, Courses__c FROM JSstudent__c ORDER BY CreatedDate DESC LIMIT 1];
        
        PageReference pref = new Pagereference('http://127.0.0.1:5500/create1.html?email='+getdata.Name+'&courses='+getdata.Courses__c);
        pref.setRedirect(true);
        return pref;
    }

}