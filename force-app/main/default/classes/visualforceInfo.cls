public class visualforceInfo {
    
    public Boolean userid{get;set;}
    public visualforceInfo()
    {
        User u = [select name, id from user where id = :Userinfo.getUserId() limit 1];
        if(u.id == '0055j0000050NqHAAU')
        {
            userid = true;
        }else{
            userid = false;
        }
        System.debug(userid);
    }
}