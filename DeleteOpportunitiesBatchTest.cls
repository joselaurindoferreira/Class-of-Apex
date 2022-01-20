@isTest
public class DeleteOpportunitiesBatchTest {
    @testSetup
    static void setup(){
        List<Opportunity> ops = new List<Opportunity>();

        for(Integer i=0; i<200; i++){
            ops.add(new Opportunity(Name='Opp'+i, CloseDate=Date.today(), StageName='Qualification'));
        }
        insert ops;
    } 

    @isTest public static void test() {
        Test.startTest();
            DeleteOpportunitiesBatch dob = new DeleteOpportunitiesBatch();
            Database.executeBatch(dob);
        Test.stopTest();
        
        System.assertEquals(200, dob.recordsProcessed);
    }
}
