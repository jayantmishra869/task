public class firstApexclass
{
	public void function()
    {
        integer a=10;
        System.debug('Hello world'+' a = '+a);
        integer b = 100;
        integer c = 10, d = 20;
        System.debug(b-c);
        System.debug(b-d);
        long x = 2147483648L;
        System.debug(x);
        double z = 87.2;
        System.debug(z);    
        Date d1, d2;
        d1 = Date.today();
        System.debug(d1);
        d1 = Date.newInstance(2018,05,31);
        d2 = Date.today();
        System.debug(d1);
        System.debug('Starting month ='+ d2.toStartOfMonth());
        System.debug('Starting Week ='+ d2.toStartOfWeek());
        Time t1;
        t1 = Time.newInstance(05,55,45,15);
        System.debug(t1);
        t1 = t1.addHours(2);
        System.debug(t1);
        t1 = t1.addMinutes(20);
        System.debug(t1);
        t1 = t1.addSeconds(60);
        System.debug(t1);
        String s = '7876dvfdv54df87';
        ID i = s;
        System.debug(i);
    }
}