public class q2 
{
	public static void test1()
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
}