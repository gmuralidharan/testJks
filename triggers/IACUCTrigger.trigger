trigger IACUCTrigger on IACUCApplication__c (before insert, before update) {
    
    //IACUCTriggerHandler handler= new IACUCTriggerHandler();
    
    if(Trigger.isInsert && Trigger.isBefore)
    {
        IACUCTriggerHandler.OnBeforeInsert(Trigger.new);
    }
    
    if(trigger.isBefore && trigger.isUpdate)
    {
         IACUCTriggerHandler.OnBeforeUpdate(Trigger.oldMap, Trigger.newMap);
    }
     
}