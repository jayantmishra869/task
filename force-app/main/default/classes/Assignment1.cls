public class Assignment1 
{
	public static void test1()
    {
		List<List<String>> lList = new List<List<String>>();
        List<String> l1 = new List<String>{'a;b;a;v;c','x;x;y;c;q'};
        List<String> l2 = new List<String>{'m;b;h;j;m','u;k;j;u'};
        
        Set<Set<String>> sSet = new Set<Set<String>>();
        
        String s1 = l1[0];
        String s2 = l1[1];
        String s3 = l2[0];
        String s4 = l2[1];
        
        Set<String> ss1 = new Set<String>(s1.split(';'));
        Set<String> ss2 = new Set<String>(s2.split(';'));
        Set<String> ss3 = new Set<String>(s3.split(';'));
        Set<String> ss4 = new Set<String>(s4.split(';'));
        
        sSet.add(ss1);
        sSet.add(ss2);
        sSet.add(ss3);
        sSet.add(ss4);
        
        System.debug(sSet);
        
    }
    
    public static void test2()
    {
        List<Integer> l1 = new List<Integer>{1,2,3,4,5,6,7};
        for(Integer i = 0; i < 7; i++)
        {
            Integer r = l1.remove(l1.size()-1);
            l1.add(0,r);
        }
        System.debug(l1);
        
        List<Integer> l2 = new List<Integer>{1,2,3,4,5,6,7,8,9};
        for(Integer j = 0; j < 5; j++)
        {
            l2.add(l2.remove(0));
        }
        System.debug(l2);
    }
    
    public static void test3()
    {
        List<Integer> l1 = new List<Integer>{1,4,7,8};
        List<Integer> l2 = new List<Integer>{2,5,3,6,4,8,9};
        List<Integer> l3 = new List<Integer>{9,5,2,7,4};
        
        System.debug('Hello');
            
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
        
    }
    
    public static void test4()
    {
        List<Integer> l1 = new List<Integer>{149,1,3,248,2,8,70,5,10};
        for(Integer i = 0; i < l1.size()-1; i++)
        {
            Integer count = 0;
            for(Integer j = i; j < l1.size()-1; j++)
            {
                if(l1[i] < l1[j+1])
                {
                    count = count + 1;
                }
            }
            if(count == 0)
            {
                System.debug('LEADERS ='+ l1[i]);
            }
        }
    }
    
}