public class FutureAccountProcessor {
  @future
  public static void countContacts(List<Id> Ids) 
  {
      List<Account> listAccount = [SELECT Id,Number_of_Contacts__c , (SELECT Id FROM Contacts ) FROM Account WHERE Id IN : Ids];
      for( Account acc : listAccount )
      {
          List<Contact> listContact = acc.Contacts ;
          
          acc.Number_of_Contacts__c = listContact.size();
      }
      update listAccount;
  }
}