public class OpportunityLineItemz {
	Id productId;
    String productName;
    String productCode;
    Decimal unitPrice;
	Decimal quantity;
    
    public OpportunityLineItemz(OpportunityLineItem record) {
        this.buildWith(record);
    }
    
    public OpportunityLineItemz buildWith(OpportunityLineItem record) {
        this.productId = record.Product2Id;
        this.productName = record.Product2.Name;
        this.productCode = record.ProductCode;
        this.unitPrice = record.UnitPrice;
        this.quantity = record.Quantity;
        return this;
    }
}