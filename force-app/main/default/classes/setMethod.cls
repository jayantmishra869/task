public class setMethod 
{
	public static void set()
    {
        List<Integer> l1 = new List<Integer>();
        l1.add(1);
        l1.add(2);
        l1.add(3);
        System.debug(l1);
        
        Set<Integer> s1 = new Set<Integer>();
        s1.add(4);
        s1.add(5);
        s1.add(6);
        System.debug(s1);
        
        s1.addall(l1);  // Adding values in list using addall method/function
        System.debug(s1);
        
        System.debug(s1.contains(6));  // using contains method we can 6 is in s1 or not
        System.debug(s1.containsAll(l1));
        
        System.debug(s1.retainAll(l1)); // delete all the elements of set accept l1(elements)
        System.debug(s1); // out put(1,2,3)
        
        // Double to Integer
       	Double i = 589.8;
        Integer val = (Integer)i;
        System.debug(val);
        
        Set<Integer> s = s1.clone();
        System.debug(s);
        
        s1.remove(2);	// remove the element 3 from set
        System.debug(s1);
        
        s1.removeAll(l1); // remove all the element of list from set
        System.debug(s1);
    }
}