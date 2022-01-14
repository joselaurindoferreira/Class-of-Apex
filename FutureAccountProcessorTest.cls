@IsTest
public class FutureAccountProcessorTest {
    public static void TestFutureAccountProcessorTest() {
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        Contact cont = New Contact();
        cont.FirstName ='Bob';
        cont.LastName ='Masters';
        cont.AccountId = a.Id;
        Insert cont;
        
        List<Id> accId = new List<Id>();
        accId.add(a.Id);
 
        Test.startTest();
            FutureAccountProcessor.countContacts(accId);
        Test.stopTest();
        
        Account conta = [SELECT Number_of_Contacts__c FROM Account WHERE Id =: a.Id];
        System.assertEquals ( Integer.valueOf(conta.Number_of_Contacts__c) ,1);
  }
  
}
