trigger TranslateAPI on Account (after insert) 
{
    if(Trigger.isafter)
    {
        if(Trigger.isInsert)
        {
            String jsonString = json.serialize(Trigger.NEW);
            googleTranslateAPI2.trans(jsonString);
        }
    }
}