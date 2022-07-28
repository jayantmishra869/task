trigger Assignment4q6 on Lead (after insert) 
{
    for(lead l: Trigger.new)
    {
        if(l.LeadSource == 'Phone Inquiry')
        {
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadID(l.Id);
            lc.convertedstatus = 'Closed - Converted';
            lc.ownerid = '0055j0000050NqH';
            Database.LeadConvertResult lcr = Database.convertLead(lc);
        }
    }
}