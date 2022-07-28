public class pickClass {
    
    public String selectedObject {get;set;}
    public List<sObject> objFields {get;set;}
    public List<String> result {get;set;}
    
    public pickClass(){
        selectedObject = 'none';
    }
    public List<SelectOption> getobjectNames(){  
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Case','Case'));
        options.add(new SelectOption('Contact','Contact'));
        options.add(new SelectOption('Opportunity','Opportunity'));
        return options;
    }
    
    public void fetchFields(){
        result = new List<String>();
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        Schema.sObjectType objType = globalDescription.get(selectedObject);  
        Schema.DescribeSObjectResult r1 = objType.getDescribe();
        
        Map<String , Schema.SObjectField> mapFieldList = r1.fields.getMap();  
        
        for(Schema.SObjectField field : mapFieldList.values()){  
            Schema.DescribeFieldResult fieldResult = field.getDescribe();  
            
            if(fieldResult.isAccessible()){  
                result.add(fieldResult.getName());
            }  
        }
        Integer i = 0;
        String fieldsToFetch = '';
        for(String temp:result){      
            Integer len = result.size();
            if(i==len-1){
                fieldsToFetch = fieldsToFetch + temp;
            }
            else{
                fieldsToFetch = fieldsToFetch + temp + ',';
            }
            i++;
        }
        try{
            String sql = ' SELECT ' + fieldsToFetch + ' FROM ' + selectedObject + ' ORDER BY CreatedDate DESC LIMIT 5';
            objFields = Database.Query(sql);
        }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
    }  
}