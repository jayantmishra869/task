public class removeDuplicate 
{
	public static void q1()
    {
        List<Contact> conList = [SELECT Name FROM Contact];
        
        Map<String, ID> mmap = new Map<String, ID>();
        
        for(Contact c: conList)
        {
            mmap.put(c.Name, c.id);
        }
        
        Set<ID> uniqSet = new Set<ID>();
        Set<String> s1 = mmap.keySet();
        
        for(String s: s1)
        {
            uniqSet.add(mmap.get(s));
        }
        List<sObject> lo = new List<sObject>();
        List<sObject> del = new List<sObject>();
        for(Contact k: conList)
        {
            if(uniqSet.Contains(k.id))
            {
                lo.add(k);
            }
            else
            {
                del.add(k);
            }
        }
        System.debug('Unique List = '+lo);
        System.debug('Deleted List = '+del);
    }
}