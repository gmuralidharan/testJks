public class OpportunityStageAlertTriggerHelper{

   public void OpportunityStageAlert(List<Opportunity> ops){
//Create list for email messages
   Messaging.reserveSingleEmailCapacity(trigger.size);
   List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
//For each opportunity modified send an email if stage is changed
for(Opportunity opp:ops){
       system.debug(opp);

       system.debug(opp.StageName);
       User ow=[SELECT Id, Name,Email FROM User WHERE Id=:opp.OwnerId];
       system.debug(ow.Email);
       system.debug(Trigger.oldMap.get(opp.Id).get('StageName'));
      if(opp.StageName!= Trigger.oldMap.get(opp.Id).get('StageName')){
          Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
          email.setToAddresses(new String[] {ow.Email});
          email.setReplyTo('XXX@XXX.com');
          email.setSenderDisplayName('Mr Apex Tester');
          email.setSubject('Subjected to Learning');
          email.setPlainTextBody('The stage has been changed');
          emails.add(email);
      }
  }
//Send emails for all opportunities modified
  Messaging.sendEmail(emails);
 }
 }