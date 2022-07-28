public class test13 
{
	public static void q1()
    {
        List<List<Integer>> oldList=new List<List<Integer>>{new list<Integer>{1,2,3},new list<Integer>{4,5,6},new list<integer>{7,8,9}} ;
        List<List<Integer>> z = new List<List<Integer>>();
       // for(integer i=0;i<3;i++)
        //{
        //    for(integer j=0;j<3;j++)
        //    {
        //        integer f=oldList[j][i];
               
        //        z[i][j]= oldList[j][i];
        //    }
        //}
     //System.debug(z);
        //For(integer i=0;i<3;i++)
        //{
        //     System.debug(z[i]);
        //}
        for(integer i=0;i<oldList.size();i++){
            List<integer> a = new List<Integer>();
            for(integer j=0;j<oldList[i].size();j++){
				a.add(oldList[j][i]);
				               
            }
            z.add(a); 
            System.debug(z);
        }
    }
}