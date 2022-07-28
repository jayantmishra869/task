public class q1 
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
}