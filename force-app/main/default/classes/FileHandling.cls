public class FileHandling 
{
	public static void myMethod()
    {
        try
        {
            Integer a;
            Integer b = a*5;
            System.debug('No Error');
        }
        catch(Exception e)
        {
            System.debug('Error Occured');
        }
        finally
        {
            System.debug('finally');
        }
    }
}