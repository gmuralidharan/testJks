trigger OpporutnityStageAlertTrigger on Opportunity (after update) {
    // Create an instance of the helper class
    OpportunityStageAlertTriggerHelper helper = new OpportunityStageAlertTriggerHelper();
        // Call helper method incase of insert/update
    if((Trigger.isAfter && Trigger.isUpdate)){

        helper.OpportunityStageAlert(Trigger.new);
    }
}