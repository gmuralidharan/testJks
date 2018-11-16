trigger ContactTrigger on Contact (after insert, after update) {
    ContactTriggerHelper helper = new ContactTriggerHelper();
//Call helper method to create case if trigger is on update/insert
    if((Trigger.isAfter && Trigger.isInsert) || (Trigger.isAfter && Trigger.isUpdate)){
        helper.createCaseOnCondition(Trigger.new);
    }
}