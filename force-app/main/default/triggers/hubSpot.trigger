trigger hubSpot on Contact (after insert) {

    if(Trigger.isafter)
    {
        if(Trigger.isInsert)
        {
            String jsonString = json.serialize(Trigger.NEW);
            hubSpotAPI.hub(jsonString);
        }
    }
}