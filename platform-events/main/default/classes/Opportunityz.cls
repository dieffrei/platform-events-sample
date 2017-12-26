public class Opportunityz {
    public String name;
    public Id id;
    public Id salesPersonId;
    public String salesPersonName;
    public Id accountId;
    public String accountName;
    public Date closeDate;
    public String stageName;
    public List<OpportunityLineItemz> items;

    private transient OpportunityRepository repository;
    
    public Opportunityz(){
		this.repository = new OpportunityRepository(); 
        this.items = new List<OpportunityLineItemz>();
    }
    
    public Opportunityz(Id opportunityId) {
        this();
        buildWith(opportunityId);
    }
    
    public Opportunityz(Opportunity record) {
        this();
        buildWith(record);
    }
    
    public Opportunityz buildWith(Opportunity record) {
        this.id = record.Id;
        this.name = record.Name;
        this.salesPersonId = record.Salesperson__c;
        this.salesPersonName = record.Salesperson__r.Name;
        this.accountId = record.AccountId;
        this.accountName = record.Account.Name;
        this.closeDate = record.CloseDate;
        this.stageName = record.StageName;

        for (OpportunityLineItem item : record.OpportunityLineItems) {
            this.items.add(new OpportunityLineItemz(item));
        }
            
        return this;
    }

    public Opportunityz buildWith(Id opportunityId) {
        return buildWith(this.repository.findById(opportunityId));
    }
    
    public Opportunityz dispatch() {
        OpportunityStatus__e evt = new OpportunityStatus__e();
        evt.Payload__c = JSON.serialize(this);
        EventBus.publish(evt);
        return null;
    }
    
}