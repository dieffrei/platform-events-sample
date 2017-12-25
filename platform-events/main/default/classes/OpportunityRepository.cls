public with sharing class OpportunityRepository implements Repository {
    
    public Opportunity findById(Id opportunityId) {
        return this.findById(new Set<Id>{opportunityId})[0];
    }

    public List<Opportunity> findById(Set<Id> opportunityIds) {
        return [SELECT Id, 
                Name, 
                Salesperson__c, 
                Salesperson__r.Name, 
                StageName, 
                Type, 
                Amount, 
                AccountId, 
                Account.Name,
                (SELECT Id, 
                 	Name, 
                 	Product2Id, 
                 	Product2.Name, 
                 	ProductCode, 
					Quantity, 
                 	UnitPrice, 
                 	TotalPrice, 
                 	Subtotal 
                    FROM OpportunityLineItems)
                FROM Opportunity WHERE Id =: opportunityIds];
    }
    
}