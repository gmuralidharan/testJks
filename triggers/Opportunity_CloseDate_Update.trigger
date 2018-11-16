trigger Opportunity_CloseDate_Update on Opportunity (after update) {
   
   
    //check the opprtunites in the trigger to see if the Close Date change
    //if so add them to a Set
    Set<Id> modOppIds = new Set<Id>();
    for(Integer i=0;i<trigger.new.size();i++){
        if(trigger.new[i].CloseDate <> trigger.old[i].CloseDate ){
            modOppIds.add(Trigger.new[i].id);
        }
    }     

    //Process any opps that have changed
    if(modOppIds.size() > 0){
        //get all of the opportunities tied to opportunity Line items in this trigger
        List<Opportunity> oliList = [select Id, Name, CloseDate, (select Id, ServiceDate, OpportunityId from OpportunityLineItems) from Opportunity where Id IN :modOppIds];
         
        //create list to hold opportunity line items that need updating.
        List<OpportunityLineItem> oliUpdateList = new List<OpportunityLineItem>();
         
        //loop through opportunites and update all of the opportunity line items. add line items to udpated list.
        for(Opportunity o : oliList){
            for(OpportunityLineItem oli : o.OpportunityLineItems){
                oli.ServiceDate = o.CloseDate;
                oliUpdateList.add(oli);
            }
        }
         
        //update the line items
        if(!oliUpdateList.isEmpty()){
            update oliUpdateList;
        }
    }
}