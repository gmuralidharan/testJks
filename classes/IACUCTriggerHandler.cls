public with sharing class IACUCTriggerHandler {

public static void OnBeforeInsert(IACUCApplication__c[] newForms){
            for(IACUCApplication__c newForm : newForms){
            if((newForm.Text_Field_1__c == null || newForm.Text_Field_2__c == null || newForm.Text_Field_3__c == null) && newForm.Status__c=='Submit' ){
                newForm.addError('Please enter all the required fields');
            }
           }
         }

      
         
public static void OnBeforeUpdate( Map<ID, IACUCApplication__c> oldFormMap, Map<ID, IACUCApplication__c> newFormMap){
       for (Id formId : newFormMap.keyset())
       {
                IACUCApplication__c newForm=   newFormMap.get(formId ); 
                IACUCApplication__c oldForm=   oldFormMap.get(formId ); 
                if(newForm.Status__c=='Submit' && (newForm.Text_Field_1__c == null || newForm.Text_Field_2__c == null || newForm.Text_Field_3__c == null)){
                newForm.addError('Please enter all the required fields before Submission');
            }
       }   
}
}