public class BillingService {
	
    @InvocableMethod
    public static void sentToBillingSystem(List<Id> opportunityIds) {
        Set<Id> ids = new Set<Id>();
        ids.addAll(opportunityIds);
        new Opportunities(ids).dispatch();
    }
    
}