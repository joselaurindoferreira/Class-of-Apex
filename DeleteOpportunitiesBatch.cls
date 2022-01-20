public class DeleteOpportunitiesBatch implements
Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id FROM Opportunity ORDER BY CLoseDate LIMIT 1'
        );
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> records){
        for(Opportunity op : records){
            recordsProcessed = recordsProcessed + 1;
            delete op;
        }
    }

    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' registros processados');
    }
}
