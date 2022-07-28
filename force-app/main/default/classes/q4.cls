public class q4 
{
	public static void test1()
    {
        List<Integer> l1 = new List<Integer>{149,1,3,248,2,8,70,5};
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