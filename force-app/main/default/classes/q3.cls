public class q3 
{
	public static void test1()
    {
        List<Integer> l1 = new List<Integer>{1,4,7,8};
        List<Integer> l2 = new List<Integer>{2,5,3,6,4,8,9};
        List<Integer> l3 = new List<Integer>{9,5,2,7,4};
        
        System.debug('Hello');
            
        //if((l1.size() < = l2.size()) && (l1.size() < = l3.size()))
        //{
            for(Integer j = 0; j < l1.size(); j++)
            {
        		for(Integer i = 0; i < l2.size(); i++)
            	{
                    for(Integer k = 0; k < l3.size(); k++)
                    {
                		if((l1[j] == l2[i]) && (l1[j] == l3[k]))
                		{
                       	System.debug('Duplicate Values = '+ l1[j]);
                		}
                    }   
            	}
            }   
        //}
        
      /*  else if((l2.size() < = l1.size()) && (l2.size() < = l3.size()))
        {
            for(Integer j = 0; j < l1.size()-1; j++)
            {
        		for(Integer i = 0; i < l2.size()-1; i++)
            	{
                	if((l2[j] == l1[i]) && (l2[j] == l3[i]))
                	{
                       System.debug('Duplicate value ='+ l2[j]);
                	}
            	}
            }   
        }
                   
         else
         {
             for(Integer j = 0; j < l1.size()-1; j++)
             {
          		for(Integer i = 0; i < l3.size()-1; i++)
            	{
                	if((l3[j] == l1[i]) && (l3[j] == l2[i]))
                   	{
                       System.debug('Duplicate value ='+ l3[j]);
                   	}
                }   
            }             
         }*/
    }
}