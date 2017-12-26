public class BillingService {
    @InvocableMethod
    public static void sentToBillingSystem(List<Id> opportunityIds) {
        new Opportunities(new Set<Id>(opportunityIds)).dispatch();
    }
}