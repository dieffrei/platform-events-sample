public class Opportunityz {
    
    public Id salesPersonId;
    public String salesPersonName;

    public Id accountId;
    public String accountName;
    
    public Date closeDate;
    
    private OpportunityRepository repository;
    
    public Opportunityz(){
		this.repository = new OpportunityRepository(); 
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
        this.salesPersonId = record.Salesperson__c;
        this.salesPersonName = record.Salesperson__r.Name;
        this.accountId = record.AccountId;
        this.accountName = record.Account.Name;
        this.closeDate = record.CloseDate;
        return this;
    }

    public Opportunityz buildWith(Id opportunityId) {
        return buildWith(this.repository.findById(opportunityId));
    }
    
    public Opportunityz dispatch() {
        Opportunity__e evt = new Opportunity__e();
        evt.Payload__c = JSON.serialize(this);
        EventBus.publish(evt);
        return this;
    }
    
}