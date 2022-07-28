trigger ApexTrigger on Account (before insert) 
{
    Account a=trigger.new[0];
    a.Name=a.Name+' limit';
}