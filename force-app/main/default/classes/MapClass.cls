public class MapClass 
{
	public static void hmap()
    {
        Map<Integer, String> mmap = new Map<Integer, String>();
        
        mmap.put(1, 'Jay');
       	mmap.put(2, 'Rohan');
        mmap.put(3, 'Aman');
        System.debug(mmap);
        mmap.put(1, 'Shanu');
        System.debug(mmap);
        
        Map<Integer, String> smap = new Map<Integer, String>{1 => 'Neeraj', 2 => 'Karan'};
            System.debug(smap);
        
        mmap.putAll(smap);  //Put all the values from smap to mmap
        System.debug(mmap);
        
        System.debug(mmap.get(1));  // get the value which is on 1
        
        List<String> l1 = new List<String>();
        l1 = mmap.values();
        System.debug('List = '+ l1);
        
        Map<Integer, String> o = new Map<Integer, String>();
        o = mmap.clone();
        System.debug('o ='+ o);
        
        System.debug('Key ='+ mmap.keySet());
        System.debug(mmap.containsKey(3));
        mmap.remove(3);
        System.debug(mmap);
    }
}