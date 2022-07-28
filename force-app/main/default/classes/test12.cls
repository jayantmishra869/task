public class test12 
{
	public static void q1()
    {
        List<List<Integer>> li = new List<List<Integer>>{new List<Integer>{1,2,3}, new List<Integer>{4,5,6}, new List<Integer>{7,8,9}};
     	List<List<Integer>> lo = new List<List<Integer>>();
        Integer f = 0;
        for(Integer o = f; o < 3; o++)
        {
            for(Integer i = f; i < 3; i++)
            {
                for(Integer j = i; j < i+1; j++)
                {
                    lo.add(li[i]);
                    
                }
            }
            f = f + 1;
        }
        System.debug(lo);
    }
}