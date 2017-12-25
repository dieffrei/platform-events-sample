public class Opportunities {
    
    private List<Opportunityz> opps;

    public Opportunities(Set<Id> opportunityIds) {
        this.opps = new List<Opportunityz>();
        for(Opportunity record : new OpportunityRepository().findById(opportunityIds)) {
            this.opps.add(new Opportunityz(record));
        }
    }

    public Opportunities dispatch() {
        for (Opportunityz opp : this.opps) {
            opp.dispatch();
        }
        return this;
    }
}