public class ContactTriggerHelper{
   public void createCaseOnCondition(List<Contact> contacts){
       
       List<Case> casesToCreate = new List<Case>();
              for(Contact con:contacts){
       //If email is not null create a case    
           if(con.Email != '' || con.Email != null){

               Case caseToAdd = new Case();
               caseToAdd.ContactId = con.Id;
               caseToAdd.Subject= 'Auto Case using trigger for '+con.FirstName+' '+con.LastName; 
//If account exists add account info to case               
 If(con.AccountId!=null)
                {
                caseToAdd.AccountId = con.AccountId;
                }
               casesToCreate.add(caseToAdd);
           }
       }
//DML to insert into object
       insert casesToCreate;
   }
}